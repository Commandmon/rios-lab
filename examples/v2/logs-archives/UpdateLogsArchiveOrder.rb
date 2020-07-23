# Update archive order returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::LogsArchivesAPI.new

body = DatadogAPIClient::V2::LogsArchiveOrder.new({
  data: DatadogAPIClient::V2::LogsArchiveOrderDefinition.new({
    attributes: DatadogAPIClient::V2::LogsArchiveOrderAttributes.new({
      archive_ids: [
        "a2zcMylnM4OCHpYusxIi1g",
        "a2zcMylnM4OCHpYusxIi2g",
        "a2