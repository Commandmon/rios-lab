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
    And body with value {"type":"cloud_configuration","name":"{{ unique }}_cloud","isEnabled":false,"cases":[{"status":"info","notifications":["channel"]}],"options":{"complianceRuleOptions":{"resourceType":"gcp_compute_disk","complexRule": false,"regoRule":{"policy":"package datadog\n