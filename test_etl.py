import unittest
from etl_pipeline import extract, transform


class TestBankingETL(unittest.TestCase):

    def test_extract_count(self):
        records = extract()
        self.assertEqual(len(records), 10)

    def test_completed_totals(self):
        results = transform(extract())
        self.assertEqual(results[1]["count"], 3)
        self.assertEqual(results[1]["amount"], 3500.00)

    def test_failed_transactions_excluded(self):
        results = transform(extract())
        self.assertNotIn(4, results)

    def test_duplicate_detection(self):
        records = extract()
        records.append(records[0].copy())

        with self.assertRaises(ValueError):
            transform(records)

    def test_invalid_amount(self):
        records = extract()
        records[0]["amount"] = -100

        with self.assertRaises(ValueError):
            transform(records)


if __name__ == "__main__":
    unittest.main()
