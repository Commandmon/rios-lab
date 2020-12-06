# Trigger tests from CI/CD pipelines returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::SyntheticsAPI.new

body = DatadogAPIClient::V1::SyntheticsCITestBody.