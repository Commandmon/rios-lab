@endpoint(authn-mappings) @endpoint(authn-mappings-v2)
Feature: AuthN Mappings
  [AuthN Mappings API](https://docs.datadoghq.com/account_management/authn_m
  apping/?tab=example) is used to automatically map group of users to roles
  in Datadog using attributes sent from Identity Providers.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "AuthNMappings" API

  @generated @skip @team:DataDog/team-aaa
  Scenario: Create an AuthN Mapping returns "Bad Request" response
    Given new "CreateAuthNMapping" request
    And body with value {"data": {"attributes": {"attribute_key": "member-of", "attribute_value": "Development"}, "relationships": {"role": {"data": {"id": "3653d3