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
  # The style to apply to the widget.
  class HostMapWidgetDefinitionStyle
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Max value to use to color the map.
    attr_accessor :fill_max

    # Min value to use to color the map.
    attr_accessor :fill_min

    # Color palette to apply to the widget.
    attr_accessor :palette

    # Whether to flip the palette tones.
    attr_accessor :palette_flip

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'fill_max' => :'fill_max',
        :'fill_min' => :'fill_min',
        :'palette' => :'palette',
        :'palette_flip' => :'palette_flip'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'fill_max' => :'String',
        :'fill_min' => :'String',
        :'palette' => :'String',
        :'palette_flip' => :'Boolean'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::HostMapWidgetDefinitionStyle` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::HostMapWidgetDefinitionStyle`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'fill_max')
        self.fill_max = attributes[:'fill_max']
      end

      if attributes.key?(:'fill_min')
        self.fill_min = attributes[:'fill_min']
      end

      if attributes.key?(:'palette')
        self.palette = attributes[:'palette']
      end

      if attributes.key?(:'palette_flip')
        self.palette_flip = attributes[:'palette_flip']
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
          fill_max == o.fill_max &&
          fill_min == o.fill_min &&
          palette == o.palette &&
          palette_flip == o.palette_flip
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [fill_max, fill_min, palette, palette_flip].hash
    end
  end
end