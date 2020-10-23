
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
  # A single monitor group search result.
  class MonitorGroupSearchResult
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The name of the group.
    attr_accessor :group

    # The list of tags of the monitor group.
    attr_accessor :group_tags

    # Latest timestamp the monitor group was in NO_DATA state.
    attr_accessor :last_nodata_ts

    # Latest timestamp the monitor group triggered.
    attr_accessor :last_triggered_ts

    # The ID of the monitor.
    attr_accessor :monitor_id

    # The name of the monitor.
    attr_accessor :monitor_name

    # The different states your monitor can be in.
    attr_accessor :status

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'group' => :'group',
        :'group_tags' => :'group_tags',
        :'last_nodata_ts' => :'last_nodata_ts',
        :'last_triggered_ts' => :'last_triggered_ts',
        :'monitor_id' => :'monitor_id',
        :'monitor_name' => :'monitor_name',
        :'status' => :'status'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'group' => :'String',
        :'group_tags' => :'Array<String>',
        :'last_nodata_ts' => :'Integer',
        :'last_triggered_ts' => :'Integer',
        :'monitor_id' => :'Integer',
        :'monitor_name' => :'String',
        :'status' => :'MonitorOverallStates'
      }
    end

    # List of attributes with nullable: true
    # @!visibility private
    def self.openapi_nullable
      Set.new([
        :'last_triggered_ts',
      ])
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::MonitorGroupSearchResult` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::MonitorGroupSearchResult`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'group')
        self.group = attributes[:'group']
      end

      if attributes.key?(:'group_tags')
        if (value = attributes[:'group_tags']).is_a?(Array)
          self.group_tags = value
        end
      end

      if attributes.key?(:'last_nodata_ts')
        self.last_nodata_ts = attributes[:'last_nodata_ts']
      end

      if attributes.key?(:'last_triggered_ts')
        self.last_triggered_ts = attributes[:'last_triggered_ts']
      end

      if attributes.key?(:'monitor_id')
        self.monitor_id = attributes[:'monitor_id']
      end

      if attributes.key?(:'monitor_name')
        self.monitor_name = attributes[:'monitor_name']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          group == o.group &&
          group_tags == o.group_tags &&
          last_nodata_ts == o.last_nodata_ts &&
          last_triggered_ts == o.last_triggered_ts &&
          monitor_id == o.monitor_id &&
          monitor_name == o.monitor_name &&
          status == o.status
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [group, group_tags, last_nodata_ts, last_triggered_ts, monitor_id, monitor_name, status].hash
    end
  end
end