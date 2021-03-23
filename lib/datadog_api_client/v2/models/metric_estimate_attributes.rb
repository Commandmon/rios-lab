
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
  # Object containing the definition of a metric estimate attribute.
  class MetricEstimateAttributes
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Estimate type based on the queried configuration. By default, `count_or_gauge` is returned. `distribution` is returned for distribution metrics without percentiles enabled. Lastly, `percentile` is returned if `filter[pct]=true` is queried with a distribution metric.
    attr_accessor :estimate_type

    # Timestamp when the cardinality estimate was requested.
    attr_accessor :estimated_at

    # Estimated cardinality of the metric based on the queried configuration.
    attr_accessor :estimated_output_series

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'estimate_type' => :'estimate_type',
        :'estimated_at' => :'estimated_at',
        :'estimated_output_series' => :'estimated_output_series'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'estimate_type' => :'MetricEstimateType',
        :'estimated_at' => :'Time',
        :'estimated_output_series' => :'Integer'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::MetricEstimateAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V2::MetricEstimateAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'estimate_type')
        self.estimate_type = attributes[:'estimate_type']
      end

      if attributes.key?(:'estimated_at')
        self.estimated_at = attributes[:'estimated_at']
      end

      if attributes.key?(:'estimated_output_series')
        self.estimated_output_series = attributes[:'estimated_output_series']
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
          estimate_type == o.estimate_type &&
          estimated_at == o.estimated_at &&
          estimated_output_series == o.estimated_output_series
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [estimate_type, estimated_at, estimated_output_series].hash
    end
  end
end