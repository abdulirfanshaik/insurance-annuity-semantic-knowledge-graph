// Active annuity contracts and owners
MATCH (c:AnnuityContract {status:'ACTIVE'})-[:HAS_OWNER]->(o:Person)
RETURN c.number, o.name;

// Beneficiary graph
MATCH (c:AnnuityContract)-[r:HAS_BENEFICIARY]->(b:Person)
RETURN c.number,b.name,r.allocationPct;

// Owner -> contract -> beneficiary traversal
MATCH (o:Person)<-[:HAS_OWNER]-(c:AnnuityContract)-[:HAS_BENEFICIARY]->(b:Person)
RETURN o.name,c.number,collect(b.name);
