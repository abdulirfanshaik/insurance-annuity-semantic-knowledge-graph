# Semantic Search Use Case

Traditional keyword search may miss that "contract owner", "annuity holder" and an internal field such as `owner_party_id` refer to related concepts. A governed semantic layer can connect synonyms, ontology concepts and physical metadata.

Example query: **Find assets related to annuity beneficiaries.**

Expected semantic expansion can identify:
- Beneficiary concept;
- ContractPartyRole mapping;
- allocation percentage;
- contract relationship;
- downstream reports using the mapped field;
- lineage back to the authoritative source.
