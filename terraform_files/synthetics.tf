
resource "dynatrace_browser_monitor" "robot_visitor" {
enabled                = true
    frequency              = 15
    locations              = [
        "GEOLOCATION-57F63BAD1C6A415C",
        "GEOLOCATION-A437CC152B23F30C",
        "GEOLOCATION-AFA64B6F15E92015",
    ]
    name                   = "Terraform Import Test Synthetics - Geo-Monitor"
    # La syntaxe correcte est un bloc, pas une assignation
    tags {
      tag {
        source = "USER"
        context = "CONTEXTLESS"
        key    = "owner"
        value  = "yahia"
      }
    }

    anomaly_detection {
        loading_time_thresholds {
            enabled = false
        }
        outage_handling {
            global_outage  = true
            local_outage   = false
            retry_on_error = true

            global_outage_policy {
                consecutive_runs = 1
            }
        }
    }

    key_performance_metrics {
        load_action_kpm = "VISUALLY_COMPLETE"
        xhr_action_kpm  = "VISUALLY_COMPLETE"
    }

    script {
        type = "clickpath"

        configuration {
            bypass_csp           = false
            disable_web_security = false
            monitor_frames       = false
            user_agent           = null

            bandwidth {
                download     = 0
                latency      = 0
                network_type = "WiFi"
                upload       = 0
            }

            device {
                height        = 0
                mobile        = false
                name          = "Desktop"
                orientation   = "landscape"
                scale_factor  = 0
                touch_enabled = false
                width         = 0
            }
        }

        events {
            event {
                description = "Loading of \"https://zenstrike88.github.io/\""

                navigate {
                    url = "https://zenstrike88.github.io/"

                    wait {
                        milliseconds = 0
                        timeout      = 0
                        wait_for     = "page_complete"
                    }
                }
            }
            event {
                description = "click on \"countrySelect\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                            locator {
                                type  = "css"
                                value = "select"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar select:nth-child(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                        }
                    }
                }
            }
            event {
                description = "selectOption on \"countrySelect\""

                select {
                    selections {
                        option {
                            index = 1
                            value = "Algeria"
                        }
                    }
                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                            locator {
                                type  = "css"
                                value = "select"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar select:nth-child(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                        }
                    }
                    wait {
                        milliseconds = 0
                        timeout      = 0
                        wait_for     = "network"
                    }
                }
            }
            event {
                description = "click on \"countrySelect\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                            locator {
                                type  = "css"
                                value = "select"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar select:nth-child(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#countrySelect"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"CLEAR\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(6)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"CLEAR\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn-clear"
                            }
                            locator {
                                type  = "css"
                                value = "#console-container div button:nth-child(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#console-container div.console-header button.btn-clear"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🔥 Force JS Crash\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(0)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🔥 Force JS Crash\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(0)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(5)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(0)"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🚫 Trigger 404\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(1)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🚫 Trigger 404\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(1)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(6)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(1)"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🧟 Zombie XHR\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(2)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🧟 Zombie XHR\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(7)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(2)"
                            }
                        }
                    }

                    wait {
                        milliseconds = 0
                        timeout      = 0
                        wait_for     = "network"
                    }
                }
            }
            event {
                description = "click on \"CLEAR\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(6)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"CLEAR\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn-clear"
                            }
                            locator {
                                type  = "css"
                                value = "#console-container div button:nth-child(2)"
                            }
                            locator {
                                type  = "css"
                                value = "#console-container div.console-header button.btn-clear"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🧠 CPU Burn (3s)\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(3)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🧠 CPU Burn\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(3)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(9)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(3)"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🧪 Memory Leak\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(4)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🧪 Memory Leak\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(4)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(10)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(4)"
                            }
                        }
                    }
                }
            }
            event {
                description = "click on \"🚀 Traffic Spike (100 reqs)\""

                click {
                    button = 0

                    target {
                        window = null

                        locators {
                            locator {
                                type  = "css"
                                value = "button:eq(5)"
                            }
                            locator {
                                type  = "css"
                                value = "button:contains(\"🚀 Traffic Spike\")"
                            }
                            locator {
                                type  = "css"
                                value = ".btn:eq(5)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button:nth-child(11)"
                            }
                            locator {
                                type  = "css"
                                value = "#sidebar button.btn:eq(5)"
                            }
                        }
                    }

                    wait {
                        milliseconds = 0
                        timeout      = 0
                        wait_for     = "network"
                    }
                }
            }
        }
    }
}
