# Conceptual Model

```mermaid
erDiagram
    PARTY ||--o{ CONTRACT_PARTY_ROLE : participates
    CONTRACT ||--o{ CONTRACT_PARTY_ROLE : has
    PRODUCT ||--o{ CONTRACT : defines
    AGENCY ||--o{ PRODUCER : employs_or_affiliates
    PRODUCER ||--o{ CONTRACT : services
    CONTRACT ||--o{ CONTRACT_TRANSACTION : generates
    CONTRACT ||--o{ CONTRACT_RIDER : includes
    RIDER ||--o{ CONTRACT_RIDER : selected
    CONTRACT ||--o{ ACCOUNT_VALUE : valued_as
    CONTRACT ||--o{ CLAIM : may_have
    CONTRACT ||--o{ UNDERWRITING_CASE : may_have
```

The model intentionally uses `CONTRACT_PARTY_ROLE` instead of putting owner/annuitant/beneficiary columns directly on the contract. This allows multiple beneficiaries, role changes, effective dating and the same party to play different roles.
