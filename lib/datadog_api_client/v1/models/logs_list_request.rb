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
  # Object to send with the request to retrieve a list of logs from your Organization.
  class LogsListRequest
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The log index on which the request is performed. For multi-index organizations,
    # the default is all live indexes. Historical indexes of rehydrated logs must be specified.
    attr_accessor :index

    # Number of logs return in the response.
    attr_reader :limit

    # The search query - following the log search syntax.
    attr_accessor :query

    # Time-ascending `asc` or time-descending `desc` results.
    attr_accessor :sort

    # Hash identifier of the first log to return in the list, available in a log `id` attribute.
    # This parameter is used for the pagination feature.
    #
    # **Note**: This parameter is ignored if the corresponding log
    # is out of the scope of the specified time window.
    attr_accessor :start_at

    # Timeframe to retrieve the log from.
    attr_reader :time

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'index' => :'index',
        :'limit' => :'limit',
        :'query' => :'query',
        :'sort' => :'sort',
        :'start_at' => :'startAt',
        :'time' => :'time'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'index' => :'String',
        :'limit' => :'Integer',
        :'query' => :'String',
        :'sort' => :'LogsSort',
        :'start_at' => :'String',
        :'time' => :'LogsListRequestTime'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::LogsListRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::LogsListRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect