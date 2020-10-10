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
  # The Distribution visualization is another way of showing metrics
  # aggregated across one or several tags, such as hosts.
  # Unlike the heat map, a distribution graph’s x-axis is quantity rather than time.
  class DistributionWidgetDefinition
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # (Deprecated) The widget legend was replaced by a tooltip and sidebar.
    attr_accessor :legend_size

    # List of markers.
    attr_accessor :markers

    # Array of one request object to display in the widget.
    #
    # See the dedicated [Request JSON schema documentation](https://docs.datadoghq.com/dashboards/graphing_json/request_json)
    #  to learn how to build the `REQUEST_SCHEMA`.
    attr_reader :requests

    # (Deprecated) The widget legend was replaced by a tooltip and sidebar.
    attr_accessor :show_legend

    # Time setting for the widget.
    attr_accessor :time

    # Title of the widget.
    attr_accessor :title

    # How to align the text on the widget.
    attr_accessor :title_align

    # Size of the title.
    attr_accessor :title_size

    # Type of the distribution widget.
    attr_reader :type

    # X Axis controls for the distribution widget.
    attr_accessor :xaxis

    # Y Axis controls for the distribution widget.
    attr_accessor :yaxis

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'legend_size' => :'legend_size',
        :'markers' => :'markers',
        :'requests' => :'requests',
        :'show_legend' => :'show_legend',
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
        :'legend_size' => :'String',
        :'markers' => :'Array<WidgetMarker>',
        :'requests' => :'Array<DistributionWidgetRequest>',
        :'show_legend' => :'Boolean',
        :'time' => :'WidgetTime',
        :'title' => :'String',
        :'title_align' => :'WidgetTextAlign',
        :'title_size' => :'String',
        :'type' => :'DistributionWidgetDefinitionType',
        :'xaxis' => :'DistributionWidgetXAxis',
        :'yaxis' => :'DistributionWidgetYAxis'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::DistributionWidgetDefinition` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::DistributionWidgetDefinition`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'legend_size')
        self.legend_size = attributes[:'legend_size']
      end

      if attributes.key?(:'markers')
        if (value = attributes[:'markers']).is_a?(Array)
          self.markers = value
        end
      end

      if attributes.key?(:'requests')
        if (value = attributes[:'requests']).is_a?(Array)
          self.requests = value
        end
      end

      if attributes.key?(:'show_legend')
        self.show_legend = attributes[:'show_legend']
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
      return false if @requests.length > 1
      return false if @requests.length < 1
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
      if requests.length > 1
        fail ArgumentError, 'invalid value for "requests", number of items must be less than or equal to 1.'
      end
      if requests.length < 1
        fail ArgumentError, 'invalid value for "requests", number of items must be greater than or equal to 1.'
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
          legend_size == o.legend_size &&
          m