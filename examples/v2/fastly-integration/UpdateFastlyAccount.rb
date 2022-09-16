# Update Fastly account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::FastlyIntegrationAPI.new

# there is a valid "fastly_account" in the system
FASTLY_ACCOUNT_DATA_ID = ENV["FASTLY_ACCOUNT_DATA_ID"]

body = DatadogAPIClient::V2::FastlyAccountUpdateRequest.new({
  data: DatadogAPIClient::V2::FastlyAccountUpdateRequestData.new({
    attributes: DatadogAPIClient::V2::FastlyAccountUpdateRequ