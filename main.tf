data "azuredevops_project" "project" {
  project_name = var.project_name
  
}

resource "azuredevops_user_entitlement" "user" {
  count          = length(var.user_principal_name)
  principal_name = var.user_principal_name[count.index]
}

data "azuredevops_group" "group" {
  project_id = data.azuredevops_project.project.id
  name       = "Build Administrators"
}

resource "azuredevops_group_membership" "membership" {
  count          = length(var.user_principal_name)
  group = data.azuredevops_group.group.descriptor
  members = [
    element(azuredevops_user_entitlement.user.*.descriptor, count.index)
  ]
}
