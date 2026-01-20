

resource "dynatrace_dashboard" "app_monitoring_zen" {
  # Code import terraform


    dashboard_metadata {
        consistent_colors = true
        name              = "Géo-Localisation 🌍 & Test Performance 🚀"
        owner             = "yahia.djarmouni@runreal.fr"
        preset            = true
      # shared            = false
        tags              = [
            "owner:yahia",
        ]
        tiles_name_size   = null
        unknowns          = null
        valid_filter_keys = []


# Test ajout de filtre dynamic

        dynamic_filters  {
             filters = [
        "CUSTOM_DIMENSION:OS",
        "CUSTOM_DIMENSION:Synthetic monitor",
        "CUSTOM_DIMENSION:Browser"
      ]
#             genericTagFilters = []
    }


#        dynamic_filters {
#            filters              = [
#                "HOST_MONITORING_MODE",
#            ]
#            unknowns             = null
#        }

        filter {
            timeframe = "-24h to now"
            unknowns  = null
        }
    }

    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = null
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Le Dashboard \"User Experience\" (RUM)"
        name_size                   = null
        query                       = null
        tile_type                   = "HEADER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = null
        visualization               = null

        bounds {
            height   = 38
            left     = 0
            top      = 38
            unknowns = null
            width    = 988
        }
    }
    tile {
        assigned_entities           = [
            "APPLICATION-EB8E96BCB95F32A3",
            "GEOLOCATION-0000000000000000",
            "WORLD",
        ]
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = null
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = "ACTION_COUNT"
        name                        = "World map"
        name_size                   = null
        query                       = null
        tile_type                   = "APPLICATION_WORLDMAP"
        time_frame_shift            = null
        type                        = null
        unknowns                    = null
        visualization               = null

        bounds {
            height   = 608
            left     = 380
            top      = 76
            unknowns = null
            width    = 608
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = null
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Multidimensional Analysis (Tracking Précis)"
        name_size                   = null
        query                       = null
        tile_type                   = "HEADER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = null
        visualization               = null

        bounds {
            height   = 38
            left     = 0
            top      = 722
            unknowns = null
            width    = 988
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Zombie Tracking (Timeouts)"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Zombie Tracking (Timeouts)"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=Inf&(builtin:synthetic.browser.event.actionDuration.xhr.geo:splitBy(\"dt.entity.synthetic_test_step\",\"dt.entity.geolocation\"):count:sort(value(avg,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:synthetic.browser.event.actionDuration.xhr.geo"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "COUNT"
                        splitBy          = [
                            "dt.entity.synthetic_test_step",
                            "dt.entity.geolocation",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes              = {
                        xAxis = {
                            visible = true
                        }
                    }
                    heatmapSettings   = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings = {
                        showHive   = true
                        showLegend = true
                    }
                    rules             = [
                        {
                            matcher    = "A:"
                            properties = {
                                color = "DEFAULT"
                            }
                        },
                    ]
                    thresholds        = [
                        {
                            axisTarget = "LEFT"
                            rules      = [
                                {
                                    color = "#7dc540"
                                },
                                {
                                    color = "#f5d30f"
                                },
                                {
                                    color = "#dc172a"
                                },
                            ]
                            visible    = true
                        },
                    ]
                    type              = "TOP_LIST"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 0
            top      = 1064
            unknowns = null
            width    = 988
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = null
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Dashboard : Infrastructure & Resources"
        name_size                   = null
        query                       = null
        tile_type                   = "HEADER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = null
        visualization               = null

        bounds {
            height   = 38
            left     = 0
            top      = 1406
            unknowns = null
            width    = 988
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Data explorer results"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Failure requests 404"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=null&(builtin:service.errors.fourxx.rate:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:service.errors.fourxx.rate"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "AUTO"
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes              = {
                        xAxis = {
                            displayName = ""
                            visible     = true
                        }
                        yAxes = [
                            {
                                defaultAxis = true
                                displayName = ""
                                max         = "AUTO"
                                min         = "AUTO"
                                position    = "LEFT"
                                queryIds    = [
                                    "A",
                                ]
                                visible     = true
                            },
                        ]
                    }
                    heatmapSettings   = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings = {
                        showHive   = true
                        showLegend = true
                    }
                    rules             = [
                        {
                            matcher       = "A:"
                            properties    = {
                                color      = "DEFAULT"
                                seriesType = "COLUMN"
                            }
                            unitTransform = "auto"
                            valueFormat   = "auto"
                        },
                    ]
                    thresholds        = [
                        {
                            axisTarget = "LEFT"
                            rules      = [
                                {
                                    color = "#7dc540"
                                },
                                {
                                    color = "#f5d30f"
                                },
                                {
                                    color = "#dc172a"
                                },
                            ]
                            visible    = true
                        },
                    ]
                    type              = "GRAPH_CHART"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 494
            top      = 1444
            unknowns = null
            width    = 494
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = null
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = "⚡ ZEN STRIKE | `GEO-INTELLIGENCE` 🌍 — **[LANCEZ UN STRESS TEST ICI 🚀](https://zenstrike88.github.io/)** — *Challengez le dashboard Dynatrace en temps réel !*"
        metric                      = null
        name                        = "Markdown"
        name_size                   = null
        query                       = null
        tile_type                   = "MARKDOWN"
        time_frame_shift            = null
        type                        = null
        unknowns                    = null
        visualization               = null

        bounds {
            height   = 38
            left     = 0
            top      = 0
            unknowns = null
            width    = 988
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Apdex Score"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Apdex Score"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=Inf&(builtin:apps.web.apdex.userType.geoBig:filter(and(or(in(\"dt.entity.application\",entitySelector(\"type(application),entityName.equals(~\"Géo-Localisation 🌍 & Test Performance 🚀~\")\"))))):splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        filterBy         = {
                            filterOperator = "AND"
                            nestedFilters  = [
                                {
                                    criteria        = [
                                        {
                                            evaluator    = "IN"
                                            matchExactly = true
                                            value        = "Géo-Localisation 🌍 & Test Performance 🚀"
                                        },
                                    ]
                                    entityAttribute = "entityName"
                                    filter          = "dt.entity.application"
                                    filterOperator  = "OR"
                                    filterType      = "NAME"
                                },
                            ]
                        }
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:apps.web.apdex.userType.geoBig"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "AUTO"
                        splitBy          = [
                            "dt.entity.application",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes                = {
                        xAxis = {
                            visible = true
                        }
                    }
                    heatmapSettings     = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings   = {
                        showHive   = true
                        showLegend = true
                    }
                    rules               = [
                        {
                            matcher    = "A:"
                            properties = {
                                color = "DEFAULT"
                            }
                        },
                    ]
                    singleValueSettings = {
                        linkTileColorToThreshold = true
                    }
                    thresholds          = [
                        {
                            axisTarget = "LEFT"
                            queryId    = ""
                            rules      = [
                                {
                                    color = "#7dc540"
                                    value = 0.9
                                },
                                {
                                    color = "#f5d30f"
                                    value = 0.85
                                },
                                {
                                    color = "#dc172a"
                                    value = 0.5
                                },
                            ]
                            visible    = true
                        },
                    ]
                    type                = "SINGLE_VALUE"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 0
            top      = 76
            unknowns = null
            width    = 380
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Top JavaScript Errors"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Top JavaScript Errors"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=Inf&(builtin:apps.web.jsErrorsDuringUa:filter(and(or(in(\"dt.entity.application\",entitySelector(\"type(application),entityName.equals(~\"Géo-Localisation 🌍 & Test Performance 🚀~\")\"))))):splitBy(\"User type\"):count:sort(value(avg,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        filterBy         = {
                            filterOperator = "AND"
                            nestedFilters  = [
                                {
                                    criteria        = [
                                        {
                                            evaluator    = "IN"
                                            matchExactly = true
                                            value        = "Géo-Localisation 🌍 & Test Performance 🚀"
                                        },
                                    ]
                                    entityAttribute = "entityName"
                                    filter          = "dt.entity.application"
                                    filterOperator  = "OR"
                                    filterType      = "NAME"
                                },
                            ]
                        }
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:apps.web.jsErrorsDuringUa"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "COUNT"
                        splitBy          = [
                            "User type",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes              = {
                        xAxis = {
                            visible = true
                        }
                    }
                    heatmapSettings   = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings = {
                        showHive   = true
                        showLegend = true
                    }
                    rules             = [
                        {
                            matcher    = "A:"
                            properties = {
                                color = "DEFAULT"
                            }
                        },
                    ]
                    thresholds        = [
                        {
                            axisTarget = "LEFT"
                            rules      = [
                                {
                                    color = "#7dc540"
                                },
                                {
                                    color = "#f5d30f"
                                },
                                {
                                    color = "#dc172a"
                                },
                            ]
                            visible    = true
                        },
                    ]
                    type              = "TOP_LIST"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 0
            top      = 380
            unknowns = null
            width    = 380
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Data explorer results"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "XHR Monitoring (RestCountries)"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=null&(builtin:apps.web.responseEnd.xhr.browser:filter(and(or(in(\"dt.entity.application\",entitySelector(\"type(application),entityName.equals(~\"Géo-Localisation 🌍 & Test Performance 🚀~\")\"))))):splitBy(\"dt.entity.browser\"):sort(value(auto,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        filterBy         = {
                            filterOperator = "AND"
                            nestedFilters  = [
                                {
                                    criteria        = [
                                        {
                                            evaluator    = "IN"
                                            matchExactly = true
                                            value        = "Géo-Localisation 🌍 & Test Performance 🚀"
                                        },
                                    ]
                                    entityAttribute = "entityName"
                                    filter          = "dt.entity.application"
                                    filterOperator  = "OR"
                                    filterType      = "NAME"
                                },
                            ]
                        }
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:apps.web.responseEnd.xhr.browser"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "AUTO"
                        splitBy          = [
                            "dt.entity.browser",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes               = {
                        xAxis = {
                            displayName = ""
                            visible     = true
                        }
                        yAxes = [
                            {
                                defaultAxis = true
                                displayName = ""
                                max         = "AUTO"
                                min         = "AUTO"
                                position    = "LEFT"
                                queryIds    = [
                                    "A",
                                ]
                                visible     = true
                            },
                        ]
                    }
                    graphChartSettings = {
                        connectNulls = true
                    }
                    heatmapSettings    = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings  = {
                        showHive   = true
                        showLegend = true
                    }
                    rules              = [
                        {
                            matcher    = "A:"
                            properties = {
                                color = "DEFAULT"
                            }
                        },
                    ]
                    thresholds         = [
                        {
                            axisTarget = "LEFT"
                            queryId    = ""
                            rules      = [
                                {
                                    color = "#7dc540"
                                    value = 1
                                },
                                {
                                    color = "#f5d30f"
                                    value = 2
                                },
                                {
                                    color = "#dc172a"
                                    value = 4
                                },
                            ]
                        },
                    ]
                    type               = "GRAPH_CHART"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 0
            top      = 760
            unknowns = null
            width    = 988
        }
    }
    tile {
        auto_refresh_disabled       = false
        chart_visible               = false
        configured                  = true
        custom_name                 = "Data explorer results"
        exclude_maintenance_windows = false
        limit                       = 0
        markdown                    = null
        metric                      = null
        name                        = "Network contribution by user type"
        name_size                   = null
        query                       = null
        tile_type                   = "DATA_EXPLORER"
        time_frame_shift            = null
        type                        = null
        unknowns                    = jsonencode(
            {
                metricExpressions = [
                    "resolution=null&(builtin:apps.web.networkContribution.load:filter(and(or(in(\"dt.entity.application\",entitySelector(\"type(application),entityName.equals(~\"Géo-Localisation 🌍 & Test Performance 🚀~\")\"))))):splitBy(\"User type\"):sort(value(auto,descending)):limit(20)):limit(100):names,(builtin:apps.web.networkContribution.xhr:filter(and(or(in(\"dt.entity.application\",entitySelector(\"type(application),entityName.equals(~\"Géo-Localisation 🌍 & Test Performance 🚀~\")\"))))):splitBy(\"User type\"):sort(value(auto,descending)):limit(20)):limit(100):names",
                ]
                queries           = [
                    {
                        enabled          = true
                        filterBy         = {
                            filterOperator = "AND"
                            nestedFilters  = [
                                {
                                    criteria        = [
                                        {
                                            evaluator    = "IN"
                                            matchExactly = true
                                            value        = "Géo-Localisation 🌍 & Test Performance 🚀"
                                        },
                                    ]
                                    entityAttribute = "entityName"
                                    filter          = "dt.entity.application"
                                    filterOperator  = "OR"
                                    filterType      = "NAME"
                                },
                            ]
                        }
                        id               = "A"
                        limit            = 20
                        metric           = "builtin:apps.web.networkContribution.load"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "AUTO"
                        splitBy          = [
                            "User type",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                    {
                        enabled          = true
                        filterBy         = {
                            filterOperator = "AND"
                            nestedFilters  = [
                                {
                                    criteria        = [
                                        {
                                            evaluator    = "IN"
                                            matchExactly = true
                                            value        = "Géo-Localisation 🌍 & Test Performance 🚀"
                                        },
                                    ]
                                    entityAttribute = "entityName"
                                    filter          = "dt.entity.application"
                                    filterOperator  = "OR"
                                    filterType      = "NAME"
                                },
                            ]
                        }
                        id               = "B"
                        limit            = 20
                        metric           = "builtin:apps.web.networkContribution.xhr"
                        rate             = "NONE"
                        sortBy           = "DESC"
                        sortByDimension  = ""
                        spaceAggregation = "AUTO"
                        splitBy          = [
                            "User type",
                        ]
                        timeAggregation  = "DEFAULT"
                    },
                ]
                queriesSettings   = {
                    resolution = ""
                }
                visualConfig      = {
                    axes              = {
                        xAxis = {
                            displayName = ""
                            visible     = true
                        }
                        yAxes = [
                            {
                                defaultAxis = true
                                displayName = ""
                                max         = "AUTO"
                                min         = "AUTO"
                                position    = "LEFT"
                                queryIds    = [
                                    "A",
                                    "B",
                                ]
                                visible     = true
                            },
                        ]
                    }
                    heatmapSettings   = {
                        yAxis = "VALUE"
                    }
                    honeycombSettings = {
                        showHive   = true
                        showLegend = true
                    }
                    rules             = [
                        {
                            matcher       = "A:"
                            properties    = {
                                color      = "RED"
                                seriesType = "AREA"
                            }
                            unitTransform = "auto"
                            valueFormat   = "auto"
                        },
                        {
                            matcher       = "B:"
                            properties    = {
                                color      = "YELLOW"
                                seriesType = "LINE"
                            }
                            unitTransform = "auto"
                            valueFormat   = "auto"
                        },
                    ]
                    thresholds        = [
                        {
                            axisTarget = "LEFT"
                            rules      = [
                                {
                                    color = "#7dc540"
                                },
                                {
                                    color = "#f5d30f"
                                },
                                {
                                    color = "#dc172a"
                                },
                            ]
                            visible    = true
                        },
                    ]
                    type              = "GRAPH_CHART"
                }
            }
        )
        visualization               = null

        bounds {
            height   = 304
            left     = 0
            top      = 1444
            unknowns = null
            width    = 494
        }
    }
}

