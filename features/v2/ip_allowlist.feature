@endpoint(ip-allowlist) @endpoint(ip-allowlist-v2)
Feature: IP Allowlist
  The IP allowlist API is used to manage the IP addresses that can access
  the Datadog API and web UI. It does not block access to intake APIs or
  public dashboards.  This is an enterprise-only feature. Request access by
  contacting Datadog support.

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "IPAllowlist" API

  @generated @skip @team:DataDog/team-aaa
  Scenario: Get IP Allowlist returns "Not Found" response
    Given new "GetIPAllowlist