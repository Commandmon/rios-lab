@endpoint(dashboards) @endpoint(dashboards-v1)
Feature: Dashboards
  Interact with your dashboard lists through the API to make it easier to
  organize, find, and share all of your dashboards with your team and
  organization.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "Dashboards" API

  @team:DataDog/dashboards
  Scenario: Create a distribution widget using a histogram request containing a formulas and functions APM Stats query
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "description": "", "widgets": [ { "definition": { "title": "APM Stats - Request latency HOP", "title_size": "16", "title_align": "left", "show_legend": false, "type": "distribution", "xaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "yaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "requests": [ { "query": { "primary_tag_value": "*", "stat": "latency_distribution", "data_source": "apm_resource_stats", "name": "query1", "service": "azure-bill-import", "group_by": [ "resource_name" ], "env": "staging", "primary_tag_name": "datacenter", "operation_name": "universal.http.client" }, "request_type": "histogram", "style": { "palette": "dog_classic" } } ] }, "layout": { "x": 8, "y": 0, "width": 4, "height": 2 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].request_type" is equal to "histogram"
    And the response "widgets[0].definition.requests[0].style" is equal to { "palette": "dog_classic" }
    And the response "widgets[0].definition.requests[0].query.primary_tag_value" is equal to "*"
    And the response "widgets[0].definition.requests[0].query.stat" is equal to "latency_distribution"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "apm_resource_stats"
    And the response "widgets[0].definition.requests[0].query.name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].query.service" is equal to "azure-bill-import"
    And the response "widgets[0].definition.requests[0].query.group_by" is equal to ["resource_name"]
    And the response "widgets[0].definition.requests[0].query.env" is equal to "staging"
    And the response "widgets[0].definition.requests[0].query.primary_tag_name" is equal to "datacenter"
    And the response "widgets[0].definition.requests[0].query.operation_name" is equal to "universal.http.client"

  @team:DataDog/dashboards
  Scenario: Create a distribution widget using a histogram request containing a formulas and functions events query
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "description": "{{ unique }}", "widgets": [ { "definition": { "title": "Events Platform - Request latency HOP", "title_size": "16", "title_align": "left", "show_legend": false, "type": "distribution", "xaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "yaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "requests": [ { "query": { "search": { "query": "" }, "data_source": "events", "compute": { "metric": "@duration", "aggregation": "min" }, "name": "query1", "indexes": [ "*" ], "group_by": [] }, "request_type": "histogram" } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 2 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].request_type" is equal to "histogram"
    And the response "widgets[0].definition.requests[0].query.search.query" is equal to ""
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "events"
    And the response "widgets[0].definition.requests[0].query.compute.metric" is equal to "@duration"
    And the response "widgets[0].definition.requests[0].query.compute.aggregation" is equal to "min"
    And the response "widgets[0].definition.requests[0].query.name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].query.indexes" is equal to ["*"]
    And the response "widgets[0].definition.requests[0].query.group_by" is equal to []

  @team:DataDog/dashboards
  Scenario: Create a distribution widget using a histogram request containing a formulas and functions metrics query
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [ { "definition": { "title": "Metrics HOP", "title_size": "16", "title_align": "left", "show_legend": false, "type": "distribution", "xaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "yaxis": { "max": "auto", "include_zero": true, "scale": "linear", "min": "auto" }, "requests": [ { "query": { "query": "histogram:trace.Load{*}", "data_source": "metrics", "name": "query1" }, "request_type": "histogram", "style": { "palette": "dog_classic" } } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 2 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].request_type" is equal to "histogram"
    And the response "widgets[0].definition.requests[0].style" is equal to { "palette": "dog_classic" }
    And the response "widgets[0].definition.requests[0].query.query" is equal to "histogram:trace.Load{*}"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "metrics"
    And the response "widgets[0].definition.requests[0].query.name" is equal to "query1"

  @generated @skip @team:DataDog/dashboards
  Scenario: Create a new dashboard returns "Bad Request" response
    Given new "CreateDashboard" request
    And body with value {"description": null, "is_read_only": false, "layout_type": "ordered", "notify_list": [], "reflow_type": "auto", "restricted_roles": [], "template_variable_presets": [{"template_variables": [{"values": []}]}], "template_variables": [{"available_values": ["my-host", "host1", "host2"], "default": "my-host", "defaults": ["my-host-1", "my-host-2"], "name": "host1", "prefix": "host"}], "title": "", "widgets": [{"definition": {"requests": {"fill": {"q": "avg:system.cpu.user{*}"}}, "type": "hostmap"}}]}
    When the request is sent
    Then the response status is 400 Bad Request

  @team:DataDog/dashboards
  Scenario: Create a new dashboard returns "OK" response
    Given new "CreateDashboard" request
    And body from file "dashboard_payload.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with Profile Metrics Query"
    And the response "widgets[0].definition.requests[0].profile_metrics_query.search.query" is equal to "runtime:jvm"
    And the response "widgets[0].definition.requests[0].profile_metrics_query.compute.facet" is equal to "@prof_core_cpu_cores"
    And the