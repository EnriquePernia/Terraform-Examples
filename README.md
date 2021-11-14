# TERRAFORM CHEATSHEET

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
