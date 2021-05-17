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
  Scenario: Create a browser test returns "- JSON format is wrong" response
    Given new "CreateSyntheticsBrowserTest" request
    And body with value {"config": {"assertions": [], "configVariables": [{"name": "VARIABLE_NAME", "secure": false, "type": "text"}], "request": {"basicAuth": {"password": "PaSSw0RD!", "type": "web", "username": "my_username"}, "bodyType": "text/plain", "callType": "unary", "certificate": {"cert": {}, "key": {}}, "certificateDomains": [], "proxy": {"url": "https://example.com"}, "service": "Greeter", "url": "https://example.com"}, "variables": [{"name": "VARIABLE_NAME", "type": "text"}]}, "locations": ["aws:eu-west-3"], "message": "", "name": "Example test name", "options": {"ci": {"executionRule": "blocking"}, "device_ids": ["laptop_large"], "httpVersion": "http1", "monitor_options": {}, "restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"], "retry": {}, "rumSettings": {"applicationId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "clientTokenId": 12345, "isEnabled": true}, "scheduling": {"timeframes": [{"day": 1, "from": "07:00", "to": "16:00"}, {"day": 3, "from": "07:00", "to": "16:00"}], "timezone": "America/New_York"}}, "status": "live", "steps": [{"type": "assertElementContent"}], "tags": ["env:prod"], "type": "browser"}
    When the request is sent
    Then the response status is 400 - JSON format is wrong

  @team:DataDog/synthetics-app
  Scenario: Create a browser test returns "OK - Returns saved rumSettings." response
    Given new "CreateSyntheticsBrowserTest" request
    And body from file "synthetics_browser_test_payload_with_rum_settings.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "options.rumSettings.isEnabled" is equal to true
    And the response "options.rumSettings.applicationId" is equal to "mockApplicationId"
    And the response "options.rumSettings.clientTokenId" is equal to 12345

  @team:DataDog/synthetics-app
  Scenario: Create a browser test returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsBrowserTest" request
    And body from file "synthetics_browser_test_payload.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a browser test returns "Test quota is reached" response
    Given new "CreateSyntheticsBrowserTest" request
    And body with value {"config": {"assertions": [], "configVariables": [{"name": "VARIABLE_NAME", "secure": false, "type": "text"}], "request": {"basicAuth": {"password": "PaSSw0RD!", "type": "web", "username": "my_username"}, "bodyType": "text/plain", "callType": "unary", "certificate": {"cert": {}, "key": {}}, "certificateDomains": [], "proxy": {"url": "https://example.com"}, "service": "Greeter", "url": "https://example.com"}, "variables": [{"name": "VARIABLE_NAME", "type": "text"}]}, "locations": ["aws:eu-west-3"], "message": "", "name": "Example test name", "options": {"ci": {"executionRule": "blocking"}, "device_ids": ["laptop_large"], "httpVersion": "http1", "monitor_options": {}, "restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"], "retry": {}, "rumSettings": {"applicationId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "clientTokenId": 12345, "isEnabled": true}, "scheduling": {"timeframes": [{"day": 1, "from": "07:00", "to": "16:00"}, {"day": 3, "from": "07:00", "to": "16:00"}], "timezone": "America/New_York"}}, "status": "live", "steps": [{"type": "assertElementContent"}], "tags": ["env:prod"], "type": "browser"}
    When the request is sent
    Then the response status is 402 Test quota is reached

  @team:DataDog/synthetics-app
  Scenario: Create a browser test with advanced scheduling options returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsBrowserTest" request
    And body from file "synthetics_browser_test_payload_with_advanced_scheduling.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"
    And the response "options.scheduling.timeframes[0].day" is equal to 1
    And the response "options.scheduling.timeframes[0].from" is equal to "07:00"
    And the response "options.scheduling.timeframes[1].to" is equal to "16:00"
    And the response "options.scheduling.timezone" is equal to "America/New_York"

  @team:DataDog/synthetics-app
  Scenario: Create a global variable from test returns "OK" response
    Given there is a valid "synthetics_api_test_multi_step" in the system
    And new "CreateGlobalVariable" request
    And body from file "synthetics_global_variable_payload.json"
    When the request is sent
    Then the response status is 200 OK
    And the response "name" is equal to "GLOBAL_VARIABLE_PAYLOAD_{{ unique_upper_alnum }}"

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a global variable returns "Invalid request" response
    Given new "CreateGlobalVariable" request
    And body with value {"attributes": {"restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]}, "description": "Example description", "name": "MY_VARIABLE", "parse_test_options": {"field": "content-type", "localVariableName": "LOCAL_VARIABLE", "parser": {"type": "regex", "value": ".*"}, "type": "http_body"}, "parse_test_public_id": "abc-def-123", "tags": ["team:front", "test:workflow-1"], "value": {"secure": true, "value": "value"}}
    When the request is sent
    Then the response status is 400 Invalid request

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a global variable returns "OK" response
    Given new "CreateGlobalVariable" request
    And body with value {"attributes": {"restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]}, "description": "Example description", "name": "MY_VARIABLE", "parse_test_options": {"field": "content-type", "localVariableName": "LOCAL_VARIABLE", "parser": {"type": "regex", "value": ".*"}, "type": "http_body"}, "parse_test_public_id": "abc-def-123", "tags": ["team:front", "test:workflow-1"], "value": {"secure": true, "value": "value"}}
    When the request is sent
    Then the response status is 200 OK

  @team:DataDog/synthetics-app
  Scenario: Create a private location returns "OK" response
    Given there is a valid "role" in the system
    And new "CreatePrivateLocation" request
    And body with value {"description": "Test {{ unique }} description", "metadata": {"restricted_roles": ["{{ role.data.id }}"]}, "name": "{{ unique }}", "tags": ["test:{{ unique_lower_alnum }}"]}
    When the request is sent
    Then the response status is 200 OK
    And the response "private_location.name" is equal to "{{ unique }}"
    And the response "private_location.metadata.restricted_roles[0]" has the same value as "role.data.id"

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a private location returns "Private locations are not activated for the user" response
    Given new "CreatePrivateLocation" request
    And body with value {"description": "Description of private location", "metadata": {"restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]}, "name": "New private location", "tags": ["team:front"]}
    When the request is sent
    Then the response status is 404 Private locations are not activated for the user

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create a private location returns "Quota reached for private locations" response
    Given new "CreatePrivateLocation" request
    And body with value {"description": "Description of private location", "metadata": {"restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]}, "name": "New private location", "tags": ["team:front"]}
    When the request is sent
    Then the response status is 402 Quota reached for private locations

  @team:DataDog/synthetics-app
  Scenario: Create an API GRPC test returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsAPITest" request
    And body from file "synthetics_api_grpc_test_payload.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"

  @team:DataDog/synthetics-app
  Scenario: Create an API HTTP test returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsAPITest" request
    And body from file "synthetics_api_http_test_payload.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"

  @team:DataDog/synthetics-app
  Scenario: Create an API HTTP with oauth-rop test returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsAPITest" request
    And body from file "synthetics_api_http_test_oauth_rop_payload.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"

  @team:DataDog/synthetics-app
  Scenario: Create an API SSL test returns "OK - Returns the created test details." response
    Given new "CreateSyntheticsAPITest" request
    And body from file "synthetics_api_ssl_test_payload.json"
    When the request is sent
    Then the response status is 200 OK - Returns the created test details.
    And the response "name" is equal to "{{ unique }}"

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create an API test returns "- JSON format is wrong" response
    Given new "CreateSyntheticsAPITest" request
    And body with value {"config": {"assertions": [{"operator": "lessThan", "target": 1000, "type": "responseTime"}], "request": {"method": "GET", "url": "https://example.com"}}, "locations": ["aws:eu-west-3"], "message": "Notification message", "name": "Example test name", "options": {"ci": {"executionRule": "blocking"}, "device_ids": ["laptop_large"], "httpVersion": "http1", "monitor_options": {}, "restricted_roles": ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"], "retry": {}, "rumSettings": {"applicationId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "clientTokenId": 12345, "isEnabled": true}, "scheduling": {"timeframes": [{"day": 1, "from": "07:00", "to": "16:00"}, {"day": 3, "from": "07:00", "to": "16:00"}], "timezone": "America/New_York"}}, "status": "live", "subtype": "http", "tags": ["env:production"], "type": "api"}
    When the request is sent
    Then the response status is 400 - JSON format is wrong

  @generated @skip @team:DataDog/synthetics-app
  Scenario: Create an API test 