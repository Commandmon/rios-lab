# Create a cloud_configuration rule returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::SecurityMonitoringAPI.new

body = DatadogAPIClient::V2::CloudConfigurationRuleCreatePayload.new({
  type: DatadogAPIClient::V2::CloudConfigurationRuleType::CLOUD_CONFIGURATION,
  name: "Example-Create_a_cloud_co