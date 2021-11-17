# TERRAFORM CHEATSHEET

## Good practices

- Project structure:
- If your project is small, use workspaces to develop it. In case it gets bigger, you will need different environments.

## Commands

### General

| Command | Info |
|---------|------|
| `terraform fmt` | To format manifests (-diff option shows us the differences between versions) |
| `terraform -chdir=<Dir> fmt` | Format .tf files in DIR directory |
| `docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs-012  md . > README.md` | To generate a README of your terraform manifests |
| `terraform show` | Show all the information on our state |
| `terraform state list` | List all the resources on our state |
| `terraform state show <Resource>` | List all the information of our resource |
| `terraform output`| Print outputs (Only work with previous apply) |
| `terraform apply -replace="resource"` | It forces a replacement of the resources you specify |
| `terraform apply -lock` | Remove the lock on state, this is not recomended because it can lead to errors |
| `terraform workspace new <Workspace_name>` | Create new workspace |
| `terraform workspace show` | Show current workspace |
| `terraform workspace list` | Lists all workspaces |
| `terraform workspace select <Workspace_name>` | Select workspace |

### Init

| Command | Info |
|---------|------|
| `terraform -chdir=<Dir> init` | Init in DIR directory |

### Plan

| Command | Info |
|---------|------|
| `terraform plan -out=<Plan Name>` | Create and save a plan |
| `terraform -chdir=<Dir> plan` | Plan in DIR directory |
| `terraform plan -var-file=<Filename>` | Use different .tfvars files |
| `terraform plan -var <var_name>=<value>` | Define the value for .tfvars keys |

### Apply

| Command | Info |
|---------|------|
| `terraform apply <Plan Name>` | This allow us to apply a saved plan (No confirmation needed) |
| `terraform apply -auto-aprove` | Apply without confirmation |
| `terraform -chdir=<Dir> apply` | Apply in DIR directory |

## Wiki

- Removing terraform state lock can lead to errors. If you dont lock your state when applying, anyone can modify it, so the resources you deploy are not the same as the ones at the final deployment.
- Anything specified on the command line will overwrite resources created by files. Ex: Using the `terraform plan -var <var_name>=<value>` command, replace whatever value `<var_name>` has on .tfvars for `<value>`.
- Order is important when using command line arguments. If you execute `terraform plan -var <var_name>=<value> -var-file=<Filename>` vars values will be the ones defined on `-var-file`. Buf if you do it hte other way `terraform plan -var-file=<Filename> -var <var_name>=<value>`, `<var_name>=<value>` will be the the one used.
