
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
  # The attributes of a notebook `timeseries` cell.
  class NotebookTimeseriesCellAttributes
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The timeseries visualization allows you to display the evolution of one or more metrics, log events, or Indexed Spans over time.
    attr_reader :definition

    # The size of the graph.
    attr_accessor :graph_size

    # Object describing how to split the graph to display multiple visualizations per request.
    attr_accessor :split_by

    # Timeframe for the notebook cell. When 'null', the notebook global time is used.
    attr_accessor :time

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'definition' => :'definition',
        :'graph_size' => :'graph_size',
        :'split_by' => :'split_by',
        :'time' => :'time'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'definition' => :'TimeseriesWidgetDefinition',
        :'graph_size' => :'NotebookGraphSize',
        :'split_by' => :'NotebookSplitBy',
        :'time' => :'NotebookCellTime'
      }
    end

    # List of attributes with nullable: true
    # @!visibility private
    def self.openapi_nullable
      Set.new([
        :'time',
      ])
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::NotebookTimeseriesCellAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::NotebookTimeseriesCellAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'definition')
        self.definition = attributes[:'definition']
      end

      if attributes.key?(:'graph_size')
        self.graph_size = attributes[:'graph_size']
      end

      if attributes.key?(:'split_by')
        self.split_by = attributes[:'split_by']
      end

      if attributes.key?(:'time')
        self.time = attributes[:'time']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @definition.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param definition [Object] Object to be assigned
    # @!visibility private
    def definition=(definition)
      if definition.nil?
        fail ArgumentError, 'invalid value for "definition", definition cannot be nil.'
      end
      @definition = definition
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          definition == o.definition &&
          graph_size == o.graph_size &&
          split_by == o.split_by &&
          time == o.time
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [definition, graph_size, split_by, time].hash
    end
  end
end