
# Get a single service definition returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ServiceDefinitionAPI.new
p api_instance.get_service_definition("service-definition-test")