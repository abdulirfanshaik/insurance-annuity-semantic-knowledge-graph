# Business Problem

An insurer may have customer, policy/contract, product, producer, transaction, beneficiary, underwriting and claims data distributed across multiple systems. Reporting teams often recreate definitions independently, producing inconsistent meanings for terms such as active contract, owner, annuitant, contribution, surrender, producer-of-record and death benefit.

## Objective
Create a reusable semantic architecture that:
- establishes canonical insurance/annuity concepts and relationships;
- separates business meaning from physical implementation;
- maps concepts to authoritative data assets;
- supports data quality and lineage;
- enables graph traversal and semantic search;
- provides governed context for AI/GraphRAG applications.

## Example Questions
- Which customers own active annuity contracts?
- Who is the annuitant and who are the beneficiaries for each contract?
- Which producer/agency sold a given annuity product?
- What contributions, withdrawals and distributions occurred during a period?
- Are beneficiary allocations valid and complete?
- Which physical fields support the semantic definition of Account Value?
