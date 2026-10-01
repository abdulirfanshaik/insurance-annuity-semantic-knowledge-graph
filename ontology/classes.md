# Ontology Classes

`Party -> Person`

`Product -> InsuranceProduct, AnnuityProduct`

`Contract -> InsurancePolicy, AnnuityContract`

`ContractTransaction -> Contribution, Withdrawal, Distribution`

Additional classes: Producer, Agency, Rider, Claim, UnderwritingCase.

Subclassing lets consumers ask for all Contracts while retaining annuity- or insurance-specific meaning.
