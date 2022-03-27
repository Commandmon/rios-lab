# Create a distribution widget using a histogram request containing a formulas and functions APM Stats query

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::DashboardsAPI.new

body = DatadogAPIClient::V1::Dashboard.new({
  title: "Example-Create_a_distribution_widget_using_a_histogram_request_containing_a_formulas_and_functions_APM_Stats",
  description: "",
  widgets: [
    DatadogAPIClient::V1::Widget.new({
      definition: DatadogAPIClient::V1::DistributionWidgetDefinition.new({
        title: "APM Stats - Request latency HOP",
        title_size: "16",
        title_align: DatadogAPIClient::V1::WidgetTextAlign::LEFT,
        show_legend: false,
        type: DatadogAPIClient::V1::DistributionWidgetDefinitionType::DISTRIBUTION,
        xaxis: DatadogAPIClient::V1::DistributionWidgetXAxis.new({
          max: "auto",
          include_zero: true,
          scale: "linear",
          min: "auto",
        }),
        yaxis: DatadogAPIClient::V1::DistributionWidgetYAxis.new({
          max: "auto",
          include_zero: true,
          scale: "linear",
          min: "auto",
        }),
        requests: [
          DatadogAPIClient::V1::DistributionWid