# TERRAFORM CHEATSHEET

## Commands

### Formatting

1. To format manifests -> `terraform fmt -diff` (-diff option shows us the differences between versions)

### Plan

1. Create and save a plan -> `terraform plan -out=< Plan Name >`

### Apply

1. To use a saved plan(Plan -> 1) -> `terraform apply < Plan Name >` This allow us to apply the plan without a confirmation.

2. Apply without confirmation -> `terraform apply -auto-aprove`

### Documentation

1. To generate a README of your terraform manifests -> `docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs-012  md . > README.md`
