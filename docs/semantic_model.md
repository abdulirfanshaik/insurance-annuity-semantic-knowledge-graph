# Semantic Model

## Core Classes
Party, Person, Product, InsuranceProduct, AnnuityProduct, Contract, InsurancePolicy, AnnuityContract, Producer, Agency, Rider, ContractTransaction, Contribution, Withdrawal, Distribution, Claim and UnderwritingCase.

## Important Object Properties
- `hasOwner`
- `hasAnnuitant`
- `hasBeneficiary`
- `hasProduct`
- `servicedByProducer`
- `affiliatedWithAgency`
- `hasTransaction`
- `hasRider`
- `hasClaim`
- `hasUnderwritingCase`

## Why Semantics?
A physical foreign key says two records are connected. The ontology additionally captures what the relationship means, domain/range expectations, class hierarchy, reusable vocabulary and machine-readable constraints.
