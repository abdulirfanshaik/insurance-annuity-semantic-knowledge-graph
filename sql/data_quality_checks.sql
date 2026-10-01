-- 1. Active contracts must have at least one active owner.
SELECT c.contract_number
FROM contract c
LEFT JOIN contract_party_role r ON r.contract_id=c.contract_id AND r.role_type='OWNER' AND r.effective_to IS NULL
WHERE c.status='ACTIVE'
GROUP BY c.contract_number
HAVING COUNT(r.party_id)=0;

-- 2. Current beneficiary allocations should total 100% when beneficiaries exist.
SELECT c.contract_number, SUM(r.allocation_pct) AS beneficiary_pct
FROM contract c JOIN contract_party_role r ON c.contract_id=r.contract_id
WHERE r.role_type='BENEFICIARY' AND r.effective_to IS NULL
GROUP BY c.contract_number
HAVING ABS(SUM(r.allocation_pct)-100.00) > 0.01;

-- 3. Annuity contracts should have an active annuitant.
SELECT c.contract_number
FROM contract c
WHERE c.contract_type='ANNUITY'
AND NOT EXISTS (SELECT 1 FROM contract_party_role r WHERE r.contract_id=c.contract_id AND r.role_type='ANNUITANT' AND r.effective_to IS NULL);

-- 4. Orphan transactions.
SELECT t.* FROM contract_transaction t LEFT JOIN contract c ON t.contract_id=c.contract_id WHERE c.contract_id IS NULL;

-- 5. Invalid temporal ranges.
SELECT * FROM contract_party_role WHERE effective_to IS NOT NULL AND effective_to < effective_from;
