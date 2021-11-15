# TERRAFORM CHEATSHEET

## Good practices

- One
- Two

## Commands

### General

| Command | Info |
|---------|------|
| `terraform fmt` | To format manifests (-diff option shows us the differences between versions) |
| `terraform -chdir=<DIR> fmt` | Format .tf files in DIR directory |
| `docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs-012  md . > README.md` | To generate a README of your terraform manifests |
| `terraform show` | Show all the information on our state |
| `terraform state list` | List all the resources on our state |
| `terraform output`| Print outputs (Only work with previous apply) |
| `terraform apply -replace="resource"` | It forces a replacement of the resources you specify |
| `terraform apply -lock` | Remove the lock on state, this is not recomended because it can lead to errors |

### Init

| Command | Info |
|---------|------|
| `terraform -chdir=<DIR> init` | Init in DIR directory |

### Plan

| Command | Info |
|---------|------|
| `terraform plan -out=<Plan Name>` | Create and save a plan |
| `terraform -chdir=<DIR> plan` | Plan in DIR directory |

### Apply

| Command | Info |
|---------|------|
| `terraform apply <Plan Name>` | This allow us to apply a saved plan (No confirmation needed) |
| `terraform apply -auto-aprove` | Apply without confirmation |
| `terraform -chdir=<DIR> apply` | Apply in DIR directory |

## Wiki

- Removing terraform state lock can lead to errors. If you dont lock your state when applying, anyone can modify it, so the resources you deploy are not the same as the ones at the final deployment.
