# Update an archive returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::LogsArchivesAPI.new

body = DatadogAPIClient::V2::LogsArchiveCreateRequest.new({
  data: DatadogAPIClient::V2::LogsAr