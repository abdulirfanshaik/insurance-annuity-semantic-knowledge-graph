CREATE TABLE party (
  party_id BIGINT PRIMARY KEY,
  party_type VARCHAR(20) NOT NULL CHECK (party_type IN ('PERSON','ORGANIZATION')),
  first_name VARCHAR(100), last_name VARCHAR(100), birth_date DATE
);

CREATE TABLE product (
  product_id BIGINT PRIMARY KEY,
  product_name VARCHAR(200) NOT NULL,
  product_type VARCHAR(50) NOT NULL,
  product_family VARCHAR(30) NOT NULL CHECK (product_family IN ('ANNUITY','INSURANCE'))
);

CREATE TABLE contract (
  contract_id BIGINT PRIMARY KEY,
  contract_number VARCHAR(50) UNIQUE NOT NULL,
  product_id BIGINT NOT NULL REFERENCES product(product_id),
  contract_type VARCHAR(30) NOT NULL CHECK (contract_type IN ('ANNUITY','INSURANCE')),
  status VARCHAR(30) NOT NULL CHECK (status IN ('PENDING','ISSUED','ACTIVE','SURRENDERED','MATURED','TERMINATED')),
  issue_date DATE, effective_date DATE
);

CREATE TABLE contract_party_role (
  contract_id BIGINT REFERENCES contract(contract_id),
  party_id BIGINT REFERENCES party(party_id),
  role_type VARCHAR(30) CHECK (role_type IN ('OWNER','ANNUITANT','BENEFICIARY','INSURED')),
  allocation_pct DECIMAL(5,2), effective_from DATE NOT NULL, effective_to DATE,
  PRIMARY KEY (contract_id, party_id, role_type, effective_from)
);

CREATE TABLE agency (agency_id BIGINT PRIMARY KEY, agency_name VARCHAR(200) NOT NULL);
CREATE TABLE producer (producer_id BIGINT PRIMARY KEY, agency_id BIGINT REFERENCES agency(agency_id), producer_name VARCHAR(200) NOT NULL);
CREATE TABLE contract_producer (
  contract_id BIGINT REFERENCES contract(contract_id), producer_id BIGINT REFERENCES producer(producer_id),
  role_type VARCHAR(30) NOT NULL, effective_from DATE NOT NULL, effective_to DATE,
  PRIMARY KEY(contract_id, producer_id, effective_from)
);

CREATE TABLE rider (rider_id BIGINT PRIMARY KEY, rider_name VARCHAR(200), rider_type VARCHAR(80));
CREATE TABLE contract_rider (contract_id BIGINT REFERENCES contract(contract_id), rider_id BIGINT REFERENCES rider(rider_id), effective_date DATE, PRIMARY KEY(contract_id,rider_id));

CREATE TABLE contract_transaction (
  transaction_id BIGINT PRIMARY KEY, contract_id BIGINT REFERENCES contract(contract_id),
  transaction_type VARCHAR(30) CHECK (transaction_type IN ('CONTRIBUTION','PREMIUM','WITHDRAWAL','DISTRIBUTION','SURRENDER')),
  amount DECIMAL(18,2) NOT NULL CHECK (amount >= 0), transaction_date DATE NOT NULL
);

CREATE TABLE account_value (
  contract_id BIGINT REFERENCES contract(contract_id), as_of_date DATE, account_value DECIMAL(18,2) CHECK(account_value >= 0),
  PRIMARY KEY(contract_id,as_of_date)
);

CREATE TABLE underwriting_case (
  underwriting_id BIGINT PRIMARY KEY, contract_id BIGINT REFERENCES contract(contract_id), status VARCHAR(30), opened_date DATE, decision_date DATE
);

CREATE TABLE claim (
  claim_id BIGINT PRIMARY KEY, contract_id BIGINT REFERENCES contract(contract_id), claim_type VARCHAR(50), status VARCHAR(30), claim_date DATE, benefit_amount DECIMAL(18,2)
);
