# AWS S3 / Apache Iceberg Architecture

## Layers
1. **S3 Raw** — immutable synthetic extracts from contract, party, producer, product, transaction and claims sources.
2. **Conformed Iceberg** — standardized identifiers, types, controlled values and deduplicated business records.
3. **Quality/Certification** — SQL/compute checks for referential integrity, cardinality, temporal validity and reconciliation.
4. **Semantic Mapping** — maps Iceberg tables/columns to ontology classes/properties.
5. **Knowledge Graph** — graph representation for relationship traversal and semantic retrieval.

## Why Iceberg
The design assumes Iceberg for schema evolution, partition evolution, snapshots/time travel and interoperable table metadata on object storage. The portfolio implementation documents the design rather than claiming a deployed production environment.
