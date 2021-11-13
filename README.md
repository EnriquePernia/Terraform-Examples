# TERRAFORM CHEATSHEET

## Commands

### Formatting

| Command | Info |
|---------|------|
| `terraform fmt` | To format manifests (-diff option shows us the differences between versions) |

### Plan

| Command | Info |
|---------|------|
| `terraform plan -out=<Plan Name>` | Create and save a plan |

### Apply

| Command | Info |
|---------|------|
| `terraform apply <Plan Name>` | This allow us to apply a saved plan (No confirmation needed) |
| `terraform apply -auto-aprove` | Apply without confirmation |

### Documentation

| Command | Info |
|---------|------|
| `docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs-012  md . > README.md` | To generate a README of your terraform manifests |
