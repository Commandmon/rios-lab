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
  # The scatter plot visualization allows you to graph a chosen scope over two different metrics with their respective aggregation.
  class ScatterPlotWidgetDefinition
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # List of groups used for colors.
    attr_accessor :color_by_groups

    # List of custom links.
    attr_accessor :custom_links

    # Widget definition.
    attr_reader :requests

    # Time setting for the widget.
    attr_accessor :time

    # Title of your widget.
    attr_accessor :title

    # How to align the text on the widget.
    attr_accessor :title_align

    # Size of the title.
    attr_accessor :title_size

    # Type of the scatter plot widget.
    attr_reader :type

    # Axis controls for the widget.
    attr_accessor :xaxis

    # Axis controls for the widget.
    attr_accessor :yaxis

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'color_by_groups' => :'color_by_groups',
        :'custom_links' => :'custom_links',
        :'requests' => :'requests',
        :'time' => :'time',
        :'title' => :'title',
        :'title_align' => :'title_align',
        :'title_size' => :'title_size',
        :'type' => :'type',
        :'xaxis' => :'xaxis',
        :'yaxis' => :'yaxis'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'color_by_groups' => :'Array<String>',
        :'custom_links' => :'Array<WidgetCustomLink>',
        :'requests' => :'ScatterPlotWidgetDefinitionRequests',
        :'time' => :'WidgetTime',
        :'title' => :'String',
        :'title_align' => :'WidgetTextAlign',
        :'title_size' => :'String',
        :'type' => :'ScatterPlotWidgetDefinitionType',
        :'xaxis' => :'WidgetAxis',
        :'yaxis' => :'WidgetAxis'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::ScatterPlotWidgetDefinition` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::ScatterPlotWidgetDefinition`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'color_by_groups')
        if (value = attributes[:'color_by_groups']).is_a?(Array)
          self.color_by_groups = value
        end
      end

      if attributes.key?(:'custom_links')
        if (value = attributes[:'custom_links']).is_a?(Array)
          self.custom_links = value
        end
      end

      if attributes.key?(:'requests')
        self.requests = attributes[:'requests']
      end

      if attributes.key?(:'time')
        self.time = attributes[:'time']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'title_align')
        self.title_align = attributes[:'title_align']
      end

      if attributes.key?(:'title_size')
        self.title_size = attributes[:'title_size']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'xaxis')
        self.xaxis = attributes[:'xaxis']
      end

      if attributes.key?(:'yaxis')
        self.yaxis = attributes[:'yaxis']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @requests.nil?
      return false if @type.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param requests [Object] Object to be assigned
    # @!visibility private
    def requests=(requests)
      if requests.nil?
        fail ArgumentError, 'invalid value for "requests", requests cannot be nil.'
      end
      @requests = requests
    end

    # Custom attribute writer method with validation
    # @param type [Object] Object to be assigned
    # @!visibility private
    def type=(type)
      if type.nil?
        fail ArgumentError, 'invalid value for "type", type cannot be nil.'
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          color_by_groups == o.color_by_groups &&
          custom_links == o.custom_links &&
          requests == o.requests &&
          time == o.time &&
          title == o.title &&
          title_align == o.title_align &&
          title_size == o.title_size &&
          type == o.type &&
          xaxis == o.xaxis &&
          yaxis == o.yaxis
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [color_by_groups, custom_links, requests, time, title, title_align, title_size, type, xaxis, yaxis].hash
    end
  end
end