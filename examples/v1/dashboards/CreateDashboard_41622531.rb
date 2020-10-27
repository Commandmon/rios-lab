# Create a new dashboard with timeseries widget and formula style attributes

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::DashboardsAPI.new

body = DatadogAPIClient::V1::Dashboard.new({
  title: "Example-Create_a_new_dashboard_with_timeseries_widget_and_formula_style_attributes with formula style",
  widgets: [
    DatadogAPIClient::V1::Widget.new({
      definition: DatadogAPIClient::V1::TimeseriesWidgetDefinition.new({
        title: "styled timeseries",
        show_legend: true,
        legend_layout: DatadogAPIClient::V1::TimeseriesWidgetLegendLayout::AUTO,
        legend_columns: [
          DatadogAPIClient::V1::TimeseriesWidgetLegendColumn::AVG,
          DatadogAPIClient::V1::TimeseriesWidgetLegendColumn::MIN,
          DatadogAPIClient::V1::TimeseriesWidgetLegendColumn::MAX,
          DatadogAPIClient::V1::TimeseriesWidgetLegendColumn::VALUE,
          DatadogAPIClient::V1::TimeseriesWidgetLegendColumn::SUM,
        ],
        time: DatadogAPIClient::V1::WidgetTime.new({}),
        type: DatadogAPIClient::V1::TimeseriesWidgetDefinitionType::TIMESERIES,
        requests: [
          DatadogAPIClient::V1::TimeseriesWidgetRequest.new({
            formulas: [
              DatadogAPIClient::V1::WidgetFormula.new({
                formula: "query1",
                style: DatadogAPIClient::V1::WidgetFormulaStyle.new({
                  palette_index: 4,
                  palette: "classic",
                }),
              }),
            ],
            queries: [
              DatadogAPIClient::V1::FormulaAndFunctionMetricQueryDefinition.new({
                query: "avg:system.cpu.user{*}",
                data_source: DatadogAPIClient::V1::FormulaA