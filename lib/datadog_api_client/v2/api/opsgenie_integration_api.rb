
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
  class OpsgenieIntegrationAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Create a new service object.
    #
    # @see #create_opsgenie_service_with_http_info
    def create_opsgenie_service(body, opts = {})
      data, _status_code, _headers = create_opsgenie_service_with_http_info(body, opts)
      data
    end

    # Create a new service object.
    #
    # Create a new service object in the Opsgenie integration.
    #
    # @param body [OpsgenieServiceCreateRequest] Opsgenie service payload
    # @param opts [Hash] the optional parameters
    # @return [Array<(OpsgenieServiceResponse, Integer, Hash)>] OpsgenieServiceResponse data, response status code and response headers
    def create_opsgenie_service_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OpsgenieIntegrationAPI.create_opsgenie_service ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling OpsgenieIntegrationAPI.create_opsgenie_service"
      end
      # resource path
      local_var_path = '/api/v2/integration/opsgenie/services'

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
      return_type = opts[:debug_return_type] || 'OpsgenieServiceResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :create_opsgenie_service,
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
        @api_client.config.logger.debug "API called: OpsgenieIntegrationAPI#create_opsgenie_service\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a single service object.
    #
    # @see #delete_opsgenie_service_with_http_info
    def delete_opsgenie_service(integration_service_id, opts = {})
      delete_opsgenie_service_with_http_info(integration_service_id, opts)
      nil
    end

    # Delete a single service object.
    #
    # Delete a single service object in the Datadog Opsgenie integration.
    #
    # @param integration_service_id [String] The UUID of the service.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_opsgenie_service_with_http_info(integration_service_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OpsgenieIntegrationAPI.delete_opsgenie_service ...'
      end
      # verify the required parameter 'integration_service_id' is set
      if @api_client.config.client_side_validation && integration_service_id.nil?
        fail ArgumentError, "Missing the required parameter 'integration_service_id' when calling OpsgenieIntegrationAPI.delete_opsgenie_service"
      end
      # resource path
      local_var_path = '/api/v2/integration/opsgenie/services/{integration_service_id}'.sub('{integration_service_id}', CGI.escape(integration_service_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :delete_opsgenie_service,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Delete, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OpsgenieIntegrationAPI#delete_opsgenie_service\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a single service object.
    #
    # @see #get_opsgenie_service_with_http_info
    def get_opsgenie_service(integration_service_id, opts = {})
      data, _status_code, _headers = get_opsgenie_service_with_http_info(integration_service_id, opts)
      data
    end

    # Get a single service object.
    #
    # Get a single service from the Datadog Opsgenie integration.
    #
    # @param integration_service_id [String] The UUID of the service.
    # @param opts [Hash] the optional parameters
    # @return [Array<(OpsgenieServiceResponse, Integer, Hash)>] OpsgenieServiceResponse data, response status code and response headers
    def get_opsgenie_service_with_http_info(integration_service_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OpsgenieIntegrationAPI.get_opsgenie_service ...'
      end
      # verify the required parameter 'integration_service_id' is set
      if @api_client.config.client_side_validation && integration_service_id.nil?
        fail ArgumentError, "Missing the required parameter 'integration_service_id' when calling OpsgenieIntegrationAPI.get_opsgenie_service"
      end
      # resource path
      local_var_path = '/api/v2/integration/opsgenie/services/{integration_service_id}'.sub('{integration_service_id}', CGI.escape(integration_service_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'OpsgenieServiceResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :get_opsgenie_service,
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
        @api_client.config.logger.debug "API called: OpsgenieIntegrationAPI#get_opsgenie_service\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all service objects.
    #
    # @see #list_opsgenie_services_with_http_info
    def list_opsgenie_services(opts = {})
      data, _status_code, _headers = list_opsgenie_services_with_http_info(opts)
      data
    end

    # Get all service objects.
    #
    # Get a list of all services from the Datadog Opsgenie integration.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(OpsgenieServicesResponse, Integer, Hash)>] OpsgenieServicesResponse data, response status code and response headers
    def list_opsgenie_services_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OpsgenieIntegrationAPI.list_opsgenie_services ...'
      end
      # resource path
      local_var_path = '/api/v2/integration/opsgenie/services'

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
      return_type = opts[:debug_return_type] || 'OpsgenieServicesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :list_opsgenie_services,
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
        @api_client.config.logger.debug "API called: OpsgenieIntegrationAPI#list_opsgenie_services\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update a single service object.
    #
    # @see #update_opsgenie_service_with_http_info
    def update_opsgenie_service(integration_service_id, body, opts = {})
      data, _status_code, _headers = update_opsgenie_service_with_http_info(integration_service_id, body, opts)
      data
    end

    # Update a single service object.
    #
    # Update a single service object in the Datadog Opsgenie integration.
    #
    # @param integration_service_id [String] The UUID of the service.
    # @param body [OpsgenieServiceUpdateRequest] Opsgenie service payload.
    # @param opts [Hash] the optional parameters
    # @return [Array<(OpsgenieServiceResponse, Integer, Hash)>] OpsgenieServiceResponse data, response status code and response headers
    def update_opsgenie_service_with_http_info(integration_service_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OpsgenieIntegrationAPI.update_opsgenie_service ...'
      end
      # verify the required parameter 'integration_service_id' is set
      if @api_client.config.client_side_validation && integration_service_id.nil?
        fail ArgumentError, "Missing the required parameter 'integration_service_id' when calling OpsgenieIntegrationAPI.update_opsgenie_service"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling OpsgenieIntegrationAPI.update_opsgenie_service"
      end
      # resource path
      local_var_path = '/api/v2/integration/opsgenie/services/{integration_service_id}'.sub('{integration_service_id}', CGI.escape(integration_service_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'OpsgenieServiceResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :update_opsgenie_service,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Patch, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OpsgenieIntegrationAPI#update_opsgenie_service\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end