@endpoint(synthetics) @endpoint(synthetics-v1)
Feature: Synthetics
  Datadog Synthetics uses simulated user requests and browser rendering to
  help you ensure uptime, identify regional issues, and track your
  application performance. Datadog Synthetics tests come in two different
  flavors, [API
  tests](https://docs.datadoghq.com/synthetics/api_tests/?tab=httptest) and
  [browser tests](https://docs.datadoghq.com/synthetics/browser_tests). You
  can use Datadog’s API to manage both test types programmatically.  For
  more information about Synthetics, see the [Synthetics
  overview](https://docs.datadoghq.com/synthetics/).

  Background:
    Given a valid "apiKeyAuth" key in the system
    And a valid "appKeyAuth" key in the system
    And an instance of "Synthetics" API

  @replay-only @team:DataDog/synthetics-app
  Scenario: Client is resilient to enum and oneOf deserialization errors
    Given new "ListTests" request
    When the request is sent
    Then the response status is 200 OK - Returns the list of all Synthetic tests.
    And the response "tests" has length 6
    And the response "tests[0].config.assertions" has length 3
    And the response "tests[0].config.assertions[0].operator" is equal to "lessThan"
    And the response "tests[0].config.assertions[2].operator" is equal to "A non existent operator"
    And the response "tests[1].config.assertions[0].operator" is equal to "lessThan"
    And the response "tests[1].config.assertions[1].type" is equal to "A non existent assertion type"
    And the response "tests[2].options.device_ids" has length 3
    And the response "tests[2].options.device_ids[2]" is equal to "A non existent device ID"
    And the response "tests[3].type" is equal to "A non existent test type"
    And the response "tests[4].config.request.method" is equal to "A non existent method"

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a browser test ret