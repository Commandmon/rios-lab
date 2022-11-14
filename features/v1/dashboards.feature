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
    And the response "widgets[0].definition.requests[0].profile_metrics_query.compute.aggregation" is equal to "sum"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with a formulas and functions change widget
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [ { "definition": { "title": "", "title_size": "16", "title_align": "left", "time": {}, "type": "change", "requests": [ { "formulas": [ { "formula": "hour_before(query1)" }, { "formula": "query1" } ], "queries": [ { "data_source": "logs", "name": "query1", "search": { "query": "" }, "indexes": [ "*" ], "compute": { "aggregation": "count" }, "group_by": [] } ], "response_format": "scalar", "compare_to": "hour_before", "increase_good": true, "order_by": "change", "change_type": "absolute", "order_dir": "desc" } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 4 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"
    And the response "widgets[0].definition.requests[0].compare_to" is equal to "hour_before"
    And the response "widgets[0].definition.requests[0].increase_good" is equal to true
    And the response "widgets[0].definition.requests[0].order_by" is equal to "change"
    And the response "widgets[0].definition.requests[0].change_type" is equal to "absolute"
    And the response "widgets[0].definition.requests[0].order_dir" is equal to "desc"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "logs"
    And the response "widgets[0].definition.requests[0].queries[0].name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].queries[0].compute.aggregation" is equal to "count"
    And the response "widgets[0].definition.requests[0].formulas[0].formula" is equal to "hour_before(query1)"
    And the response "widgets[0].definition.requests[0].formulas[1].formula" is equal to "query1"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with a formulas and functions treemap widget
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [ { "definition": { "title": "", "type": "treemap", "requests": [ { "formulas": [ { "formula": "hour_before(query1)" }, { "formula": "query1" } ], "queries": [ { "data_source": "logs", "name": "query1", "search": { "query": "" }, "indexes": [ "*" ], "compute": { "aggregation": "count" }, "group_by": [] } ], "response_format": "scalar" } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 4 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "logs"
    And the response "widgets[0].definition.requests[0].queries[0].name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].queries[0].compute.aggregation" is equal to "count"
    And the response "widgets[0].definition.requests[0].formulas[0].formula" is equal to "hour_before(query1)"
    And the response "widgets[0].definition.requests[0].formulas[1].formula" is equal to "query1"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with a query value widget using the percentile aggregator
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with QVW Percentile Aggregator", "widgets": [{"definition":{"title_size":"16","title":"","title_align":"left","precision":2,"time":{},"autoscale":true,"requests":[{"formulas":[{"formula":"query1"}],"response_format":"scalar","queries":[{"query":"p90:dist.dd.dogweb.latency{*}","data_source":"metrics","name":"query1","aggregator":"percentile"}]}],"type":"query_value"},"layout":{"y":0,"x":0,"height":2,"width":2}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with QVW Percentile Aggregator"
    And the response "widgets[0].definition.title_size" is equal to "16"
    And the response "widgets[0].definition.title_align" is equal to "left"
    And the response "widgets[0].definition.requests[0].formulas[0].formula" is equal to "query1"
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with a query value widget using timeseries background
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with QVW Timeseries Background", "widgets": [{"definition":{"title_size":"16","title":"","title_align":"left","precision":2,"time":{},"autoscale":true,"requests":[{"formulas":[{"formula":"query1"}],"response_format":"scalar","queries":[{"query":"sum:my.cool.count.metric{*}","data_source":"metrics","name":"query1","aggregator":"percentile"}]}],"type":"query_value","timeseries_background":{"type":"area","yaxis":{"include_zero":true}}},"layout":{"y":0,"x":0,"height":2,"width":2}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with QVW Timeseries Background"
    And the response "widgets[0].definition.title_size" is equal to "16"
    And the response "widgets[0].definition.title_align" is equal to "left"
    And the response "widgets[0].definition.requests[0].formulas[0].formula" is equal to "query1"
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"
    And the response "widgets[0].definition.requests[0].queries[0].query" is equal to "sum:my.cool.count.metric{*}"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with alert_graph widget
    Given there is a valid "monitor" in the system
    And new "CreateDashboard" request
    And body from file "dashboards_json_payload/alert_graph_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "alert_graph"
    And the response "widgets[0].definition.viz_type" is equal to "timeseries"
    And the response "widgets[0].definition.alert_id" is equal to "{{ monitor.id }}"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with alert_value widget
    Given there is a valid "monitor" in the system
    And new "CreateDashboard" request
    And body from file "dashboards_json_payload/alert_value_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "alert_value"
    And the response "widgets[0].definition.alert_id" is equal to "{{ monitor.id }}"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with an audit logs query
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with Audit Logs Query", "widgets": [{"definition": {"type": "timeseries","requests": [{"response_format": "timeseries","queries": [{"search": {"query": ""},"data_source": "audit","compute": {"aggregation": "count"},"name": "query1","indexes": ["*"],"group_by": []}]}]},"layout": {"x": 2,"y": 0,"width": 4,"height": 2}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with Audit Logs Query"
    And the response "widgets[0].definition.type" is equal to "timeseries"
    And the response "widgets[0].definition.requests[0].response_format" is equal to "timeseries"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "audit"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with apm dependency stats widget
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [{"definition": { "title": "", "title_size": "16", "title_align": "left", "type": "query_table", "requests": [ { "response_format": "scalar", "queries": [ { "primary_tag_value": "edge-eu1.prod.dog", "stat": "avg_duration", "resource_name": "DELETE FROM monitor_history.monitor_state_change_history WHERE org_id = ? AND monitor_id IN ? AND group = ?", "name": "query1", "service": "cassandra", "data_source": "apm_dependency_stats", "env": "ci", "primary_tag_name": "datacenter", "operation_name": "cassandra.query" } ] } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 4 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"
    And the response "widgets[0].definition.requests[0].queries[0].primary_tag_value" is equal to "edge-eu1.prod.dog"
    And the response "widgets[0].definition.requests[0].queries[0].stat" is equal to "avg_duration"
    And the response "widgets[0].definition.requests[0].queries[0].resource_name" is equal to "DELETE FROM monitor_history.monitor_state_change_history WHERE org_id = ? AND monitor_id IN ? AND group = ?"
    And the response "widgets[0].definition.requests[0].queries[0].name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].queries[0].service" is equal to "cassandra"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "apm_dependency_stats"
    And the response "widgets[0].definition.requests[0].queries[0].env" is equal to "ci"
    And the response "widgets[0].definition.requests[0].queries[0].primary_tag_name" is equal to "datacenter"
    And the response "widgets[0].definition.requests[0].queries[0].operation_name" is equal to "cassandra.query"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with apm resource stats widget
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [{"definition": { "title": "", "title_size": "16", "title_align": "left", "type": "query_table", "requests": [ { "response_format": "scalar", "queries": [ { "primary_tag_value": "edge-eu1.prod.dog", "stat": "hits", "name": "query1", "service": "cassandra", "data_source": "apm_resource_stats", "env": "ci", "primary_tag_name": "datacenter", "operation_name": "cassandra.query", "group_by": ["resource_name"] } ] } ] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 4 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].response_format" is equal to "scalar"
    And the response "widgets[0].definition.requests[0].queries[0].primary_tag_value" is equal to "edge-eu1.prod.dog"
    And the response "widgets[0].definition.requests[0].queries[0].stat" is equal to "hits"
    And the response "widgets[0].definition.requests[0].queries[0].group_by[0]" is equal to "resource_name"
    And the response "widgets[0].definition.requests[0].queries[0].name" is equal to "query1"
    And the response "widgets[0].definition.requests[0].queries[0].service" is equal to "cassandra"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "apm_resource_stats"
    And the response "widgets[0].definition.requests[0].queries[0].env" is equal to "ci"
    And the response "widgets[0].definition.requests[0].queries[0].primary_tag_name" is equal to "datacenter"
    And the response "widgets[0].definition.requests[0].queries[0].operation_name" is equal to "cassandra.query"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with apm_issue_stream list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"apm_issue_stream","query_string":""},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with list_stream widget"
    And the response "widgets[0].definition.type" is equal to "list_stream"
    And the response "widgets[0].definition.requests[0].columns[0].width" is equal to "auto"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "apm_issue_stream"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with check_status widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/check_status_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "check_status"
    And the response "widgets[0].definition.check" is equal to "datadog.agent.up"
    And the response "widgets[0].definition.grouping" is equal to "check"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with ci_test_stream list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"ci_test_stream","query_string":"test_level:suite"},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "list_stream"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "ci_test_stream"
    And the response "widgets[0].definition.requests[0].query.query_string" is equal to "test_level:suite"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with distribution widget and apm stats data
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [{"definition": { "title": "", "title_size": "16", "title_align": "left", "type": "distribution", "requests": [{ "apm_stats_query": { "env": "prod", "service": "cassandra", "name": "cassandra.query", "primary_tag": "datacenter:dc1", "row_type": "service" }}] }, "layout": { "x": 0, "y": 0, "width": 4, "height": 4 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].apm_stats_query.primary_tag" is equal to "datacenter:dc1"
    And the response "widgets[0].definition.requests[0].apm_stats_query.row_type" is equal to "service"
    And the response "widgets[0].definition.requests[0].apm_stats_query.env" is equal to "prod"
    And the response "widgets[0].definition.requests[0].apm_stats_query.service" is equal to "cassandra"
    And the response "widgets[0].definition.requests[0].apm_stats_query.name" is equal to "cassandra.query"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with event_stream list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered","title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns": [{"width": "auto","field": "timestamp"}],"query": {"data_source": "event_stream","query_string": "","event_size": "l"},"response_format": "event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "list_stream"
    And the response "widgets[0].definition.requests[0].response_format" is equal to "event_list"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "event_stream"
    And the response "widgets[0].definition.requests[0].query.event_size" is equal to "l"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with event_stream widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/event_stream_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "event_stream"
    And the response "widgets[0].definition.query" is equal to "example-query"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with event_timeline widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/event_timeline_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "event_timeline"
    And the response "widgets[0].definition.query" is equal to "status:error priority:all"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with formulas and functions scatterplot widget
    Given new "CreateDashboard" request
    And body with value { "title": "{{ unique }}", "widgets": [ { "id": 5346764334358972, "definition": { "title": "", "title_size": "16", "title_align": "left", "type": "scatterplot", "requests": { "table": { "formulas": [ { "formula": "query1", "dimension": "x", "alias": "my-query1" }, { "formula": "query2", "dimension": "y", "alias": "my-query2" } ], "queries": [ { "data_source": "metrics", "name": "query1", "query": "avg:system.cpu.user{*} by {service}", "aggregator": "avg" }, { "data_source": "metrics", "name": "query2", "query": "avg:system.mem.used{*} by {service}", "aggregator": "avg" } ], "response_format": "scalar" } } }, "layout": { "x": 0, "y": 0, "width": 4, "height": 2 } } ], "layout_type": "ordered" }
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests.table.formulas[0].formula" is equal to "query1"
    And the response "widgets[0].definition.requests.table.formulas[0].dimension" is equal to "x"
    And the response "widgets[0].definition.requests.table.formulas[0].alias" is equal to "my-query1"
    And the response "widgets[0].definition.requests.table.formulas[1].formula" is equal to "query2"
    And the response "widgets[0].definition.requests.table.formulas[1].dimension" is equal to "y"
    And the response "widgets[0].definition.requests.table.formulas[1].alias" is equal to "my-query2"
    And the response "widgets[0].definition.requests.table.queries[0].data_source" is equal to "metrics"
    And the response "widgets[0].definition.requests.table.queries[0].name" is equal to "query1"
    And the response "widgets[0].definition.requests.table.queries[0].query" is equal to "avg:system.cpu.user{*} by {service}"
    And the response "widgets[0].definition.requests.table.queries[0].aggregator" is equal to "avg"
    And the response "widgets[0].definition.requests.table.queries[1].data_source" is equal to "metrics"
    And the response "widgets[0].definition.requests.table.queries[1].name" is equal to "query2"
    And the response "widgets[0].definition.requests.table.queries[1].query" is equal to "avg:system.mem.used{*} by {service}"
    And the response "widgets[0].definition.requests.table.queries[1].aggregator" is equal to "avg"
    And the response "widgets[0].definition.requests.table.response_format" is equal to "scalar"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with free_text widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/free_text_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "free_text"
    And the response "widgets[0].definition.text" is equal to "Example free text"
    And the response "widgets[0].definition.color" is equal to "#4d4d4d"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with funnel widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with funnel widget","widgets": [{"definition": {"type": "funnel","requests": [{"query":{"data_source":"rum","query_string":"","steps":[]},"request_type":"funnel"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "title" is equal to "{{ unique }} with funnel widget"
    And the response "widgets[0].definition.type" is equal to "funnel"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "rum"
    And the response "widgets[0].definition.requests[0].request_type" is equal to "funnel"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with geomap widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/geomap_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "geomap"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with heatmap widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/heatmap_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "heatmap"
    And the response "widgets[0].definition.requests[0].q" is equal to "avg:system.cpu.user{*} by {service}"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with hostmap widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/hostmap_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "hostmap"
    And the response "widgets[0].definition.requests.fill.q" is equal to "avg:system.cpu.user{*} by {host}"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with iframe widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/iframe_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "iframe"
    And the response "widgets[0].definition.url" is equal to "https://docs.datadoghq.com/api/latest/"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with image widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/image_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "image"
    And the response "widgets[0].definition.url" is equal to "https://example.com/image.png"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"apm_issue_stream","query_string":""},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "list_stream"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "apm_issue_stream"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with log_stream widget
    Given new "CreateDashboard" request
    And body from file "dashboards_json_payload/log_stream_widget.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "log_stream"
    And the response "widgets[0].definition.query" is equal to ""
    And the response "widgets[0].definition.indexes[0]" is equal to "main"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with logs query table widget and storage parameter
    Given new "CreateDashboard" request
    And body with value {"layout_type":"ordered","title":"{{ unique }} with query table widget and storage parameter","widgets":[{"definition":{"type":"query_table","requests":[{"queries":[{"data_source":"logs","name":"query1","search":{"query":""},"indexes":["*"],"compute":{"aggregation":"count"},"group_by":[],"storage":"online_archives"}],"formulas":[{"conditional_formats":[],"cell_display_mode":"bar","formula":"query1","limit":{"count":50,"order":"desc"}}],"response_format":"scalar"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "query_table"
    And the response "widgets[0].definition.requests[0].queries[0].data_source" is equal to "logs"
    And the response "widgets[0].definition.requests[0].queries[0].storage" is equal to "online_archives"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with logs_pattern_stream list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"logs_pattern_stream","query_string":"","group_by":[{"facet":"service"}]},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "logs_pattern_stream"
    And the response "widgets[0].definition.requests[0].query.group_by[0].facet" is equal to "service"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with logs_stream list_stream widget and storage parameter
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"logs_stream","query_string":"", "storage": "hot"},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.type" is equal to "list_stream"
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "logs_stream"
    And the response "widgets[0].definition.requests[0].query.storage" is equal to "hot"

  @team:DataDog/dashboards
  Scenario: Create a new dashboard with logs_transaction_stream list_stream widget
    Given new "CreateDashboard" request
    And body with value {"layout_type": "ordered", "title": "{{ unique }} with list_stream widget","widgets": [{"definition": {"type": "list_stream","requests": [{"columns":[{"width":"auto","field":"timestamp"}],"query":{"data_source":"logs_transaction_stream","query_string":"","group_by":[{"facet":"service"}],"compute":[{"facet":"service","aggregation":"count"}]},"response_format":"event_list"}]}}]}
    When the request is sent
    Then the response status is 200 OK
    And the response "widgets[0].definition.requests[0].query.data_source" is equal to "logs_transaction_stream"
    And the response "widgets[0].definition.requests[0].query.group_by[0].facet" is equa