

resource "dynatrace_autotag" "mon_tag_auto" {

    description = "Yahia test"
    name        = "Tag - yahia"

    rules {
        enabled           = true
        normalization     = "LEAVE_TEXT_AS_IS"
        propagation_types = []
        type              = "HOST"
        unknowns          = null
        value_format      = "owner:yahia"

        conditions {
            unknowns = null

            key {
                attribute = "HOST_NAME"
                type      = "STATIC"
                unknowns  = null
            }

            string {
                case_sensitive = false
                negate         = false
                operator       = "CONTAINS"
                unknowns       = null
                value          = "yahia"
            }
        }
    }

}
