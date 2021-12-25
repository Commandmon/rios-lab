
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
  # Column properties.
  class ApmStatsQueryColumnType
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # A user-assigned alias for the column.
    attr_accessor :_alias

    # Define a display mode for the table cell.
    attr_accessor :cell_display_mode

    # Column name.
    attr_reader :name

    # Widget sorting methods.
    attr_accessor :order

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'_alias' => :'alias',
        :'cell_display_mode' => :'cell_display_mode',
        :'name' => :'name',
        :'order' => :'order'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'_alias' => :'String',
        :'cell_display_mode' => :'TableWidgetCellDisplayMode',
        :'name' => :'String',
        :'order' => :'WidgetSort'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::ApmStatsQueryColumnType` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::ApmStatsQueryColumnType`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'_alias')
        self._alias = attributes[:'_alias']
      end

      if attributes.key?(:'cell_display_mode')
        self.cell_display_mode = attributes[:'cell_display_mode']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'order')
        self.order = attributes[:'order']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @name.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param name [Object] Object to be assigned
    # @!visibility private
    def name=(name)
      if name.nil?
        fail ArgumentError, 'invalid value for "name", name cannot be nil.'
      end
      @name = name
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          _alias == o._alias &&
          cell_display_mode == o.cell_display_mode &&
          name == o.name &&
          order == o.order
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [_alias, cell_display_mode, name, order].hash
    end
  end
end