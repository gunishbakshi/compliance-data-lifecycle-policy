# Compliance Data Lifecycle Policy


This repository provides a ready-to-use Data Lifecycle Policy for the Compliance Department.


**Business rules enforced:**
- Project documentation must be archived (moved to colder storage) after **90 days** from creation.
- Project documentation must be permanently **deleted after 7 years** (2555 days) from creation.


Files included:
- `POLICY.md` — formal policy, responsibilities, exceptions, audit controls.
- `s3-lifecycle.json` — AWS S3 lifecycle configuration (JSON).
- `terraform/s3-lifecycle.tf` — Terraform example to attach lifecycle configuration to an S3 bucket.
- `azure/blob-lifecycle-policy.json` — Azure Blob Storage lifecycle management policy.
- `gcp/gcs-lifecycle.json` — Google Cloud Storage lifecycle configuration.


## How to use


1. Review `POLICY.md` and adapt names, owner, and process details to your org.
2. For cloud application:
- **AWS S3:** Edit `s3-lifecycle.json` to use your bucket name (if embedding in CLI). Apply with AWS CLI or Terraform.
- **Azure Blob:** Use `azure/blob-lifecycle-policy.json` and apply via Azure Portal or `az storage account management-policy create`.
- **GCP:** Upload `gcp/gcs-lifecycle.json` via `gsutil` or the Cloud Console.
3. Replace any placeholder values (bucket names, storage classes, policy IDs) before applying.
4. Commit the repo and push to GitHub.


## Important notes
- The JSON files use **90 days** to transition/nearline-tier and **2555 days** (7 * 365) to delete. If you prefer to count leap days or use calendar-years, modify the day counts accordingly.
- Test lifecycle rules in a non-production sandbox bucket/account first.
