-- Contract counts by product family/status.
SELECT p.product_family, c.status, COUNT(*) contract_count
FROM contract c JOIN product p ON c.product_id=p.product_id
GROUP BY p.product_family,c.status;

-- Net synthetic annuity cash flow by contract.
SELECT c.contract_number,
 SUM(CASE WHEN t.transaction_type IN ('CONTRIBUTION','PREMIUM') THEN t.amount ELSE 0 END) inflows,
 SUM(CASE WHEN t.transaction_type IN ('WITHDRAWAL','DISTRIBUTION','SURRENDER') THEN t.amount ELSE 0 END) outflows
FROM contract c JOIN contract_transaction t ON c.contract_id=t.contract_id
WHERE c.contract_type='ANNUITY'
GROUP BY c.contract_number;

-- Current contractual parties for traceability.
SELECT c.contract_number,r.role_type,p.first_name,p.last_name,r.allocation_pct
FROM contract c JOIN contract_party_role r ON c.contract_id=r.contract_id JOIN party p ON p.party_id=r.party_id
WHERE r.effective_to IS NULL
ORDER BY c.contract_number,r.role_type;
