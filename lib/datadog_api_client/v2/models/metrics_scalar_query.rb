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

require 'date'
require 'time'

module DatadogAPIClient::V2
  # An individual scalar metrics query.
  class MetricsScalarQuery
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The type of aggregation that can be performed on metrics queries.
    attr_reader :aggregator

    # A data source that is powered by the Metrics platform.
    attr_reader :data_source

    # The variable name for use in formulas.
    attr_accessor :name

    # A classic metrics query string.
    attr_reader :query

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'aggregator' => :'aggregator',
        :'data_source' => :'data_source',
        :'name' => :'name',
        :'query' => :'query'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'aggregator' => :'MetricsAggregator',
        :'data_source' => :'MetricsDataSource',
        :'name' => :'String',
        :'query' => :'S