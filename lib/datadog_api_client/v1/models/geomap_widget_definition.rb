
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
  # This visualization displays a series of values by country on a world map.
  class GeomapWidgetDefinition
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # A list of custom links.
    attr_accessor :custom_links

    # Array of one request object to display in the widget. The request must contain a `group-by` tag whose value is a country ISO code.
    #
    # See the [Request JSON schema documentation](https://docs.datadoghq.com/dashboards/graphing_json/request_json)
    # for information about building the `REQUEST_SCHEMA`.
    attr_reader :requests

    # The style to apply to the widget.
    attr_reader :style

    # Time setting for the widget.
    attr_accessor :time

    # The title of your widget.
    attr_accessor :title

    # How to align the text on the widget.
    attr_accessor :title_align

    # The size of the title.
    attr_accessor :title_size

    # Type of the geomap widget.
    attr_reader :type

    # The view of the world that the map should render.
    attr_reader :view

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'custom_links' => :'custom_links',
        :'requests' => :'requests',
        :'style' => :'style',
        :'time' => :'time',
        :'title' => :'title',
        :'title_align' => :'title_align',
        :'title_size' => :'title_size',
        :'type' => :'type',
        :'view' => :'view'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'custom_links' => :'Array<WidgetCustomLink>',
        :'requests' => :'Array<GeomapWidgetRequest>',
        :'style' => :'GeomapWidgetDefinitionStyle',
        :'time' => :'WidgetTime',
        :'title' => :'String',
        :'title_align' => :'WidgetTextAlign',
        :'title_size' => :'String',
        :'type' => :'GeomapWidgetDefinitionType',
        :'view' => :'GeomapWidgetDefinitionView'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::GeomapWidgetDefinition` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::GeomapWidgetDefinition`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'custom_links')
        if (value = attributes[:'custom_links']).is_a?(Array)
          self.custom_links = value
        end
      end

      if attributes.key?(:'requests')
        if (value = attributes[:'requests']).is_a?(Array)
          self.requests = value
        end
      end

      if attributes.key?(:'style')
        self.style = attributes[:'style']
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

      if attributes.key?(:'view')
        self.view = attributes[:'view']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @requests.nil?
      return false if @requests.length > 1
      return false if @requests.length < 1
      return false if @style.nil?
      return false if @type.nil?
      return false if @view.nil?
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
    # @param style [Object] Object to be assigned
    # @!visibility private
    def style=(style)
      if style.nil?
        fail ArgumentError, 'invalid value for "style", style cannot be nil.'
      end
      @style = style
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

    # Custom attribute writer method with validation
    # @param view [Object] Object to be assigned
    # @!visibility private
    def view=(view)
      if view.nil?
        fail ArgumentError, 'invalid value for "view", view cannot be nil.'
      end
      @view = view
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          custom_links == o.custom_links &&
          requests == o.requests &&
          style == o.style &&
          time == o.time &&
          title == o.title &&
          title_align == o.title_align &&
          title_size == o.title_size &&
          type == o.type &&
          view == o.view
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [custom_links, requests, style, time, title, title_align, title_size, type, view].hash
    end
  end
end