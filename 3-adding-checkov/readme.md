Adapted from https://github.com/ned1313/terraform-tuesdays/tree/main/2021-06-22-ADO/

Creates:
- ADO project & pipeline, triggered on push on main branch. 
- Azure Key Vault and secrets necessary to run pipeline. 

Pipeline will:
- TF validate
- Run checkov tests against network then root modules
- TF plan
- Run checkov tests against generated plan
- wait for approval (TF plan review)
- TF apply (auto-approve)

Notes: 

Removed Azure SP creation as already using SP and not having multiple subsciptions. 
