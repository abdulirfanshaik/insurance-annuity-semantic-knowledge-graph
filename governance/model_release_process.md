# Model Release Process

1. Develop ontology/model change on feature branch.
2. Run syntax, SQL and SHACL validation.
3. Peer review business definition, mappings and compatibility impact.
4. Merge approved artifact into DEV baseline.
5. Promote to QA and validate representative queries/reconciliation.
6. Promote to STAGE for consumer validation.
7. Release to PROD with version tag and release notes.
8. Maintain rollback/reference to prior model version.

No production environment is included in this portfolio repository; the process demonstrates controlled semantic-asset lifecycle design.
