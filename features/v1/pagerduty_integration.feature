@endpoint(pagerduty-integration) @endpoint(pagerduty-integration-v1)
Feature: PagerDuty Integration
  Configure your [Datadog-PagerDuty
  integration](https://docs.datadoghq.com/integrations/pagerduty/) directly
  through the Datadog API.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "PagerDutyIntegration" API

  @generated @skip @team:Datadog/web-integr