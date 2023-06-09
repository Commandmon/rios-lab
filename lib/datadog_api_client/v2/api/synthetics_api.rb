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
  class SyntheticsAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Get the on-demand concurrency cap.
    #
    # @see #get_on_demand_concurrency_cap_with_http_info
    def get_on_demand_concurrency_cap(opts = {})
      data, _status_code, _headers = get_on_demand_concurrency_cap_with_http_info(opts)
      data
    end

    # Get the on-demand concurrency cap.
    #
    # Get the on-demand concurrency cap.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(OnDemandConcurrencyCapResponse, Integer, Hash)>] OnDemandConcurrencyCapResponse data, response status code and response headers
    def get_on_demand_concurrency_cap_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SyntheticsAPI.get_on_demand_concurrency_cap ...'
      end
      # resource path
      local_var_path = '/api/v2/synthetics/settings/on_demand_concurrency_cap'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'OnDemandConcurrencyCapResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :get_on_demand_concurrency_cap,
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
        @api_client.config.logger.debug "API called: SyntheticsAPI#get_on_demand_concurrency_cap\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Save new value for on-demand concurrency cap.
    #
    # @see #set_on_demand_concurrency_cap_with_http_info
    def set_on_demand_concurrency_cap(body, opts = {})
      data, _status_code, _headers = set_on_demand_concurrency_cap_with_http_info(body, opts)
      data
    end

    # Save new value for on-demand concurrency cap.
    #
    # Save new value for on-demand concurrency cap.
    #
    # @param body [OnDemandConcurrencyCapAttributes] .
    # @param opts [Hash] the optional parameters
    # @return [Array<(OnDemandConcurrencyCapResponse, Integer, Hash)>] OnDemandConcurrencyCapResponse data, response status code and response headers
    def set_on_demand_concurrency_cap_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SyntheticsAPI.set_on_demand_concurrency_cap ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SyntheticsAPI.set_on_demand_concurrency_cap"
      end
      # resource path
      local_var_path = '/api/v2/synthetics/settings/on_demand_concurrency_cap'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'OnDemandConcurrencyCapResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :set_on_demand_concurrency_cap,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Post, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SyntheticsAPI#set_on_demand_concurrency_cap\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
