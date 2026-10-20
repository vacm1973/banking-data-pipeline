import csv
from collections import defaultdict
from pathlib import Path

# Banking ETL Pipeline - fictional demonstration data

BASE_DIR = Path(__file__).resolve().parent

def extract():
    """Extract fictional transaction records."""
    return [
        {"id": 1001, "customer_id": 1, "amount": 1500.00, "status": "COMPLETED"},
        {"id": 1002, "customer_id": 2, "amount": 250.00, "status": "COMPLETED"},
        {"id": 1003, "customer_id": 1, "amount": 750.00, "status": "COMPLETED"},
        {"id": 1004, "customer_id": 3, "amount": 3200.00, "status": "COMPLETED"},
        {"id": 1005, "customer_id": 4, "amount": 400.00, "status": "FAILED"},
        {"id": 1006, "customer_id": 5, "amount": 1800.00, "status": "COMPLETED"},
        {"id": 1007, "customer_id": 2, "amount": 600.00, "status": "COMPLETED"},
        {"id": 1008, "customer_id": 3, "amount": 900.00, "status": "COMPLETED"},
        {"id": 1009, "customer_id": 1, "amount": 1250.00, "status": "COMPLETED"},
        {"id": 1010, "customer_id": 5, "amount": 300.00, "status": "FAILED"},
    ]

def transform(records):
    """Validate records and aggregate completed transactions."""
    seen_ids = set()
    totals = defaultdict(lambda: {"count": 0, "amount": 0.0})

    for record in records:
        if record["id"] in seen_ids:
            raise ValueError("Duplicate transaction ID")
        seen_ids.add(record["id"])

        if record["amount"] <= 0:
            raise ValueError("Invalid transaction amount")

        if record["status"] not in {"COMPLETED", "FAILED", "PENDING"}:
            raise ValueError("Invalid transaction status")

        if record["status"] == "COMPLETED":
            customer = record["customer_id"]
            totals[customer]["count"] += 1
            totals[customer]["amount"] += record["amount"]

    return totals

def load(totals):
    """Load aggregated results into a CSV file."""
    output = BASE_DIR / "customer_summary.csv"

    with output.open("w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["customer_id", "transaction_count", "total_amount"])

        for customer_id, values in sorted(totals.items()):
            writer.writerow([
                customer_id,
                values["count"],
                f'{values["amount"]:.2f}'
            ])

    print(f"ETL completed. Output: {output}")

if __name__ == "__main__":
    records = extract()
    results = transform(records)
    load(results)
