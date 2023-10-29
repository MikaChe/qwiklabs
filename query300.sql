#standardSQL
CREATE OR REPLACE TABLE ecommerce.rev_transactions AS
SELECT
geoNetwork_city,
totals_transactions,
fullVisitorId,
FROM
`data-to-insights.ecommerce.rev_transactions`
LIMIT 1000
