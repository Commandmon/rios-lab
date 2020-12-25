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
  class RolesAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Grant permission to a role.
    #
    # @see #add_permission_to_role_with_http_info
    def add_permission_to_role(role_id, body, opts = {})
      data, _status_code, _headers = add_permission_to_role_with_http_info(role_id, body, opts)
      data
    end

    # Grant permission to a role.
    #
    # Adds a permission to a role.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param body [RelationshipToPermission] 
    # @param opts [Hash] the optional parameters
    # @return [Array<(PermissionsResponse, Integer, Hash)>] PermissionsResponse data, response status code and response headers
    def add_permission_to_role_with_http_info(role_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.add_permission_to_role ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.add_permission_to_role"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling RolesAPI.add_permission_to_role"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}/permissions'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'PermissionsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :add_permission_to_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#add_permission_to_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add a user to a role.
    #
    # @see #add_user_to_role_with_http_info
    def add_user_to_role(role_id, body, opts = {})
      data, _status_code, _headers = add_user_to_role_with_http_info(role_id, body, opts)
      data
    end

    # Add a user to a role.
    #
    # Adds a user to a role.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param body [RelationshipToUser] 
    # @param opts [Hash] the optional parameters
    # @return [Array<(UsersResponse, Integer, Hash)>] UsersResponse data, response status code and response headers
    def add_user_to_role_with_http_info(role_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.add_user_to_role ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.add_user_to_role"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling RolesAPI.add_user_to_role"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}/users'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'UsersResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :add_user_to_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#add_user_to_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a new role by cloning an existing role.
    #
    # @see #clone_role_with_http_info
    def clone_role(role_id, body, opts = {})
      data, _status_code, _headers = clone_role_with_http_info(role_id, body, opts)
      data
    end

    # Create a new role by cloning an existing role.
    #
    # Clone an existing role
    #
    # @param role_id [String] The unique identifier of the role.
    # @param body [RoleCloneRequest] 
    # @param opts [Hash] the optional parameters
    # @return [Array<(RoleResponse, Integer, Hash)>] RoleResponse data, response status code and response headers
    def clone_role_with_http_info(role_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.clone_role ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.clone_role"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling RolesAPI.clone_role"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}/clone'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'RoleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :clone_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#clone_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create role.
    #
    # @see #create_role_with_http_info
    def create_role(body, opts = {})
      data, _status_code, _headers = create_role_with_http_info(body, opts)
      data
    end

    # Create role.
    #
    # Create a new role for your organization.
    #
    # @param body [RoleCreateRequest] 
    # @param opts [Hash] the optional parameters
    # @return [Array<(RoleCreateResponse, Integer, Hash)>] RoleCreateResponse data, response status code and response headers
    def create_role_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.create_role ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling RolesAPI.create_role"
      end
      # resource path
      local_var_path = '/api/v2/roles'

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
      return_type = opts[:debug_return_type] || 'RoleCreateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :create_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#create_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete role.
    #
    # @see #delete_role_with_http_info
    def delete_role(role_id, opts = {})
      delete_role_with_http_info(role_id, opts)
      nil
    end

    # Delete role.
    #
    # Disables a role.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_role_with_http_info(role_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.delete_role ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.delete_role"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :delete_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#delete_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a role.
    #
    # @see #get_role_with_http_info
    def get_role(role_id, opts = {})
      data, _status_code, _headers = get_role_with_http_info(role_id, opts)
      data
    end

    # Get a role.
    #
    # Get a role in the organization specified by the role’s `role_id`.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param opts [Hash] the optional parameters
    # @return [Array<(RoleResponse, Integer, Hash)>] RoleResponse data, response status code and response headers
    def get_role_with_http_info(role_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.get_role ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.get_role"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'RoleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :get_role,
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
        @api_client.config.logger.debug "API called: RolesAPI#get_role\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List permissions.
    #
    # @see #list_permissions_with_http_info
    def list_permissions(opts = {})
      data, _status_code, _headers = list_permissions_with_http_info(opts)
      data
    end

    # List permissions.
    #
    # Returns a list of all permissions, including name, description, and ID.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(PermissionsResponse, Integer, Hash)>] PermissionsResponse data, response status code and response headers
    def list_permissions_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.list_permissions ...'
      end
      # resource path
      local_var_path = '/api/v2/permissions'

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
      return_type = opts[:debug_return_type] || 'PermissionsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :list_permissions,
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
        @api_client.config.logger.debug "API called: RolesAPI#list_permissions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List permissions for a role.
    #
    # @see #list_role_permissions_with_http_info
    def list_role_permissions(role_id, opts = {})
      data, _status_code, _headers = list_role_permissions_with_http_info(role_id, opts)
      data
    end

    # List permissions for a role.
    #
    # Returns a list of all permissions for a single role.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param opts [Hash] the optional parameters
    # @return [Array<(PermissionsResponse, Integer, Hash)>] PermissionsResponse data, response status code and response headers
    def list_role_permissions_with_http_info(role_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.list_role_permissions ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.list_role_permissions"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}/permissions'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'PermissionsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :list_role_permissions,
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
        @api_client.config.logger.debug "API called: RolesAPI#list_role_permissions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List roles.
    #
    # @see #list_roles_with_http_info
    def list_roles(opts = {})
      data, _status_code, _headers = list_roles_with_http_info(opts)
      data
    end

    # List roles.
    #
    # Returns all roles, including their names and their unique identifiers.
    #
    # @param opts [Hash] the optional parameters
    # @option opts [Integer] :page_size Size for a given page. The maximum allowed value is 5000.
    # @option opts [Integer] :page_number Specific page number to return.
    # @option opts [RolesSort] :sort Sort roles depending on the given field. Sort order is **ascending** by default. Sort order is **descending** if the field is prefixed by a negative sign, for example: `sort=-name`.
    # @option opts [String] :filter Filter all roles by the given string.
    # @return [Array<(RolesResponse, Integer, Hash)>] RolesResponse data, response status code and response headers
    def list_roles_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.list_roles ...'
      end
      allowable_values = ['name', '-name', 'modified_at', '-modified_at', 'user_count', '-user_count']
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/v2/roles'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'page[number]'] = opts[:'page_number'] if !opts[:'page_number'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'RolesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :list_roles,
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
        @api_client.config.logger.debug "API called: RolesAPI#list_roles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all users of a role.
    #
    # @see #list_role_users_with_http_info
    def list_role_users(role_id, opts = {})
      data, _status_code, _headers = list_role_users_with_http_info(role_id, opts)
      data
    end

    # Get all users of a role.
    #
    # Gets all users of a role.
    #
    # @param role_id [String] The unique identifier of the role.
    # @param opts [Hash] the optional parameters
    # @option opts [Integer] :page_size Size for a given page. The maximum allowed value is 5000.
    # @option opts [Integer] :page_number Specific page number to return.
    # @option opts [String] :sort User attribute to order results by. Sort order is **ascending** by default. Sort order is **descending** if the field is prefixed by a negative sign, for example `sort=-name`. Options: `name`, `email`, `status`.
    # @option opts [String] :filter Filter all users by the given string. Defaults to no filtering.
    # @return [Array<(UsersResponse, Integer, Hash)>] UsersResponse data, response status code and response headers
    def list_role_users_with_http_info(role_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RolesAPI.list_role_users ...'
      end
      # verify the required parameter 'role_id' is set
      if @api_client.config.client_side_validation && role_id.nil?
        fail ArgumentError, "Missing the required parameter 'role_id' when calling RolesAPI.list_role_users"
      end
      # resource path
      local_var_path = '/api/v2/roles/{role_id}/users'.sub('{role_id}', CGI.escape(role_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'page[number]'] = opts[:'page_number'] if !opts[:'page_number'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'UsersResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth, :AuthZ]

      new_options = opts.merge(
        :operation => :list_role_users,
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
        @api_client.config.logger.debug "API called: RolesAPI#list_role_users\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Revoke permis