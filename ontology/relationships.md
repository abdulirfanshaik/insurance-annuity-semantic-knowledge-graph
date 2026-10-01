# Semantic Relationships

- Contract `hasOwner` Party
- AnnuityContract `hasAnnuitant` Person
- Contract `hasBeneficiary` Party
- Contract `hasProduct` Product
- Contract `servicedByProducer` Producer
- Producer `affiliatedWithAgency` Agency
- Contract `hasTransaction` ContractTransaction
- Contract `hasRider` Rider
- Contract `hasClaim` Claim
- Contract `hasUnderwritingCase` UnderwritingCase

Production implementations would typically reify temporal role relationships or represent them as relationship entities so allocation and effective-date metadata can be retained in the graph.
