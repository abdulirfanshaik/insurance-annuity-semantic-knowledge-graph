# Interview Guide

## Insurance & Annuity Semantic Knowledge Graph

**Project Type:** Independent hands-on portfolio project  
**Purpose:** Demonstrate insurance and annuity domain modeling, enterprise data modeling, ontology/semantic modeling, knowledge graphs, governance, and modern data architecture using synthetic data.

---

## 1. 60-Second Project Introduction

I built this independent Insurance & Annuity Semantic Knowledge Graph project to strengthen my hands-on understanding of the insurance and annuity domain from both traditional enterprise data-modeling and modern semantic-modeling perspectives.

I started by defining core business concepts such as Customer, Policy, Annuity Contract, Product, Owner, Annuitant, Beneficiary, Producer, Agency, Rider, Contribution, Withdrawal, Distribution, Underwriting, and Claims. I then created conceptual, logical, and physical data models and implemented the physical model using SQL.

From there, I mapped the physical data structures into an RDF/OWL ontology, added SHACL validation rules, and created SPARQL and Neo4j/Cypher queries for relationship traversal. I also documented source-to-semantic mappings, metadata, lineage, governance, and a Git-based model release lifecycle.

Finally, I designed an AWS S3 and Apache Iceberg architecture and a GraphRAG pattern that uses governed ontology concepts and knowledge-graph relationships as grounding for semantic search and AI retrieval.

---

## 2. 2-Minute Detailed Walkthrough

The business problem I modeled is that insurance and annuity information is usually distributed across customer, policy or contract administration, producer, product, transaction, beneficiary, underwriting, claims, and reporting systems. Different systems may use different identifiers and definitions for the same business concept.

I solved that by creating a governed semantic model that separates business meaning from physical implementation.

At the conceptual level, I modeled Party, Product, Contract, Producer, Agency, Transaction, Rider, Claim, and Underwriting Case.

At the logical level, I used a Party-Role pattern so a single person can act as an Owner, Annuitant, or Beneficiary without hard-coding those roles as columns on the Contract table.

At the physical level, I created normalized SQL structures for Contract, Party, Contract Party Role, Product, Producer, Agency, Contract Transaction, Account Value, Rider, Claim, and Underwriting Case.

For semantic modeling, I created RDF/RDFS/OWL classes and relationships such as hasOwner, hasAnnuitant, hasBeneficiary, hasProduct, servicedByProducer, affiliatedWithAgency, hasTransaction, hasRider, hasClaim, and hasUnderwritingCase.

I added SHACL validation for graph constraints and SQL checks for referential integrity, duplicate relationships, beneficiary allocations, lifecycle validity, and reconciliation.

I then documented how S3 and Apache Iceberg could support raw and conformed data layers, with the semantic layer mapping governed business concepts back to physical assets.

For AI use cases, I designed a GraphRAG pattern where structured graph relationships and governed business definitions are retrieved before information is passed to a language model.

---

## 3. Architecture

```text
Synthetic Insurance / Annuity Sources
        |
        v
AWS S3 Raw Layer
        |
        v
Apache Iceberg Conformed Layer
        |
        v
SQL Data Quality & Reconciliation
        |
        v
Source-to-Semantic Mapping
        |
        v
RDF / RDFS / OWL Ontology
        |
        +--> SHACL Validation
        +--> SPARQL Queries
        +--> Neo4j / Cypher
        |
        v
Knowledge Graph
        |
        v
Semantic Search / GraphRAG
```

---

## 4. Key Domain Concepts

### Insurance
- Policy
- Customer / Party
- Product
- Premium
- Rider
- Claim
- Underwriting Case
- Producer / Agent
- Agency
- Beneficiary
- Policy lifecycle

### Annuity
- Annuity Contract
- Owner
- Annuitant
- Beneficiary
- Fixed / Indexed / Variable Annuity Product
- Contribution
- Withdrawal
- Distribution
- Surrender
- Account Value
- Death Benefit
- Rider
- Producer / Agency
- Contract lifecycle

---

## 5. Why Use a Party-Role Model?

Instead of putting columns such as `owner_id`, `annuitant_id`, and `beneficiary_id` directly on the Contract table, I created a `CONTRACT_PARTY_ROLE` relationship.

This supports:
- multiple beneficiaries;
- changing roles over time;
- effective dating;
- beneficiary allocation percentages;
- one person holding multiple roles;
- reusable modeling across products.

This is more flexible and closer to enterprise insurance modeling.

---

## 6. Conceptual vs Logical vs Physical vs Semantic Model

