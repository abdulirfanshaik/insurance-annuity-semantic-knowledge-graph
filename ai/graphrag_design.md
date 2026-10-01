# GraphRAG Design

## Goal
Ground AI responses in governed insurance/annuity definitions and relationships instead of relying only on unstructured similarity search.

## Flow
1. User asks: "Who are the beneficiaries of an active annuity owned by Ava Morgan?"
2. Entity resolution identifies the Party.
3. Graph retrieval traverses `HAS_OWNER -> AnnuityContract -> HAS_BENEFICIARY`.
4. Metadata layer returns source mappings and lineage.
5. Structured graph facts plus approved glossary definitions are supplied to the LLM.
6. Response includes traceable source/concept references.

## Guardrails
- authorization before retrieval;
- no unrestricted PII exposure;
- governed ontology versions only;
- confidence/ambiguity handling for entity resolution;
- source citations/lineage in responses;
- no LLM-generated ontology change automatically promoted without validation.
