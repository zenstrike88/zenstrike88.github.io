


resource "dynatrace_metric_events" "mon_alerte_manuelle" {
  
    enabled                    = true
    event_entity_dimension_key = null
    legacy_id                  = "10bb9417-199e-429c-992b-5931a455bf57"
    summary                    = "Geo-Monitor synthetic - Terraform alert"

    event_template {
        davis_merge = false
        description = <<-EOT
            The status of "Zen site synthetic availibility - Terraform" is below the limit of {threshold}.
            https://irh27466.live.dynatrace.com/ui/slo?id=6d944b39-1d20-39bc-bae6-70d932175266
        EOT
        event_type  = "CUSTOM_ALERT"
        title       = "Zen site synthetic availibility - Terraform alert"
    }

    model_properties {
        alert_condition    = "BELOW"
        alert_on_no_data   = false
        dealerting_samples = 60
        samples            = 60
        signal_fluctuation = 0
        threshold          = 96
        tolerance          = 0
        type               = "STATIC_THRESHOLD"
        violating_samples  = 3
    }

    query_definition {
        aggregation     = null
        management_zone = "1393799065751662859"
        metric_key      = null
        metric_selector = "func:slo.zen_site_synthetic_availibility___terraform"
        query_offset    = 0
        type            = "METRIC_SELECTOR"
    }


}
