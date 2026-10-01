# Physical Model

The SQL implementation is normalized to preserve contractual relationships and effective dating. Surrogate numeric identifiers are used in the sample implementation; business identifiers such as contract number remain alternate keys.

## Design Notes
- DECIMAL types are used for monetary values and percentages.
- Effective-from/effective-to columns support temporal party and producer relationships.
- Role types are constrained through checks in the demonstration schema.
- Contract transaction type distinguishes CONTRIBUTION, PREMIUM, WITHDRAWAL, DISTRIBUTION and SURRENDER.
- Account value is a snapshot fact keyed by contract and as-of date.

See `sql/create_tables.sql`.