**Conceptual model:** Defines high-level business concepts and relationships.

**Logical model:** Defines entities, attributes, keys, cardinality, and normalization without tying the model to a specific technology.

**Physical model:** Defines implementation details such as SQL tables, columns, datatypes, constraints, indexes, and storage.

**Semantic model / ontology:** Defines business meaning in a machine-readable form using classes, relationships, hierarchies, vocabulary, and constraints.

---

## 7. RDF, RDFS, OWL, and SHACL

**RDF** represents facts as subject-predicate-object triples.

Example:

```text
AnnuityContract1001 -> hasOwner -> Party1
AnnuityContract1001 -> hasBeneficiary -> Party3
```

**RDFS** provides schema concepts such as classes, subclasses, domains, and ranges.

**OWL** supports richer ontology semantics such as class hierarchies and formal relationships.

**SHACL** validates graph structure and data constraints. For example, every Contract should have at least one Owner and one Product.

---

## 8. Example Knowledge-Graph Relationships

```text
Customer
   |
   | OWNS
   v
Annuity Contract
   |
   +---- HAS_ANNUITANT ----> Person
   |
   +---- HAS_BENEFICIARY --> Person
   |
   +---- HAS_PRODUCT ------> Annuity Product
   |
   +---- SERVICED_BY ------> Producer
   |
   +---- HAS_TRANSACTION --> Contribution / Withdrawal / Distribution
   |
   +---- HAS_RIDER --------> Rider
```

---

## 9. Data Quality Checks

Important validations include:

- Contract must reference a valid Product.
- Contract Party Role must reference valid Party and Contract records.
- Active annuity contract should have an Owner.
- Annuity contract should have an Annuitant.
- Beneficiary allocations should not exceed 100%.
- Duplicate active party-role relationships should be detected.
- Transaction amount should not be null.
- Effective-from date should not be after effective-to date.
- Account Value should be associated with a valid Contract.
- Producer relationship should reference a valid Producer.
- Claim and Underwriting records should reference valid contracts where applicable.

---

## 10. Source-to-Semantic Mapping Example

| Physical Asset | Semantic Concept |
|---|---|
| contract | Contract / AnnuityContract / InsurancePolicy |
| contract_party_role | Owner / Annuitant / Beneficiary |
| product | Product / AnnuityProduct |
| contract_transaction | Contribution / Withdrawal / Distribution |
| account_value | AccountValue |
| producer | Producer |
| agency | Agency |
| claim | Claim |
| underwriting_case | UnderwritingCase |

---

## 11. AWS / Iceberg Explanation

I designed the architecture with:

- **Amazon S3** for raw and curated object storage.
- **Apache Iceberg** for governed analytical tables, schema evolution, partition evolution, snapshots, and time travel.
- **SQL validation** between source, conformed, and semantic layers.
- **Semantic mappings** from Iceberg assets to ontology classes and properties.

This allows the semantic layer to remain stable even when underlying physical implementations evolve.

---

## 12. GraphRAG Use Case

Example business question:

> Who are the beneficiaries of an active annuity contract owned by a specific customer?

GraphRAG flow:

1. Resolve the customer entity.
2. Traverse the Owner relationship to the Annuity Contract.
3. Traverse the Beneficiary relationships.
4. Retrieve governed glossary definitions and source lineage.
5. Provide the structured graph facts to the language model.
6. Return an answer grounded in governed enterprise data.

This is stronger than relying only on vector similarity because the model retrieves explicit business relationships.

---

# Probable Interview Questions

## Q1. Why did you build this project?

I wanted to deepen my practical understanding of insurance and annuity data models and connect that domain knowledge with my existing experience in enterprise data modeling, semantic architecture, SQL, cloud data platforms, governance, and knowledge graphs.

---

## Q2. What is the difference between an insurance policy and an annuity contract?

In this project I modeled both under a broader Contract concept because they share common lifecycle and party relationships. An insurance policy primarily represents an insurance agreement, while an annuity contract is modeled around accumulation and/or distribution of value. The semantic model keeps the common Contract abstraction while preserving product-specific subclasses.

---

## Q3. What are Owner, Annuitant, and Beneficiary?

The **Owner** controls contractual ownership rights.  
The **Annuitant** is the person whose life or age is associated with certain annuity benefits or payout calculations.  
The **Beneficiary** is designated to receive applicable benefits according to contract terms.

I model them as party roles rather than separate person entities.

---

## Q4. Why not put owner_id directly on the Contract table?

Because enterprise insurance data can involve multiple beneficiaries, role changes, effective dates, and the same person acting in multiple roles. A Party-Role bridge provides better flexibility, history, and normalization.

