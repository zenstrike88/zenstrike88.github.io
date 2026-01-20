resource "dynatrace_slo" "mon_slo_robot" {
    denominator       = null
    description       = null
    evaluation        = "AGGREGATE"
    filter            = "type(\"SYNTHETIC_TEST\"),entityName.equals(\"Terraform Import Test Synthetics - Geo-Monitor\")"
    metric_expression = "(builtin:synthetic.browser.availability.location.total:splitBy(\"dt.entity.synthetic_test\"):splitBy())"
    metric_name       = "zen_site_synthetic_availibility___terraform"
    name              = "Geo-Monitor synthetic availibility - Terraform"
    numerator         = null
    rate              = null
    target            = 96
    timeframe         = "-1h"
    warning           = 98

    error_budget_burn_rate {
        burn_rate_visualization_enabled = true
        fast_burn_threshold             = 10
    }


}
