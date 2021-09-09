Adapted from https://github.com/ned1313/terraform-tuesdays/blob/main/2021-05-25-ADO/vnet/azure-pipelines.yaml

Creates:
- ADO project & pipeline, triggered on push on main branch. 
- Azure Key Vault and secrets necessary to run pipeline. 

Pipeline will:
- TF validate
- TF plan
- wait for approval (TF plan review)
- TF apply

Notes: 

Removed Azure SP creation as already using SP and not having multiple subsciptions. 
