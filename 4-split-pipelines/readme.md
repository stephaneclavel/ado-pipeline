Adapted from https://raw.githubusercontent.com/ned1313/terraform-tuesdays/main/2021-07-27-ADO/

Creates:
- ADO project & pipelines:
  - CI pipeline triggered on push on any branch but main. 
  - Merge pipeline triggered on push on main branch (after pull request being merged)
- Azure Key Vault and secrets necessary to run pipeline. 

CI Pipeline will:
- TF validate
- Run checkov tests against network then root modules
- TF plan and publish plan file as an ADO artifact. 
- Run checkov tests against generated plan

Merge Pipeline will:
- TF apply previously produced plan file. 

Notes: 

Removed Azure SP creation as already using SP and not having multiple subsciptions. 
