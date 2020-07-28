@endpoint(slack-integration) @endpoint(slack-integration-v1)
Feature: Slack Integration
  Configure your [Datadog-Slack
  integration](https://docs.datadoghq.com/integrations/slack) directly
  through the Datadog API.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "SlackIntegration" API

  @generated @skip @team:Datadog/web-integrations
  Scenario: Create a Slack integration channel returns "Bad Request" response
    Given new "