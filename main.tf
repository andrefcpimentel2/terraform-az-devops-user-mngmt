data "azuredevops_projects" "project" {
  project_name = var.project_name
  
}

resource "azuredevops_user_entitlement" "user" {
  principal_name = var.user_principal_name
}

data "azuredevops_group" "group" {
  project_id = azuredevops_project.project.id
  name       = "Build Administrators"
}

resource "azuredevops_group_membership" "membership" {
  group = data.azuredevops_group.group.descriptor
  members = [
    azuredevops_user_entitlement.user.descriptor
  ]
}
