-- Banking Analytics & Data Quality
-- PostgreSQL | Fictional data

-- 1. Completed transaction volume by region
SELECT
    c.region,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_amount
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE t.status = 'COMPLETED'
GROUP BY c.region
ORDER BY total_amount DESC;

-- 2. Customer transaction summary
SELECT
    c.customer_id,
    c.full_name,
    COUNT(t.transaction_id) AS transaction_count,
    COALESCE(SUM(CASE WHEN t.status = 'COMPLETED' THEN t.amount ELSE 0 END), 0) AS completed_amount
FROM customers c
LEFT JOIN transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY completed_amount DESC;

-- 3. Failed transaction analysis
SELECT
    transaction_type,
    COUNT(*) AS failed_count,
    SUM(amount) AS failed_amount
FROM transactions
WHERE status = 'FAILED'
GROUP BY transaction_type
ORDER BY failed_count DESC;

-- 4. Duplicate transaction ID detection
SELECT
    transaction_id,
    COUNT(*) AS occurrences
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- 5. Data quality validation
SELECT *
FROM transactions
WHERE amount <= 0
   OR transaction_date IS NULL
   OR status NOT IN ('COMPLETED', 'FAILED', 'PENDING');

-- 6. Daily completed transaction totals
SELECT
    transaction_date,
    COUNT(*) AS transaction_count,
    SUM(amount) AS daily_amount
FROM transactions
WHERE status = 'COMPLETED'
GROUP BY transaction_date
ORDER BY transaction_date;
