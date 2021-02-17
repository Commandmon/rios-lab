# Search tests events returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::CIVisibilityTestsAPI.new

body = DatadogAPIClient::V2::CIAppTestEventsRequest.new({
  filter: DatadogAPIClient::V2::CIAppTestsQueryFilter.new({
    from: "now-15m",
    query: "@test.service:web-ui-tests AND @test.status:skip",
    to: "now",
  }),
  option