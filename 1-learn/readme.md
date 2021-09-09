Adapted from https://github.com/ned1313/terraform-tuesdays/tree/main/2021-05-11-ADO 

Creates ADO project & pipeline, triggered on push on main branch. 
Pipeline will:
- TF validate
- TF plan
- wait for approval (TF plan review)
- TF apply

Notes: 

Visit https://marketplace.visualstudio.com/acquisition?itemName=charleszipp.azure-pipelines-tasks-terraform to install ADO Pipeline TF tasks

As of September 2021, when creating new ADO Org one will need to request for the capability to run parallelism: 
##[error]No hosted parallelism has been purchased or granted. To request a free parallelism grant, please fill out the following form https://aka.ms/azpipelines-parallelism-request

