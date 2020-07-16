variable "project_name" {
description = "Project name to manage"

}

variable "azuredevops_group" {
description = "Group to manage"
  default = "Build Administrators"

}

variable "user_principal_name" {
description = "User principal name to add"

}
