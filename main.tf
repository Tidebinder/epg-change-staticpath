provider aci {
    username = var.TF_VAR_apic_user
    password = var.TF_VAR_apic_pass
    url = var.apic_url
}

data "aci_tenant" "tenant" {
    name = var.tenant_name
}

data "aci_application_profile" "anp" {
  tenant_dn  = data.aci_tenant.tenant.id
  name       = var.anp_name
}

data "aci_application_epg" "epg" {

  application_profile_dn  = data.aci_application_profile.anp.id
  name                    = var.epg_name
}


data "aci_epg_to_static_path" "static_paths" {

  application_epg_dn  = data.aci_application_epg.epg.id

  tDn  = 
}