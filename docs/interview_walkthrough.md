# Interview Walkthrough

## 60-second version
This is an independent insurance and annuity semantic-modeling project. I began with business concepts such as customer, policy, annuity contract, owner, annuitant, beneficiary, product, producer, agency, contribution, distribution, rider, claim and underwriting. I created conceptual and logical models, then implemented a normalized SQL physical model. I used a party-role pattern so a customer can be an owner, annuitant or beneficiary with effective dates rather than hard-coding those roles into the contract table. I mapped the physical assets into an RDF/OWL ontology, added SHACL and SQL validation, and wrote SPARQL and Neo4j examples for relationship traversal. Finally, I documented S3/Iceberg mapping, lineage, Git-based release management and a GraphRAG pattern that uses the governed ontology as enterprise context.

## Deep-dive talking points
1. Explain why role modeling is preferable to owner_id/beneficiary_id columns.
2. Explain conceptual vs logical vs physical vs semantic models.
3. Show how `CONTRACT_PARTY_ROLE` maps to `hasOwner`, `hasAnnuitant`, and `hasBeneficiary`.
4. Demonstrate beneficiary-allocation DQ checks.
5. Explain RDF triples and OWL subclassing.
6. Explain SHACL as graph validation rather than business inference.
7. Discuss S3 raw -> Iceberg conformed -> semantic layer.
8. Explain how GraphRAG retrieves governed relationships and returns source references.

## Honest positioning
This repository is an independent hands-on project using synthetic data. It demonstrates domain learning and implementation capability; it should not be presented as production work performed for an insurer.
