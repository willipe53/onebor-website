
-- 1|Investor
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
("Peter Williams",1,null,'{
    "first_name": "Peter",
    "last_name": "Williams",
    "email": "willipe53@gmail.com",
    "phone": "9179406705",
    "address": "112 Berkeley Place, Apt 1, Brooklyn, NY 11217",
    "accreditation_status": "Non-Accredited"
  }');

INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Mark D''Andrea', 1, NULL, '{
    "first_name": "Mark",
    "last_name": "D''Andrea",
    "email": "mark.r.dandrea@outlook.com",
    "phone": "(908) 656-4318",
    "accreditation_status": "Accredited"
}');

-- 2|Trust   
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Mark D''Andrea Living Trust', 2, NULL, '{
    "legal_name": "M. R. D''Andrea Living Trust",
    "registration_number": "12-3456789",
    "contact_email": "mark.r.dandrea@outlook.com"
}');

-- 9|Currency
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('US Dollar', 9, NULL, '{ "currency_code": "USD", "country": "United States" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Euro', 9, NULL, '{ "currency_code": "EUR", "country": "Eurozone (multiple countries)" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Japanese Yen', 9, NULL, '{ "currency_code": "JPY", "country": "Japan" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Pound Sterling', 9, NULL, '{ "currency_code": "GBP", "country": "United Kingdom" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Australian Dollar', 9, NULL, '{ "currency_code": "AUD", "country": "Australia" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Canadian Dollar', 9, NULL, '{ "currency_code": "CAD", "country": "Canada" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Swiss Franc', 9, NULL, '{ "currency_code": "CHF", "country": "Switzerland, Liechtenstein" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Yuan Renminbi', 9, NULL, '{ "currency_code": "CNY", "country": "China" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Swedish Krona', 9, NULL, '{ "currency_code": "SEK", "country": "Sweden" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('New Zealand Dollar', 9, NULL, '{ "currency_code": "NZD", "country": "New Zealand" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Mexican Peso', 9, NULL, '{ "currency_code": "MXN", "country": "Mexico" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Singapore Dollar', 9, NULL, '{ "currency_code": "SGD", "country": "Singapore" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Hong Kong Dollar', 9, NULL, '{ "currency_code": "HKD", "country": "Hong Kong" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Norwegian Krone', 9, NULL, '{ "currency_code": "NOK", "country": "Norway" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('South Korean Won', 9, NULL, '{ "currency_code": "KRW", "country": "South Korea" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Turkish Lira', 9, NULL, '{ "currency_code": "TRY", "country": "Türkiye" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Russian Ruble', 9, NULL, '{ "currency_code": "RUB", "country": "Russia" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Indian Rupee', 9, NULL, '{ "currency_code": "INR", "country": "India" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Brazilian Real', 9, NULL, '{ "currency_code": "BRL", "country": "Brazil" }');
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('South African Rand', 9, NULL, '{ "currency_code": "ZAR", "country": "South Africa" }');

-- 4|Vehicle 
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
('Endowment Master Fund', 4, NULL, '{ "inception_date": "2025-09-15" }');

-- 3|Bond 
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
(
  'U.S. Treasury Note 10-Year 0.625% May 15, 2030',
  3,
  NULL,
  '{
    "name":"U.S. Treasury Note 10-Year 0.625% May 15, 2030",
    "cusip":"912828ZQ64",
    "isin":"US912828ZQ64",
    "ticker":"T 0.625 05/15/30",
    "issue_currency":"USD",
    "issuer":"United States of America",
    "issue_country":"US",
    "bond_type":"Treasury Note",
    "coupon_type":"Fixed",
    "coupon_rate":"0.625",
    "coupon_frequency":"Semi-annual",
    "day_count":"Actual/Actual (US)",
    "issue_date":"2020-05-15",
    "maturity_date":"2030-05-15",
    "face_value":"100"
  }'
);

-- 5|Fund 
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
(
  'Blackstone Capital Partners VIII',
  5,
  NULL,
  '{
    "inception_date":"2019",
    "description":"A flagship buyout fund managed by Blackstone, focused on large-scale leveraged buyouts, corporate carve-outs, and strategic investments in North America, Europe, and Asia."
  }'
);
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
(
  'KKR Americas Fund XII',
  5,
  NULL,
  '{
    "inception_date":"2017",
    "description":"KKR’s twelfth North American private equity fund, investing in healthcare, technology, consumer, and industrial sectors through leveraged buyouts and growth capital."
  }'
);

-- 6|Equity  
-- See sp500_inserts.sql

-- 8|ETF  
INSERT INTO entities (name, entity_type_id, parent_entity_id, attributes) VALUES
(
  'SPDR S&P 500 ETF Trust',
  8,
  NULL,
  '{
    "ticker":"SPY",
    "isin":"US78462F1030",
    "cusip":"78462F103",
    "issue_currency":"USD",
    "issue_date":"1993-01-22",
    "issuer":"State Street Global Advisors",
    "issue_country":"US"
  }'
);

--STOPPED HERE

-- 10|Holding (and there is not yet an Account)
  ('Account', '{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Account",
  "type": "object",
  "properties": {
    "account_number": { "type": "string" },
    "institution_name": { "type": "string" },
    "currency_code": { "type": "string" },
    "opened_date": { "type": "string", "format": "date" }
  },
  "required": ["account_number", "currency_code"]
}'),
  ('Holding', '{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Holding",
  "type": "object"
}'),
