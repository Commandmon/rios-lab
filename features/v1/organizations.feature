@endpoint(organizations) @endpoint(organizations-v1)
Feature: Organizations
  Create, edit, and manage your organizations. Read more about [multi-org ac
  counts](https://docs.datadoghq.com/account_management/multi_organization).

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "Organizations" API

  @generated @skip @team:DataDog/team-aaa
  Scenario: Create a child organization returns "Bad Request" response
    Given new "CreateChildOrg" request
    And body with value {"billing": {"type": "parent_billing"}, "name": "New child org", "subscription": {"type": "pro"}}
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/team-aaa
  Scenario: Create a child organization returns "OK" response
    Given new "CreateChildOrg" request
    And body with value {"billing": {"type": "parent_billing"}, "name": "New child org", "subscription": {"type": "pro"}}
    When the request is sent
    Then the response status is 200 OK

  @generated @skip @team:DataDog/team-aaa
  Scenario: Get organization information returns "Bad Request" response
    Given new "GetOrg" request
    And request contains "public_id" parameter from "REPLACE.ME"
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/team-aaa
  Scenario: Get organization information returns "OK" response
    Given new "GetOrg" request
    And request contains "public_id" parameter from "REPLACE.ME"
    When the request is sent
    Then the response status is 200 OK

  @generated @skip @team:DataDog/team-aaa
  Scenario: List your managed organizations returns "OK" response
    Given new "ListOrgs" request
    When the request is sent
    Then the response status is 200 OK

  @generated @skip @team:DataDog/team-aaa
  Scenario: Spin-off Child Organization returns "Bad Request" response
    Given new "DowngradeOrg" request
    And request contains "public_id" parameter from "REPLACE.ME"
    When the request is sent
    Then the response status is 400 Bad Request

  @generated @skip @team:DataDog/team-aaa
  Scenario: Spin-off Child Organization returns "OK" response
    Given new "DowngradeOrg" reque