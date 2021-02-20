
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
  # The service summary displays the graphs of a chosen service in your screenboard. Only available on FREE layout dashboards.
  class ServiceSummaryWidgetDefinition
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Number of columns to display.
    attr_accessor :display_format

    # APM environment.
    attr_reader :env

    # APM service.
    attr_reader :service

    # Whether to show the latency breakdown or not.
    attr_accessor :show_breakdown

    # Whether to show the latency distribution or not.
    attr_accessor :show_distribution

    # Whether to show the error metrics or not.
    attr_accessor :show_errors

    # Whether to show the hits metrics or not.
    attr_accessor :show_hits

    # Whether to show the latency metrics or not.
    attr_accessor :show_latency

    # Whether to show the resource list or not.
    attr_accessor :show_resource_list

    # Size of the widget.
    attr_accessor :size_format

    # APM span name.
    attr_reader :span_name

    # Time setting for the widget.
    attr_accessor :time

    # Title of the widget.
    attr_accessor :title

    # How to align the text on the widget.
    attr_accessor :title_align

    # Size of the title.
    attr_accessor :title_size

    # Type of the service summary widget.
    attr_reader :type

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'display_format' => :'display_format',
        :'env' => :'env',
        :'service' => :'service',
        :'show_breakdown' => :'show_breakdown',
        :'show_distribution' => :'show_distribution',
        :'show_errors' => :'show_errors',
        :'show_hits' => :'show_hits',
        :'show_latency' => :'show_latency',
        :'show_resource_list' => :'show_resource_list',
        :'size_format' => :'size_format',
        :'span_name' => :'span_name',
        :'time' => :'time',
        :'title' => :'title',
        :'title_align' => :'title_align',
        :'title_size' => :'title_size',
        :'type' => :'type'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'display_format' => :'WidgetServiceSummaryDisplayFormat',
        :'env' => :'String',
        :'service' => :'String',
        :'show_breakdown' => :'Boolean',
        :'show_distribution' => :'Boolean',
        :'show_errors' => :'Boolean',
        :'show_hits' => :'Boolean',
        :'show_latency' => :'Boolean',
        :'show_resource_list' => :'Boolean',
        :'size_format' => :'WidgetSizeFormat',
        :'span_name' => :'String',
        :'time' => :'WidgetTime',
        :'title' => :'String',
        :'title_align' => :'WidgetTextAlign',
        :'title_size' => :'String',
        :'type' => :'ServiceSummaryWidgetDefinitionType'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::ServiceSummaryWidgetDefinition` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::ServiceSummaryWidgetDefinition`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'display_format')
        self.display_format = attributes[:'display_format']
      end

      if attributes.key?(:'env')
        self.env = attributes[:'env']
      end

      if attributes.key?(:'service')
        self.service = attributes[:'service']
      end

      if attributes.key?(:'show_breakdown')
        self.show_breakdown = attributes[:'show_breakdown']
      end

      if attributes.key?(:'show_distribution')
        self.show_distribution = attributes[:'show_distribution']
      end

      if attributes.key?(:'show_errors')
        self.show_errors = attributes[:'show_errors']
      end

      if attributes.key?(:'show_hits')
        self.show_hits = attributes[:'show_hits']
      end

      if attributes.key?(:'show_latency')
        self.show_latency = attributes[:'show_latency']
      end

      if attributes.key?(:'show_resource_list')
        self.show_resource_list = attributes[:'show_resource_list']
      end

      if attributes.key?(:'size_format')
        self.size_format = attributes[:'size_format']
      end

      if attributes.key?(:'span_name')
        self.span_name = attributes[:'span_name']
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
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @env.nil?
      return false if @service.nil?
      return false if @span_name.nil?
      return false if @type.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param env [Object] Object to be assigned
    # @!visibility private
    def env=(env)
      if env.nil?
        fail ArgumentError, 'invalid value for "env", env cannot be nil.'
      end
      @env = env
    end

    # Custom attribute writer method with validation
    # @param service [Object] Object to be assigned
    # @!visibility private
    def service=(service)
      if service.nil?
        fail ArgumentError, 'invalid value for "service", service cannot be nil.'
      end
      @service = service
    end

    # Custom attribute writer method with validation
    # @param span_name [Object] Object to be assigned
    # @!visibility private
    def span_name=(span_name)
      if span_name.nil?
        fail ArgumentError, 'invalid value for "span_name", span_name cannot be nil.'
      end
      @span_name = span_name
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
          display_format == o.display_format &&
          env == o.env &&
          service == o.service &&
          show_breakdown == o.show_breakdown &&
          show_distribution == o.show_distribution &&
          show_errors == o.show_errors &&
          show_hits == o.show_hits &&
          show_latency == o.show_latency &&
          show_resource_list == o.show_resource_list &&
          size_format == o.size_format &&
          span_name == o.span_name &&
          time == o.time &&
          title == o.title &&
          title_align == o.title_align &&
          title_size == o.title_size &&
          type == o.type
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [display_format, env, service, show_breakdown, show_distribution, show_errors, show_hits, show_latency, show_resource_list, size_format, span_name, time, title, title_align, title_size, type].hash
    end
  end
end