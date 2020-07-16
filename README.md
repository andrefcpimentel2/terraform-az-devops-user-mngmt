# terraform-az-devops-user-mngmt

This project adds a list of AD users in a project.
The only three variables needed (besided your AZ Devops provider credentials) are:

* Project Name (A existing project within your AZ Devops)
* azuredevops_group - The group within your project
* A List for AD users in the format: ["user1@example.com", "user2@example.com", user3@example.com, ...]
