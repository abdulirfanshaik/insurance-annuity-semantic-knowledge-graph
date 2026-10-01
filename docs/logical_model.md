# Logical Model

## Main Entities
- PARTY(party_id, party_type, first_name, last_name, birth_date)
- PRODUCT(product_id, product_name, product_type, product_family)
- CONTRACT(contract_id, contract_number, product_id, contract_type, status, issue_date, effective_date)
- CONTRACT_PARTY_ROLE(contract_id, party_id, role_type, allocation_pct, effective_from, effective_to)
- AGENCY(agency_id, agency_name)
- PRODUCER(producer_id, agency_id, producer_name)
- CONTRACT_PRODUCER(contract_id, producer_id, role_type, effective_from, effective_to)
- RIDER(rider_id, rider_name, rider_type)
- CONTRACT_RIDER(contract_id, rider_id, effective_date)
- CONTRACT_TRANSACTION(transaction_id, contract_id, transaction_type, amount, transaction_date)
- ACCOUNT_VALUE(contract_id, as_of_date, account_value)
- UNDERWRITING_CASE(underwriting_id, contract_id, status, opened_date, decision_date)
- CLAIM(claim_id, contract_id, claim_type, status, claim_date, benefit_amount)

## Cardinality Rules
- Product 1:M Contract.
- Contract M:N Party through ContractPartyRole.
- Contract M:N Producer through ContractProducer.
- Contract 1:M Transaction.
- Contract 1:M AccountValue snapshot.
- Contract M:N Rider through ContractRider.
