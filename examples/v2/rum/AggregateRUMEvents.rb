# Aggregate RUM events returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::RUMAPI.new

body = DatadogAPIClient::V2::RUMAggregateRequest.new({
  compute: [
    DatadogAPIClient::V2::RUMCompute.new({
      aggregation: DatadogAPIClient::V2::RUMAggregationFunction::PERCENTILE_90,
      metric: "@view.time_spent",
      type: DatadogAPIClient::V2::RUMComputeType::TOTAL,
    }),
  ],
  filter: DatadogAPIClient::V2::RUMQueryFilter.new({
    from: "now-15m",
    query: "@type:view AND @session.type:user",
    to: "now",
  }),
  group_by: [
    DatadogAPIClient::V2::RUMGroupBy