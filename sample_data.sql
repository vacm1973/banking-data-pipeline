
-- Fictional banking data for portfolio demonstration

INSERT INTO customers
(customer_id, full_name, region, created_at)
VALUES
(1, 'Alex Morgan', 'Buenos Aires', '2025-01-10'),
(2, 'Taylor Smith', 'Cordoba', '2025-02-15'),
(3, 'Jordan Lee', 'Mendoza', '2025-03-20'),
(4, 'Casey Brown', 'Rosario', '2025-04-05'),
(5, 'Sam Wilson', 'Buenos Aires', '2025-05-12');

INSERT INTO transactions
(transaction_id, customer_id, transaction_date,
 amount, transaction_type, status)
VALUES
(1001, 1, '2025-06-01', 1500.00, 'DEPOSIT', 'COMPLETED'),
(1002, 2, '2025-06-02', 250.00, 'WITHDRAWAL', 'COMPLETED'),
(1003, 1, '2025-06-03', 750.00, 'TRANSFER', 'COMPLETED'),
(1004, 3, '2025-06-04', 3200.00, 'DEPOSIT', 'COMPLETED'),
(1005, 4, '2025-06-05', 400.00, 'TRANSFER', 'FAILED'),
(1006, 5, '2025-06-06', 1800.00, 'DEPOSIT', 'COMPLETED'),
(1007, 2, '2025-06-07', 600.00, 'TRANSFER', 'COMPLETED'),
(1008, 3, '2025-06-08', 900.00, 'WITHDRAWAL', 'COMPLETED'),
(1009, 1, '2025-06-09', 1250.00, 'DEPOSIT', 'COMPLETED'),
(1010, 5, '2025-06-10', 300.00, 'TRANSFER', 'FAILED');
