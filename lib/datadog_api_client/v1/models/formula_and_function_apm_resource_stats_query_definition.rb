=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://github.com/DataDog/datadog-api-client-ruby/tree/master/.generator

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'date'
require 'time'

module DatadogAPIClient::V1
  # APM resource stats query using formulas and functions.
  class FormulaAndFunctionApmResourceStatsQueryDefinition
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Data source for APM resource stats queries.
    attr_reader :data_source

    # APM environment.
    attr_reader :env

    # Array of fields to group results by.
    attr_accessor :group_by

    # Name of this query to use in formulas.
    attr_reader :name

    # Name of operation on service.
    attr_accessor :operation_name

    # Name of the second primary tag used within APM. Required when `primary_tag_value` is specified. See https://docs.datadoghq.com/tracing/guide/setting_primary_tags_to_scope/#add-a-second-primary-tag-in-datadog
    attr_accessor :primary_tag_name

    # Value of the second primary tag by which to filter APM data. `primary_tag_name` must also be specified.
    attr_accessor :primary_tag_value

    # APM resource name.
    attr_accessor :resource_name

    # APM service name.
    attr_reader :service

    # APM resource stat name.
    attr_reader :stat

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'data_source' => :'data_source',
        :'env' => :'env',
        :'group_by' => :'group_by',
        :'name' => :'name',
        :'operation_name' => :'operation_name',
        :'primary_tag_name' => :'primary_tag_name',
        :'primary_tag_value' => :'primary_tag_value',
        :'resource_name' => :'resource_name',
        :'service