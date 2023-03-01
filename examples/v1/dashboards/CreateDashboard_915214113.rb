# Create a new dashboard with geomap widget

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::DashboardsAPI.new

body = DatadogAPIClient::V1::Dashboard.new({
  title: "Example-Create_a_new_dashboard_with_geomap_widget",
  description: nil,
  widgets: [
    DatadogAPIClient::V1::Widget.new({
      layout: DatadogAPIClient::V1::WidgetLayout.new({
        x: 0,
        y: 0,
        width: 47,
        height: 30,
      }),
      definition: DatadogAPIClient::V1::GeomapWidgetDefinition.new({
        title: "",
        title_size: "16",
        title_align: DatadogAPIC