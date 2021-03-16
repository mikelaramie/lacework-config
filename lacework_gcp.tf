module "gcp_audit_log" {
  source                        = "lacework/audit-log/gcp"
  version                       = "~> 0.1.0"

  lacework_integration_name     = var.gcp_audit_integration_name
  prefix                        = var.gcp_audit_prefix

  org_integration               = var.gcp_org_integration
  organization_id               = var.gcp_org_integration ? var.gcp_organization_id : ""
  project_id                    = var.gcp_project_id

  bucket_force_destroy          = true

  service_account_name          = module.gcp_config.service_account_name
  service_account_private_key   = module.gcp_config.service_account_private_key
  use_existing_service_account  = true
}

module "gcp_config" {
  source                      = "lacework/config/gcp"
  version                     = "~> 0.1.0"

  lacework_integration_name   = var.gcp_config_integration_name
  
  org_integration             = var.gcp_org_integration
  organization_id             = var.gcp_org_integration ? var.gcp_organization_id : ""
  project_id                  = var.gcp_project_id
}