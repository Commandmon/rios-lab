
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
  class MonitorsAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Create a monitor configuration policy.
    #
    # @see #create_monitor_config_policy_with_http_info
    def create_monitor_config_policy(body, opts = {})
      data, _status_code, _headers = create_monitor_config_policy_with_http_info(body, opts)
      data
    end

    # Create a monitor configuration policy.
    #
    # Create a monitor configuration policy.
    #
    # @param body [MonitorConfigPolicyCreateRequest] Create a monitor configuration policy request body.
    # @param opts [Hash] the optional parameters
    # @return [Array<(MonitorConfigPolicyResponse, Integer, Hash)>] MonitorConfigPolicyResponse data, response status code and response headers
    def create_monitor_config_policy_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsAPI.create_monitor_config_policy ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MonitorsAPI.create_monitor_config_policy"
      end
      # resource path
      local_var_path = '/api/v2/monitor/policy'

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
      return_type = opts[:debug_return_type] || 'MonitorConfigPolicyResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :create_monitor_config_policy,
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
        @api_client.config.logger.debug "API called: MonitorsAPI#create_monitor_config_policy\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a monitor configuration policy.
    #
    # @see #delete_monitor_config_policy_with_http_info
    def delete_monitor_config_policy(policy_id, opts = {})
      delete_monitor_config_policy_with_http_info(policy_id, opts)
      nil
    end

    # Delete a monitor configuration policy.
    #
    # Delete a monitor configuration policy.
    #
    # @param policy_id [String] ID of the monitor configuration policy.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_monitor_config_policy_with_http_info(policy_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsAPI.delete_monitor_config_policy ...'
      end
      # verify the required parameter 'policy_id' is set
      if @api_client.config.client_side_validation && policy_id.nil?
        fail ArgumentError, "Missing the required parameter 'policy_id' when calling MonitorsAPI.delete_monitor_config_policy"
      end
      # resource path
      local_var_path = '/api/v2/monitor/policy/{policy_id}'.sub('{policy_id}', CGI.escape(policy_id.to_s).gsub('%2F', '/'))

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
        :operation => :delete_monitor_config_policy,
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
        @api_client.config.logger.debug "API called: MonitorsAPI#delete_monitor_config_policy\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a monitor configuration policy.
    #
    # @see #get_monitor_config_policy_with_http_info
    def get_monitor_config_policy(policy_id, opts = {})
      data, _status_code, _headers = get_monitor_config_policy_with_http_info(policy_id, opts)
      data
    end

    # Get a monitor configuration policy.
    #
    # Get a monitor configuration policy by `policy_id`.
    #
    # @param policy_id [String] ID of the monitor configuration policy.
    # @param opts [Hash] the optional parameters
    # @return [Array<(MonitorConfigPolicyResponse, Integer, Hash)>] MonitorConfigPolicyResponse data, response status code and response headers
    def get_monitor_config_policy_with_http_info(policy_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsAPI.get_monitor_config_policy ...'
      end
      # verify the required parameter 'policy_id' is set
      if @api_client.config.client_side_validation && policy_id.nil?
        fail ArgumentError, "Missing the required parameter 'policy_id' when calling MonitorsAPI.get_monitor_config_policy"
      end
      # resource path
      local_var_path = '/api/v2/monitor/policy/{policy_id}'.sub('{policy_id}', CGI.escape(policy_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'MonitorConfigPolicyResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_monitor_config_policy,
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
        @api_client.config.logger.debug "API called: MonitorsAPI#get_monitor_config_policy\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all monitor configuration policies.
    #
    # @see #list_monitor_config_policies_with_http_info
    def list_monitor_config_policies(opts = {})
      data, _status_code, _headers = list_monitor_config_policies_with_http_info(opts)
      data
    end

    # Get all monitor configuration policies.
    #
    # Get all monitor configuration policies.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(MonitorConfigPolicyListResponse, Integer, Hash)>] MonitorConfigPolicyListResponse data, response status code and response headers
    def list_monitor_config_policies_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsAPI.list_monitor_config_policies ...'
      end
      # resource path
      local_var_path = '/api/v2/monitor/policy'

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
      return_type = opts[:debug_return_type] || 'MonitorConfigPolicyListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :list_monitor_config_policies,
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
        @api_client.config.logger.debug "API called: MonitorsAPI#list_monitor_config_policies\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Edit a monitor configuration policy.
    #
    # @see #update_monitor_config_policy_with_http_info
    def update_monitor_config_policy(policy_id, body, opts = {})
      data, _status_code, _headers = update_monitor_config_policy_with_http_info(policy_id, body, opts)
      data
    end

    # Edit a monitor configuration policy.
    #
    # Edit a monitor configuration policy.
    #
    # @param policy_id [String] ID of the monitor configuration policy.
    # @param body [MonitorConfigPolicyEditRequest] Description of the update.
    # @param opts [Hash] the optional parameters
    # @return [Array<(MonitorConfigPolicyResponse, Integer, Hash)>] MonitorConfigPolicyResponse data, response status code and response headers
    def update_monitor_config_policy_with_http_info(policy_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MonitorsAPI.update_monitor_config_policy ...'
      end
      # verify the required parameter 'policy_id' is set
      if @api_client.config.client_side_validation && policy_id.nil?
        fail ArgumentError, "Missing the required parameter 'policy_id' when calling MonitorsAPI.update_monitor_config_policy"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling MonitorsAPI.update_monitor_config_policy"
      end
      # resource path
      local_var_path = '/api/v2/monitor/policy/{policy_id}'.sub('{policy_id}', CGI.escape(policy_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'MonitorConfigPolicyResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :update_monitor_config_policy,
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
        @api_client.config.logger.debug "API called: MonitorsAPI#update_monitor_config_policy\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end