
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
  # Metric origin information.
  class MetricOrigin
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The origin metric type code
    attr_reader :metric_type

    # The origin product code
    attr_reader :product

    # The origin service code
    attr_reader :service

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'metric_type' => :'metric_type',
        :'product' => :'product',
        :'service' => :'service'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'metric_type' => :'Integer',
        :'product' => :'Integer',
        :'service' => :'Integer'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::MetricOrigin` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V2::MetricOrigin`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'metric_type')
        self.metric_type = attributes[:'metric_type']
      end

      if attributes.key?(:'product')
        self.product = attributes[:'product']
      end

      if attributes.key?(:'service')
        self.service = attributes[:'service']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if !@metric_type.nil? && @metric_type > 1000
      return false if !@product.nil? && @product > 1000
      return false if !@service.nil? && @service > 1000
      true
    end

    # Custom attribute writer method with validation
    # @param metric_type [Object] Object to be assigned
    # @!visibility private
    def metric_type=(metric_type)
      if !metric_type.nil? && metric_type > 1000
        fail ArgumentError, 'invalid value for "metric_type", must be smaller than or equal to 1000.'
      end
      @metric_type = metric_type
    end

    # Custom attribute writer method with validation
    # @param product [Object] Object to be assigned
    # @!visibility private
    def product=(product)
      if !product.nil? && product > 1000
        fail ArgumentError, 'invalid value for "product", must be smaller than or equal to 1000.'
      end
      @product = product
    end

    # Custom attribute writer method with validation
    # @param service [Object] Object to be assigned
    # @!visibility private
    def service=(service)
      if !service.nil? && service > 1000
        fail ArgumentError, 'invalid value for "service", must be smaller than or equal to 1000.'
      end
      @service = service
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          metric_type == o.metric_type &&
          product == o.product &&
          service == o.service
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [metric_type, product, service].hash
    end
  end
end