
resource "dynatrace_management_zone_v2" "ma_zone_manuelle" {
  
    description = null
    legacy_id   = "1393799065751662859"
    name        = "Yahia_MZ"

    rules {
        rule {
            enabled         = true
            entity_selector = null
            type            = "ME"

            attribute_rule {
                azure_to_pgpropagation                           = false
                azure_to_service_propagation                     = false
                custom_device_group_to_custom_device_propagation = false
                entity_type                                      = "HOST"
                host_to_pgpropagation                            = true
                pg_to_host_propagation                           = false
                pg_to_service_propagation                        = false
                service_to_host_propagation                      = false
                service_to_pgpropagation                         = false

                attribute_conditions {
                    condition {
                        case_sensitive     = false
                        dynamic_key        = null
                        dynamic_key_source = null
                        entity_id          = null
                        enum_value         = null
                        integer_value      = 0
                        key                = "HOST_TAGS"
                        operator           = "TAG_KEY_EQUALS"
                        string_value       = null
                        tag                = "Tag - yahia"
                    }
                }
            }
        }
        rule {
            enabled         = true
            entity_selector = null
            type            = "ME"

            attribute_rule {
                azure_to_pgpropagation                           = false
                azure_to_service_propagation                     = false
                custom_device_group_to_custom_device_propagation = false
                entity_type                                      = "SERVICE"
                host_to_pgpropagation                            = false
                pg_to_host_propagation                           = false
                pg_to_service_propagation                        = false
                service_to_host_propagation                      = false
                service_to_pgpropagation                         = true

                attribute_conditions {
                    condition {
                        case_sensitive     = false
                        dynamic_key        = null
                        dynamic_key_source = null
                        entity_id          = null
                        enum_value         = null
                        integer_value      = 0
                        key                = "SERVICE_TAGS"
                        operator           = "TAG_KEY_EQUALS"
                        string_value       = null
                        tag                = "[Environment]owner"
                    }
                }
            }
        }
        rule {
            enabled         = true
            entity_selector = "type(SYNTHETIC_TEST),tag(\"owner:yahia\")"
            type            = "SELECTOR"
        }
        rule {
            enabled         = true
            entity_selector = "type(\"APPLICATION\"),entityName.equals(\"Géo-Localisation 🌍 & Test Performance 🚀\")"
            type            = "SELECTOR"
        }
    }

}
