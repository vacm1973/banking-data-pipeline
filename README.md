# Banking Data Pipeline & Analytics

### SQL | Python | ETL | Data Quality | CI/CD

A hands-on Data Engineering portfolio project demonstrating banking transaction processing, SQL analytics, data quality validation, and automated testing.

This project uses **100% synthetic data** and is designed for educational and portfolio demonstration purposes.

## Project Overview

The project demonstrates key data engineering practices:

- Relational database design using SQL
- Banking transaction data modeling
- ETL processing using Python
- Data validation and duplicate detection
- Customer-level transaction aggregation
- SQL-based financial transaction analytics
- Automated unit testing with GitHub Actions

## Technologies

- Python 3.11
- PostgreSQL-compatible SQL
- Python unittest
- GitHub Actions
- CSV

## Repository Structure

- `schema.sql` — Database schema
- `sample_data.sql` — Synthetic banking data
- `analytics_queries.sql` — SQL analytics and data quality checks
- `etl_pipeline.py` — Python ETL pipeline
- `test_etl.py` — Automated unit tests
- `.github/workflows/python-tests.yml` — CI workflow

## Running the Python Pipeline

Requires Python 3.11 or a compatible version.

```bash
python etl_pipeline.py
```

The pipeline generates a `customer_summary.csv` file containing aggregated completed transactions by customer.

## Running the Tests

```bash
python -m unittest discover -v
```

The repository includes five automated unit tests covering extraction, aggregation, failed transactions, duplicate detection, and invalid amounts.

**CI status:** All five unit tests passed in GitHub Actions.

## SQL Setup

Using a PostgreSQL database, execute the files in this order:

1. `schema.sql`
2. `sample_data.sql`
3. `analytics_queries.sql`

The Python demonstration currently uses in-memory synthetic data independently of the SQL database.

## Future Improvements

- External CSV ingestion
- PostgreSQL integration
- Additional data quality checks
- ETL logging and error handling
- Containerization and deployment

## About the Author

**Victor Andres Costa Molina**

Senior Data Engineer | BI & Data Architecture

Experienced in enterprise data engineering, business intelligence, data architecture, and complex data migrations.

**Location:** Buenos Aires, Argentina

**Open to:** Remote Data Engineering, Data Architecture, and BI Engineering opportunities.

---

[GitHub Profile](https://github.com/vacm1973)

