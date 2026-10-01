# Insurance & Annuity Semantic Knowledge Graph

**Independent Hands-on Portfolio Project**

An end-to-end insurance and annuity data-modeling project demonstrating conceptual, logical, physical, and semantic modeling; RDF/RDFS/OWL; SHACL; SPARQL; Neo4j; SQL data quality; AWS S3/Apache Iceberg mapping; governance; and GraphRAG design.

> All data and business scenarios in this repository are synthetic. This project is not affiliated with, derived from, or representative of any employer or insurer's production systems.

## Business Problem
Insurance and annuity information is commonly distributed across policy/contract administration, customer, producer, product, transaction, beneficiary, underwriting, claims, and reporting systems. Different systems can use different identifiers and definitions for the same business concept. This project creates a governed semantic layer that provides reusable definitions and relationships while retaining traceability to physical data assets.

## Domain Coverage
- Customer / Party
- Insurance Policy and Annuity Contract
- Product and Rider
- Owner, Annuitant and Beneficiary roles
- Producer / Agent / Agency
- Premium / Contribution
- Withdrawal / Distribution / Surrender
- Account Value and Death Benefit
- Underwriting and Claims
- Sales / Distribution Channel
- Contract lifecycle

## Architecture
`Synthetic Sources -> S3 Raw -> Iceberg Conformed Tables -> SQL Quality/Reconciliation -> Semantic Mapping -> RDF/OWL Knowledge Graph -> SPARQL/Neo4j -> GraphRAG/Semantic Search`

## Repository Guide
| Area | Purpose |
|---|---|
| `docs/` | business problem, domain, models, glossary, mapping and interview walkthrough |
| `sql/` | physical schema, synthetic data, DQ and reconciliation queries |
| `ontology/` | RDF/OWL ontology and SHACL constraints |
| `sparql/` | semantic query examples |
| `graph/` | Neo4j model and Cypher examples |
| `aws/` | S3/Iceberg architecture and physical-to-semantic mapping |
| `governance/` | lineage, metadata and release lifecycle |
| `ai/` | GraphRAG and semantic-search design |

## Key Modeling Decisions
1. **Party-role pattern:** a person is modeled independently from contractual roles such as Owner, Annuitant and Beneficiary.
2. **Policy vs. annuity contract:** both inherit common contract semantics, while annuity-specific concepts such as account value, surrender and distributions remain explicit.
3. **Temporal relationships:** beneficiary, producer and contract status relationships carry effective dates where appropriate.
4. **Controlled vocabularies:** contract status, transaction type, product type and relationship type are governed values rather than free text.
5. **Traceability:** semantic concepts map to physical tables/columns and authoritative sources.

## Example Competency Demonstrated
- Conceptual, logical and physical data modeling
- Ontology / semantic modeling with RDF, RDFS and OWL
- Knowledge-graph relationship design
- SQL reconciliation and referential-integrity validation
- Semantic harvesting and source-to-concept mapping
- Metadata, lineage and business glossary design
- Git-based model lifecycle and controlled promotion
- GraphRAG architecture using governed enterprise semantics

## Interview Summary
I built this independent project to model an insurance and annuity domain from both traditional enterprise-data-modeling and ontology perspectives. I defined the business vocabulary and conceptual model first, translated it into normalized physical structures, mapped those structures into an RDF/OWL ontology, added SHACL and SQL validation, and demonstrated graph traversal through SPARQL and Neo4j. I also documented how S3/Iceberg physical assets can be connected to governed semantic concepts and used as grounding for GraphRAG.
