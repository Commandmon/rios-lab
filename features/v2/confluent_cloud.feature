@endpoint(confluent-cloud) @endpoint(confluent-cloud-v2)
Feature: Confluent Cloud
  Configure your Datadog Confluent Cloud integration directly through the
  Datadog API.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "ConfluentCloud" API

  @generated @skip @team:Datadog/web-integrations
  Scenario: Add Confluent account returns "Bad Request" response
    Given new "CreateConfluentAccount" request
    And body with value {"data": {"attributes": {"api_key": "TESTAPIKEY123", "api_secret": "test-api-secret-123", "resources": [{"id": "resource-id-123", "resource_type": "kafka", "tags": ["myTag", "myTag2:myValue"]}], "tags": ["myTag", "myTag2:myValue"]}, "type": "confluent-cloud-accounts"}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:Datadog/web-integrations
  Scenario: Add Confluent account returns "Not Found" response
    Given new "CreateConfluentAccount" request
    And body with value {"data": {"attributes": {"api_key": "TESTAPIKEY123", "api_secret": "test-api-secret-123", "resources": [{"id": "resource-id-123", "resource_type": "kafka", "tags": ["myTag", "myTag2:myValue"]}], "tags": ["myTag", "myTag2:myValue"]}, "type": "confluent-cloud-accounts"}}
    When the request is sent
    Then the response status is 404 Not Found

  @generated @skip @team:Datadog/web-integrations
  Scenario: Add Confluent account returns "OK" response
    Given new "CreateConfluentAccount" request
    And body with value {"data": {"attributes": {"api_key": "TESTAPIKEY123", "api_secret": "test-api-secret-123", "resources": [{"id": "resource-id-123", "resource_type": "kafka", "tags": ["myTag", "myTag2:myValue"]}], "tags": ["myTag", "myTag2:myValue"]}, "type": "confluent-cloud-accounts"}}
    When the request is sent
    Then the response status is 201 OK

  @generated @skip @team:Datadog/web-integrations
  Scenario: Add resource to Confluent account returns "Bad Request" response
    Given new "CreateConfluentResource" request
    And request contains "account_id" parameter from "REPLACE.ME"
    And body with value {"data": {"attributes": {"resource_type": "kafka", "tags": ["myTag", "myTag2:myValue"]}, "id": "resource-id-123", "type": "confluent-cloud-resources"}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:Datadog/web-integrations
  Scenario: Add resource to Confluent account returns "Not Found" response
    Given new "CreateConfluentResource" request
    And request contains "account_id" parame