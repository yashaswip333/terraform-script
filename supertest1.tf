Based on the recommendations and the existing Terraform script, here's the updated Terraform configuration:

# Provider configuration remains unchanged

# +  Recommendation: REPLACE_ROLE roles/securitycenter.admin with organizations/274706244275/roles/latchkey_hierarchy_traversal for aditv@google.com
# -  resource "google_organization_iam_member" "security_center_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/securitycenter.admin"
# -   member = "user:aditv@google.com"
# -  }

# +  Recommendation: REPLACE_ROLE roles/resourcemanager.organizationAdmin with organizations/274706244275/roles/latchkey_hierarchy_traversal for pkhushalani@google.com
# -  resource "google_organization_iam_member" "organization_administrator" {
# -   org_id = "274706244275"
# -   role   = "roles/resourcemanager.organizationAdmin"
# -   member = "user:pkhushalani@google.com"
# -  }

# +  Recommendation: REMOVE_ROLE roles/resourcemanager.folderIamAdmin for pkhushalani@google.com
# -  resource "google_organization_iam_member" "folder_iam_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/resourcemanager.folderIamAdmin"
# -   member = "user:pkhushalani@google.com"
# -  }

# +  Recommendation: REPLACE_ROLE roles/resourcemanager.projectCreator with roles/resourcemanager.organizationViewer for pkhushalani@google.com
# -  resource "google_organization_iam_member" "project_creator" {
# -   org_id = "274706244275"
# -   role   = "roles/resourcemanager.projectCreator"
# -   member = "user:pkhushalani@google.com"
# -  }

# + Add the organizationViewer role for pkhushalani@google.com
 resource "google_organization_iam_member" "organization_viewer_pkhushalani" {
   org_id = "274706244275"
   role   = "roles/resourcemanager.organizationViewer"
   member = "user:pkhushalani@google.com"
 }

# +  Recommendation: REPLACE_ROLE roles/chronicle.admin with organizations/274706244275/roles/latchkey_hierarchy_traversal for pkhushalani@google.com
   resource "google_organization_iam_binding" "chronicle_api_admin" {
    org_id = "274706244275"
    role   = "roles/chronicle.admin"
    members = [
      "user:foo@example.com"
# -     "user:pkhushalani@google.com",
    ]
   }

# + Add the latchkey_hierarchy_traversal for pkhushalani@google.com and aditv@google.com
 resource "google_organization_iam_binding" "chronicle_api_admin" {
   org_id = "274706244275"
   role   = "organizations/274706244275/roles/latchkey_hierarchy_traversal"
   members = [
     "user:pkhushalani@google.com"
     "user:aditv@google.com",
   ]
 }

# +  Recommendation: REPLACE_ROLE roles/iam.securityAdmin with roles/iam.securityReviewer for pkhushalani@google.com
# -  resource "google_organization_iam_member" "iam_security_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/iam.securityAdmin"
# -   member = "user:pkhushalani@google.com"
# -  }

# + Add the securityReviewer role for pkhushalani@google.com
 resource "google_organization_iam_member" "security_reviewer_pkhushalani" {
   org_id = "274706244275"
   role   = "roles/iam.securityReviewer"
   member = "user:pkhushalani@google.com"
 }

# +  Recommendation: REMOVE_ROLE roles/chroniclesm.admin for pkhushalani@google.com
# -  resource "google_organization_iam_member" "chronicle_service_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/chroniclesm.admin"
# -   member = "user:pkhushalani@google.com"
# -  }

#Reapply the permission for the user:foo@example.com
resource "google_organization_iam_member" "chronicle_service_admin" {
  org_id = "274706244275"
  role   = "roles/chroniclesm.admin"
  member = "user:foo@example.com"
}

# +  Recommendation: REPLACE_ROLE roles/recommender.iamAdmin with roles/recommender.iamViewer for pkhushalani@google.com
# -  resource "google_organization_iam_member" "iam_recommender_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/recommender.iamAdmin"
# -   member = "user:pkhushalani@google.com"
# -  }

# + Add the iamViewer role for pkhushalani@google.com
 resource "google_organization_iam_member" "iam_viewer_pkhushalani" {
   org_id = "274706244275"
   role   = "roles/recommender.iamViewer"
   member = "user:pkhushalani@google.com"
 }

# +  Recommendation: REPLACE_ROLE roles/securitycenter.admin with roles/securitycenter.assetsViewer for pkhushalani@google.com
# -  resource "google_organization_iam_member" "security_center_admin" {
# -   org_id = "274706244275"
# -   role   = "roles/securitycenter.admin"
# -   member = "user:pkhushalani@google.com"
# -  }

# + Add the securitycenter.assetsViewer role for pkhushalani@google.com
 resource "google_organization_iam_member" "security_center_assets_viewer_pkhushalani" {
   org_id = "274706244275"
   role   = "roles/securitycenter.assetsViewer"
   member = "user:pkhushalani@google.com"
 }

#Existing roles
resource "google_organization_iam_binding" "chronicle_soar_admin" {
  org_id = "274706244275"
  role   = "roles/chronicle.soarAdmin"
  members = [
    "user:pkhushalani@google.com",
  ]
}

resource "google_organization_iam_member" "cloud_asset_owner" {
  org_id = "274706244275"
  role   = "roles/cloudasset.owner"
  member = "user:pkhushalani@google.com"
}

resource "google_organization_iam_member" "create_service_accounts" {
  org_id = "274706244275"
  role   = "roles/iam.serviceAccountCreator"
  member = "user:pkhushalani@google.com"
}

resource "google_organization_iam_binding" "owner" {
  org_id = "274706244275"
  role   = "roles/owner"
  members = [
    "user:pkhushalani@google.com",
  ]
}

resource "google_organization_iam_member" "project_iam_admin" {
  org_id = "274706244275"
  role   = "roles/resourcemanager.projectIamAdmin"
  member = "user:pkhushalani@google.com"
}

Apply the configuration:

Initialize Terraform: terraform init
Plan the changes: terraform plan
Apply the changes: terraform apply
Important Considerations:

Custom Role: The script adds a new role organizations/274706244275/roles/latchkey_hierarchy_traversal. Ensure this custom role is properly defined with the necessary permissions.
Testing: Thoroughly test these changes in a non-production environment before applying them to production.
State File: This script assumes you have an existing Terraform state file. If you don't, Terraform will create one upon the first apply.
Permissions: Make sure the account you're using to run Terraform has the necessary permissions to modify IAM policies at the organization level.
