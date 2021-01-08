
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
  # Sensitive Data Scanner usage for a given organization for a given hour.
  class UsageSDSHour
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The total number of bytes scanned of APM usage across all usage types by the Sensitive Data Scanner from the start of the given hour’s month until the given hour.
    attr_accessor :apm_scanned_bytes

    # The total number of bytes scanned of Events usage across all usage types by the Sensitive Data Scanner from the start of the given hour’s month until the given hour.
    attr_accessor :events_scanned_bytes

    # The hour for the usage.
    attr_accessor :hour

    # The total number of bytes scanned of logs usage by the Sensitive Data Scanner from the start of the given hour’s month until the given hour.
    attr_accessor :logs_scanned_bytes

    # The organization name.
    attr_accessor :org_name

    # The organization public ID.
    attr_accessor :public_id

    # The total number of bytes scanned of RUM usage across all usage types by the Sensitive Data Scanner from the start of the given hour’s month until the given hour.
    attr_accessor :rum_scanned_bytes

    # The total number of bytes scanned across all usage types by the Sensitive Data Scanner from the start of the given hour’s month until the given hour.
    attr_accessor :total_scanned_bytes

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'apm_scanned_bytes' => :'apm_scanned_bytes',
        :'events_scanned_bytes' => :'events_scanned_bytes',
        :'hour' => :'hour',
        :'logs_scanned_bytes' => :'logs_scanned_bytes',
        :'org_name' => :'org_name',
        :'public_id' => :'public_id',
        :'rum_scanned_bytes' => :'rum_scanned_bytes',
        :'total_scanned_bytes' => :'total_scanned_bytes'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'apm_scanned_bytes' => :'Integer',
        :'events_scanned_bytes' => :'Integer',
        :'hour' => :'Time',
        :'logs_scanned_bytes' => :'Integer',
        :'org_name' => :'String',
        :'public_id' => :'String',
        :'rum_scanned_bytes' => :'Integer',
        :'total_scanned_bytes' => :'Integer'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::UsageSDSHour` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::UsageSDSHour`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'apm_scanned_bytes')
        self.apm_scanned_bytes = attributes[:'apm_scanned_bytes']
      end

      if attributes.key?(:'events_scanned_bytes')
        self.events_scanned_bytes = attributes[:'events_scanned_bytes']
      end

      if attributes.key?(:'hour')
        self.hour = attributes[:'hour']
      end

      if attributes.key?(:'logs_scanned_bytes')
        self.logs_scanned_bytes = attributes[:'logs_scanned_bytes']
      end

      if attributes.key?(:'org_name')
        self.org_name = attributes[:'org_name']
      end

      if attributes.key?(:'public_id')
        self.public_id = attributes[:'public_id']
      end

      if attributes.key?(:'rum_scanned_bytes')
        self.rum_scanned_bytes = attributes[:'rum_scanned_bytes']
      end

      if attributes.key?(:'total_scanned_bytes')
        self.total_scanned_bytes = attributes[:'total_scanned_bytes']
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
          apm_scanned_bytes == o.apm_scanned_bytes &&
          events_scanned_bytes == o.events_scanned_bytes &&
          hour == o.hour &&
          logs_scanned_bytes == o.logs_scanned_bytes &&
          org_name == o.org_name &&
          public_id == o.public_id &&
          rum_scanned_bytes == o.rum_scanned_bytes &&
          total_scanned_bytes == o.total_scanned_bytes
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [apm_scanned_bytes, events_scanned_bytes, hour, logs_scanned_bytes, org_name, public_id, rum_scanned_bytes, total_scanned_bytes].hash
    end
  end
end