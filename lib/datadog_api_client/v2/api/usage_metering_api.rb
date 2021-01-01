
=begin
#Datadog API V2 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://github.com/DataDog/datadog-api-client-ruby/tree/master/.generator

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'cgi'

module DatadogAPIClient::V2
  class UsageMeteringAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Get cost across multi-org account.
    #
    # @see #get_cost_by_org_with_http_info
    def get_cost_by_org(start_month, opts = {})
      data, _status_code, _headers = get_cost_by_org_with_http_info(start_month, opts)
      data
    end

    # Get cost across multi-org account.
    #
    # Get cost across multi-org account.
    # Cost by org data for a given month becomes available no later than the 16th of the following month.
    # **Note:** This endpoint has been deprecated. Please use the new endpoint
    # [`/historical_cost`](https://docs.datadoghq.com/api/latest/usage-metering/#get-historical-cost-across-your-account)
    # instead.
    #
    # @deprecated This API is deprecated.
    #
    # @param start_month [Time] Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost beginning this month.
    # @param opts [Hash] the optional parameters
    # @option opts [Time] :end_month Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost ending this month.
    # @return [Array<(CostByOrgResponse, Integer, Hash)>] CostByOrgResponse data, response status code and response headers
    def get_cost_by_org_with_http_info(start_month, opts = {})
      warn "[DEPRECATION] `GetCostByOrg` is deprecated."

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_cost_by_org ...'
      end
      # verify the required parameter 'start_month' is set
      if @api_client.config.client_side_validation && start_month.nil?
        fail ArgumentError, "Missing the required parameter 'start_month' when calling UsageMeteringAPI.get_cost_by_org"
      end
      # resource path
      local_var_path = '/api/v2/usage/cost_by_org'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_month'] = start_month
      query_params[:'end_month'] = opts[:'end_month'] if !opts[:'end_month'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CostByOrgResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_cost_by_org,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_cost_by_org\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get estimated cost across your account.
    #
    # @see #get_estimated_cost_by_org_with_http_info
    def get_estimated_cost_by_org(opts = {})
      data, _status_code, _headers = get_estimated_cost_by_org_with_http_info(opts)
      data
    end

    # Get estimated cost across your account.
    #
    # Get estimated cost across multi-org and single root-org accounts.
    # Estimated cost data is only available for the current month and previous month
    # and is delayed by up to 72 hours from when it was incurred.
    # To access historical costs prior to this, use the `/historical_cost` endpoint.
    #
    # @param opts [Hash] the optional parameters
    # @option opts [String] :view String to specify whether cost is broken down at a parent-org level or at the sub-org level. Available views are `summary` and `sub-org`. Defaults to `summary`.
    # @option opts [Time] :start_month Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost beginning this month. Either start_month or start_date should be specified, but not both. (start_month cannot go beyond two months in the past)
    # @option opts [Time] :end_month Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost ending this month.
    # @option opts [Time] :start_date Datetime in ISO-8601 format, UTC, precise to day: `[YYYY-MM-DD]` for cost beginning this day. Either start_month or start_date should be specified, but not both. (start_date cannot go beyond two months in the past)
    # @option opts [Time] :end_date Datetime in ISO-8601 format, UTC, precise to day: `[YYYY-MM-DD]` for cost ending this day.
    # @return [Array<(CostByOrgResponse, Integer, Hash)>] CostByOrgResponse data, response status code and response headers
    def get_estimated_cost_by_org_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_estimated_cost_by_org ...'
      end
      # resource path
      local_var_path = '/api/v2/usage/estimated_cost'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'view'] = opts[:'view'] if !opts[:'view'].nil?
      query_params[:'start_month'] = opts[:'start_month'] if !opts[:'start_month'].nil?
      query_params[:'end_month'] = opts[:'end_month'] if !opts[:'end_month'].nil?
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CostByOrgResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_estimated_cost_by_org,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_estimated_cost_by_org\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get historical cost across your account.
    #
    # @see #get_historical_cost_by_org_with_http_info
    def get_historical_cost_by_org(start_month, opts = {})
      data, _status_code, _headers = get_historical_cost_by_org_with_http_info(start_month, opts)
      data
    end

    # Get historical cost across your account.
    #
    # Get historical cost across multi-org and single root-org accounts.
    # Cost data for a given month becomes available no later than the 16th of the following month.
    #
    # @param start_month [Time] Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost beginning this month.
    # @param opts [Hash] the optional parameters
    # @option opts [String] :view String to specify whether cost is broken down at a parent-org level or at the sub-org level. Available views are `summary` and `sub-org`.  Defaults to `summary`.
    # @option opts [Time] :end_month Datetime in ISO-8601 format, UTC, precise to month: `[YYYY-MM]` for cost ending this month.
    # @return [Array<(CostByOrgResponse, Integer, Hash)>] CostByOrgResponse data, response status code and response headers
    def get_historical_cost_by_org_with_http_info(start_month, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_historical_cost_by_org ...'
      end
      # verify the required parameter 'start_month' is set
      if @api_client.config.client_side_validation && start_month.nil?
        fail ArgumentError, "Missing the required parameter 'start_month' when calling UsageMeteringAPI.get_historical_cost_by_org"
      end
      # resource path
      local_var_path = '/api/v2/usage/historical_cost'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_month'] = start_month
      query_params[:'view'] = opts[:'view'] if !opts[:'view'].nil?
      query_params[:'end_month'] = opts[:'end_month'] if !opts[:'end_month'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'CostByOrgResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_historical_cost_by_org,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_historical_cost_by_org\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get hourly usage by product family.
    #
    # @see #get_hourly_usage_with_http_info
    def get_hourly_usage(filter_timestamp_start, filter_product_families, opts = {})
      data, _status_code, _headers = get_hourly_usage_with_http_info(filter_timestamp_start, filter_product_families, opts)
      data
    end

    # Get hourly usage by product family.
    #
    # Get hourly usage by product family.
    #
    # @param filter_timestamp_start [Time] Datetime in ISO-8601 format, UTC, precise to hour: [YYYY-MM-DDThh] for usage beginning at this hour.
    # @param filter_product_families [String] Comma separated list of product families to retrieve. Available families are `all`, `analyzed_logs`, `application_security`, `audit_logs`, `audit_trail`, `serverless`, `ci_app`, `cloud_cost_management`, `cspm`, `custom_events`, `cws`, `dbm`, `fargate`, `infra_hosts`, `incident_management`, `indexed_logs`, `indexed_spans`, `ingested_spans`, `iot`, `lambda_traced_invocations`, `logs`, `network_flows`, `network_hosts`, `observability_pipelines`, `online_archive`, `profiling`, `rum`, `rum_browser_sessions`, `rum_mobile_sessions`, `sds`, `snmp`, `synthetics_api`, `synthetics_browser`, `synthetics_parallel_testing`, and `timeseries`.
    # @param opts [Hash] the optional parameters
    # @option opts [Time] :filter_timestamp_end Datetime in ISO-8601 format, UTC, precise to hour: [YYYY-MM-DDThh] for usage ending **before** this hour.
    # @option opts [Boolean] :filter_include_descendants Include child org usage in the response. Defaults to false.
    # @option opts [String] :filter_versions Comma separated list of product family versions to use in the format `product_family:version`. For example, `infra_hosts:1.0.0`. If this parameter is not used, the API will use the latest version of each requested product family. Currently all families have one version `1.0.0`.
    # @option opts [Integer] :page_limit Maximum number of results to return (between 1 and 500) - defaults to 500 if limit not specified.
    # @option opts [String] :page_next_record_id List following results with a next_record_id provided in the previous query.
    # @return [Array<(HourlyUsageResponse, Integer, Hash)>] HourlyUsageResponse data, response status code and response headers
    def get_hourly_usage_with_http_info(filter_timestamp_start, filter_product_families, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_hourly_usage ...'
      end
      # verify the required parameter 'filter_timestamp_start' is set
      if @api_client.config.client_side_validation && filter_timestamp_start.nil?
        fail ArgumentError, "Missing the required parameter 'filter_timestamp_start' when calling UsageMeteringAPI.get_hourly_usage"
      end
      # verify the required parameter 'filter_product_families' is set
      if @api_client.config.client_side_validation && filter_product_families.nil?
        fail ArgumentError, "Missing the required parameter 'filter_product_families' when calling UsageMeteringAPI.get_hourly_usage"
      end
      if @api_client.config.client_side_validation && !opts[:'page_limit'].nil? && opts[:'page_limit'] > 500
        fail ArgumentError, 'invalid value for "opts[:"page_limit"]" when calling UsageMeteringAPI.get_hourly_usage, must be smaller than or equal to 500.'
      end
      if @api_client.config.client_side_validation && !opts[:'page_limit'].nil? && opts[:'page_limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_limit"]" when calling UsageMeteringAPI.get_hourly_usage, must be greater than or equal to 1.'
      end
      # resource path
      local_var_path = '/api/v2/usage/hourly_usage'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'filter[timestamp][start]'] = filter_timestamp_start
      query_params[:'filter[product_families]'] = filter_product_families
      query_params[:'filter[timestamp][end]'] = opts[:'filter_timestamp_end'] if !opts[:'filter_timestamp_end'].nil?
      query_params[:'filter[include_descendants]'] = opts[:'filter_include_descendants'] if !opts[:'filter_include_descendants'].nil?
      query_params[:'filter[versions]'] = opts[:'filter_versions'] if !opts[:'filter_versions'].nil?
      query_params[:'page[limit]'] = opts[:'page_limit'] if !opts[:'page_limit'].nil?
      query_params[:'page[next_record_id]'] = opts[:'page_next_record_id'] if !opts[:'page_next_record_id'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'HourlyUsageResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_hourly_usage,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_hourly_usage\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get hourly usage for application security.
    #
    # @see #get_usage_application_security_monitoring_with_http_info
    def get_usage_application_security_monitoring(start_hr, opts = {})
      data, _status_code, _headers = get_usage_application_security_monitoring_with_http_info(start_hr, opts)
      data
    end

    # Get hourly usage for application security.
    #
    # Get hourly usage for application security .
    # **Note:** hourly usage data for all products is now available in the [Get hourly usage by product family API](https://docs.datadoghq.com/api/latest/usage-metering/#get-hourly-usage-by-product-family)
    #
    # @param start_hr [Time] Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage beginning at this hour.
    # @param opts [Hash] the optional parameters
    # @option opts [Time] :end_hr Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage ending **before** this hour.
    # @return [Array<(UsageApplicationSecurityMonitoringResponse, Integer, Hash)>] UsageApplicationSecurityMonitoringResponse data, response status code and response headers
    def get_usage_application_security_monitoring_with_http_info(start_hr, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_usage_application_security_monitoring ...'
      end
      # verify the required parameter 'start_hr' is set
      if @api_client.config.client_side_validation && start_hr.nil?
        fail ArgumentError, "Missing the required parameter 'start_hr' when calling UsageMeteringAPI.get_usage_application_security_monitoring"
      end
      # resource path
      local_var_path = '/api/v2/usage/application_security'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_hr'] = start_hr
      query_params[:'end_hr'] = opts[:'end_hr'] if !opts[:'end_hr'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UsageApplicationSecurityMonitoringResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_usage_application_security_monitoring,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_usage_application_security_monitoring\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get hourly usage for lambda traced invocations.
    #
    # @see #get_usage_lambda_traced_invocations_with_http_info
    def get_usage_lambda_traced_invocations(start_hr, opts = {})
      data, _status_code, _headers = get_usage_lambda_traced_invocations_with_http_info(start_hr, opts)
      data
    end

    # Get hourly usage for lambda traced invocations.
    #
    # Get hourly usage for lambda traced invocations.
    # **Note:** hourly usage data for all products is now available in the [Get hourly usage by product family API](https://docs.datadoghq.com/api/latest/usage-metering/#get-hourly-usage-by-product-family)
    #
    # @param start_hr [Time] Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage beginning at this hour.
    # @param opts [Hash] the optional parameters
    # @option opts [Time] :end_hr Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage ending **before** this hour.
    # @return [Array<(UsageLambdaTracedInvocationsResponse, Integer, Hash)>] UsageLambdaTracedInvocationsResponse data, response status code and response headers
    def get_usage_lambda_traced_invocations_with_http_info(start_hr, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_usage_lambda_traced_invocations ...'
      end
      # verify the required parameter 'start_hr' is set
      if @api_client.config.client_side_validation && start_hr.nil?
        fail ArgumentError, "Missing the required parameter 'start_hr' when calling UsageMeteringAPI.get_usage_lambda_traced_invocations"
      end
      # resource path
      local_var_path = '/api/v2/usage/lambda_traced_invocations'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_hr'] = start_hr
      query_params[:'end_hr'] = opts[:'end_hr'] if !opts[:'end_hr'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UsageLambdaTracedInvocationsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_usage_lambda_traced_invocations,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_usage_lambda_traced_invocations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get hourly usage for observability pipelines.
    #
    # @see #get_usage_observability_pipelines_with_http_info
    def get_usage_observability_pipelines(start_hr, opts = {})
      data, _status_code, _headers = get_usage_observability_pipelines_with_http_info(start_hr, opts)
      data
    end

    # Get hourly usage for observability pipelines.
    #
    # Get hourly usage for observability pipelines.
    # **Note:** hourly usage data for all products is now available in the [Get hourly usage by product family API](https://docs.datadoghq.com/api/latest/usage-metering/#get-hourly-usage-by-product-family)
    #
    # @param start_hr [Time] Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage beginning at this hour.
    # @param opts [Hash] the optional parameters
    # @option opts [Time] :end_hr Datetime in ISO-8601 format, UTC, precise to hour: `[YYYY-MM-DDThh]` for usage ending **before** this hour.
    # @return [Array<(UsageObservabilityPipelinesResponse, Integer, Hash)>] UsageObservabilityPipelinesResponse data, response status code and response headers
    def get_usage_observability_pipelines_with_http_info(start_hr, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: UsageMeteringAPI.get_usage_observability_pipelines ...'
      end
      # verify the required parameter 'start_hr' is set
      if @api_client.config.client_side_validation && start_hr.nil?
        fail ArgumentError, "Missing the required parameter 'start_hr' when calling UsageMeteringAPI.get_usage_observability_pipelines"
      end
      # resource path
      local_var_path = '/api/v2/usage/observability_pipelines'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_hr'] = start_hr
      query_params[:'end_hr'] = opts[:'end_hr'] if !opts[:'end_hr'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;datetime-format=rfc3339'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UsageObservabilityPipelinesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_usage_observability_pipelines,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UsageMeteringAPI#get_usage_observability_pipelines\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end