---

## Q5. How did you model beneficiary allocations?

The Contract Party Role model contains the Beneficiary role and an allocation percentage. I validate that active beneficiary allocations for a contract remain within defined business rules.

---

## Q6. What is semantic harvesting?

Semantic harvesting is the process of extracting business meaning from existing physical assets such as SQL schemas, stored procedures, ETL logic, reports, BI semantic layers, metadata, and business documentation. Those findings are then reviewed and incorporated into a governed semantic model.

---

## Q7. What is the difference between RDF and Neo4j?

RDF is a graph data model based on triples and is commonly used with standards such as RDFS, OWL, and SPARQL. Neo4j uses the labeled property graph model and Cypher. The same business relationships can be represented in either approach, but their modeling and query ecosystems differ.

---

## Q8. How would you validate an ontology?

I would validate it at several levels:

1. Syntax validation.
2. Class and property consistency.
3. Domain and range validation.
4. SHACL data constraints.
5. Competency-question testing with SPARQL.
6. SME review of definitions and relationships.
7. Physical-to-semantic reconciliation.
8. Regression testing before promotion.

---

## Q9. What are competency questions?

Competency questions are business questions the ontology must be able to answer.

Examples:
- Who owns an active annuity contract?
- Who are the beneficiaries?
- Which producer sold or services the contract?
- Which product is associated with the contract?
- What contributions and distributions occurred?
- Which physical source fields support the semantic concept?

---

## Q10. How would you handle ontology changes?

I would use Git-based version control, peer review, automated validation, compatibility analysis, DEV/QA/STAGE testing, version tagging, release notes, and controlled promotion.

---

## Q11. How does data governance relate to ontology?

Governance establishes approved definitions, ownership, stewardship, lineage, quality expectations, and authoritative sources. The ontology makes much of that business meaning machine-readable and reusable across applications.

---

## Q12. How do you connect a semantic model to physical data?

I maintain explicit mappings between semantic classes/properties and physical tables/columns, along with transformation rules and source lineage. That makes every semantic concept traceable to underlying data.

---

## Q13. What is the hardest modeling decision in this project?

One important decision was separating Party identity from Contract Party Role. That avoided hard-coding insurance roles into the core customer entity and supported temporal, many-to-many relationships such as multiple beneficiaries.

---

## Q14. How would this model support reporting?

The semantic layer provides consistent business definitions while the physical model supports SQL and analytical workloads. Reporting teams can use governed definitions for concepts such as Active Contract, Beneficiary, Contribution, Distribution, Producer, and Product instead of independently recreating business rules.

---

## Q15. How would this support AI?

The ontology and knowledge graph provide governed context, entity relationships, and business vocabulary. A GraphRAG application can retrieve this structured context before generating an answer, improving grounding and traceability.

---

# Behavioral / Scenario Questions

## If a business SME and developer disagree on a definition

I would first capture both interpretations and identify the business process and source systems behind each definition. I would then review examples, downstream usage, regulatory or reporting implications, and existing metadata. Rather than forcing an immediate technical definition, I would facilitate agreement on the business meaning first, document it in the glossary, obtain ownership approval, and then implement the semantic and physical mapping.

---

## If an AI-generated ontology proposes incorrect relationships

I would treat AI output as a candidate, not an authoritative model. I would validate the suggested classes and relationships against business requirements, existing physical data, governance standards, competency questions, and SME feedback. Only reviewed and approved changes would enter the controlled model lifecycle.

---

## If a source-system schema changes

I would assess lineage and mapping impact, identify affected ontology concepts and downstream consumers, update the physical mapping, run regression tests and data-quality validation, and promote the change through the controlled release lifecycle.

---

# How to Position This Project

Use this wording:

> This is an independent hands-on portfolio project that I built using synthetic data to strengthen my insurance and annuity domain knowledge and demonstrate how I would approach enterprise semantic modeling, ontology design, physical-data mapping, governance, knowledge graphs, and GraphRAG.

Do **not** present this repository as production work completed for an insurance company.

---

# Closing Summary

This project demonstrates an end-to-end approach to:

- Insurance and annuity domain modeling
- Conceptual, logical, physical, and semantic modeling
- RDF / RDFS / OWL
- SHACL validation
- SPARQL
- Neo4j / Cypher
- SQL data quality and reconciliation
- AWS S3
- Apache Iceberg
- Metadata and lineage
- Data governance
- Git-based semantic model lifecycle
- Knowledge graphs
- Semantic search
- GraphRAG
