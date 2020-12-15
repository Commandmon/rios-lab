@endpoint(security-monitoring) @endpoint(security-monitoring-v2)
Feature: Security Monitoring
  Detection rules for generating signals and listing of generated signals.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "SecurityMonitoring" API

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Change the related incidents of a security signal returns "Bad Request" response
    Given new "EditSecurityMonitoringSignalIncidents" request
    And request contains "signal_id" parameter from "REPLACE.ME"
    And body with value {"data": {"attributes": {"incident_ids": [2066]}}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Change the related incidents of a security signal returns "Not Found" response
    Given new "EditSecurityMonitoringSignalIncidents" request
    And request contains "signal_id" parameter from "REPLACE.ME"
    And body with value {"data": {"attributes": {"incident_ids": [2066]}}}
    When the request is sent
    Then the response status is 404 Not Found

  @replay-only @team:DataDog/k9-cloud-security-platform
  Scenario: Change the related incidents of a security signal returns "OK" response
    Given new "EditSecurityMonitoringSignalIncidents" request
    And request contains "signal_id" parameter with value "AQAAAYG1bl5K4HuUewAAAABBWUcxYmw1S0FBQmt2RmhRN0V4ZUVnQUE"
    And body with value {"data": {"attributes": {"incident_ids": [2066]}}}
    When the request is sent
    Then the response status is 200 OK

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Change the triage state of a security signal returns "Bad Request" response
    Given new "EditSecurityMonitoringSignalState" request
    And request contains "signal_id" parameter from "REPLACE.ME"
    And body with value {"data": {"attributes": {"archive_reason": "none", "state": "open"}}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Change the triage state of a security signal returns "Not Found" response
    Given new "EditSecurityMonitoringSignalState" request
    And request contains "signal_id" parameter from "REPLACE.ME"
    And body with value {"data": {"attributes": {"archive_reason": "none", "state": "open"}}}
    When the request is sent
    Then the response status is 404 Not Found

  @replay-only @team:DataDog/k9-cloud-security-platform
  Scenario: Change the triage state of a security signal returns "OK" response
    Given new "EditSecurityMonitoringSignalState" request
    And request contains "signal_id" parameter with value "AQAAAYG1bl5K4HuUewAAAABBWUcxYmw1S0FBQmt2RmhRN0V4ZUVnQUE"
    And body with value {"data": {"attributes": {"archive_reason": "none", "state": "open"}}}
    When the request is sent
    Then the response status is 200 OK

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a cloud_configuration rule returns "OK" response
    Given new "CreateSecurityMonitoringRule" request
    And body with value {"type":"cloud_configuration","name":"{{ unique }}_cloud","isEnabled":false,"cases":[{"status":"info","notifications":["channel"]}],"options":{"complianceRuleOptions":{"resourceType":"gcp_compute_disk","complexRule": false,"regoRule":{"policy":"package datadog\n","resourceTypes":["gcp_compute_disk"]}}},"message":"ddd","tags":["my:tag"],"complianceSignalOptions":{"userActivationStatus":true,"userGroupByFields":["@account_id"]}}
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "{{ unique }}_cloud"
    And the response "type" is equal to "cloud_configuration"
    And the response "message" is equal to "ddd"
    And the response "options.complianceRuleOptions.resourceType" is equal to "gcp_compute_disk"

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a detection rule returns "Bad Request" response
    Given new "CreateSecurityMonitoringRule" request
    And body with value {"name":"{{ unique }}", "queries":[{"query":""}],"cases":[{"status":"info"}],"options":{},"message":"Test rule","tags":[],"isEnabled":true}
    When the request is sent
    Then the response status is 400 Bad Request

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a detection rule returns "OK" response
    Given new "CreateSecurityMonitoringRule" request
    And body with value {"name":"{{ unique }}", "queries":[{"query":"@test:true","aggregation":"count","groupByFields":[],"distinctFields":[],"metric":""}],"filters":[],"cases":[{"name":"","status":"info","condition":"a > 0","notifications":[]}],"options":{"evaluationWindow":900,"keepAlive":3600,"maxSignalDuration":86400},"message":"Test rule","tags":[],"isEnabled":true, "type":"log_detection"}
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "{{ unique }}"
    And the response "type" is equal to "log_detection"
    And the response "message" is equal to "Test rule"

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a detection rule with type 'impossible_travel' returns "OK" response
    Given new "CreateSecurityMonitoringRule" request
    And body with value {"queries":[{"aggregation":"geo_data","groupByFields":["@usr.id"],"distinctFields":[],"metric":"@network.client.geoip","query":"*"}],"cases":[{"name":"","status":"info","notifications":[]}],"hasExtendedTitle":true,"message":"test","isEnabled":true,"options":{"maxSignalDuration":86400,"evaluationWindow":900,"keepAlive":3600,"detectionMethod":"impossible_travel","impossibleTravelOptions":{"baselineUserLocations":false}},"name":"{{ unique }}","type":"log_detection","tags":[],"filters":[]}
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "{{ unique }}"
    And the response "type" is equal to "log_detection"
    And the response "message" is equal to "test"
    And the response "options.detectionMethod" is equal to "impossible_travel"

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a detection rule with type 'signal_correlation' returns "OK" response
    Given there is a valid "security_rule" in the system
    And there is a valid "security_rule_bis" in the system
    And new "CreateSecurityMonitoringRule" request
    And body with value {"name":"{{ unique }}_signal_rule", "queries":[{"ruleId":"{{ security_rule.id }}","aggregation":"event_count","correlatedByFields":["host"],"correlatedQueryIndex":1}, {"ruleId":"{{ security_rule_bis.id }}","aggregation":"event_count","correlatedByFields":["host"]}],"filters":[],"cases":[{"name":"","status":"info","condition":"a > 0 && b > 0","notifications":[]}],"options":{"evaluationWindow":900,"keepAlive":3600,"maxSignalDuration":86400},"message":"Test signal correlation rule","tags":[],"isEnabled":true, "type": "signal_correlation"}
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "{{ unique }}_signal_rule"
    And the response "type" is equal to "signal_correlation"
    And the response "message" is equal to "Test signal correlation rule"
    And the response "isEnabled" is equal to true

  @team:DataDog/k9-cloud-security-platform
  Scenario: Create a detection rule with type 'workload_security' returns "OK" response
    Given new "CreateSecurityMonitoringRule" request
    And body with value {"name":"{{ unique }}", "queries":[{"query":"@test:true","aggregation":"count","groupByFields":[],"distinctFields":[],"metric":""}],"filters":[],"cases":[{"name":"","status":"info","condition":"a > 0","notifications":[]}],"options":{"evaluationWindow":900,"keepAlive":3600,"maxSignalDuration":86400},"message":"Test rule","tags":[],"isEnabled":true, "type": "workload_security"}
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "{{ unique }}"
    And the response "type" is equal to "workload_security"
    And the response "message" is equal to "Test rule"
    And the response "isEnabled" is equal to true

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Create a security filter returns "Bad Request" response
    Given new "CreateSecurityFilter" request
    And body with value {"data": {"attributes": {"exclusion_filters": [{"name": "Exclude staging", "query": "source:staging"}], "filtered_data_type": "logs", "is_enabled": true, "name": "Custom security filter", "query": "service:api"}, "type": "security_filters"}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/k9-cloud-security-platform
  Scenario: Create a security filter returns "Conflict" response
    Given new "CreateSecurityFilter" requ