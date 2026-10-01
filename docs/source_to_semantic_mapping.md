# Source-to-Semantic Mapping

| Semantic Concept | Physical Asset | Mapping Rule |
|---|---|---|
| AnnuityContract | contract | contract_type = 'ANNUITY' |
| InsurancePolicy | contract | contract_type = 'INSURANCE' |
| Owner | contract_party_role | role_type = 'OWNER' |
| Annuitant | contract_party_role | role_type = 'ANNUITANT' |
| Beneficiary | contract_party_role | role_type = 'BENEFICIARY' |
| AnnuityProduct | product | product_family = 'ANNUITY' |
| Contribution | contract_transaction | transaction_type = 'CONTRIBUTION' |
| Withdrawal | contract_transaction | transaction_type = 'WITHDRAWAL' |
| Distribution | contract_transaction | transaction_type = 'DISTRIBUTION' |
| AccountValue | account_value.account_value | value at as_of_date |
| servicedByProducer | contract_producer | active producer relationship |

Mappings should be versioned and reviewed because changes to physical values can alter semantic meaning without changing table structure.
