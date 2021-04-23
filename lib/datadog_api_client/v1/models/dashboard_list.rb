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
  # Your Datadog Dashboards.
  class DashboardList
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Object describing the creator of the shared element.
    attr_accessor :author

    # Date of creation of the dashboard list.
    attr_accessor :created

    # The number of dashboards in the list.
    attr_accessor :dashboard_count

    # The ID of the dashboard list.
    attr_accessor :id

    # Whether or not the list is in the favorites.
    attr_accessor :is_favorite

    # Date of last edition of the dashboard list.
    attr_accessor :modified

    # The name of the dashboard list.
    attr_reader :name

    # The type of dashboard list.
    attr_accessor :type

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'author' => :'author',
        :'created' => :'created',
        :'dashboard_count' => :'dashboard_count',
        :'id' => :'id',
        :'is_favorite' => :'is_favorite',
        :'modified' => :'modified',
        :'name' => :'name',
        :'type' => :'type'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'author' => :'Creator',
        :'created' => :'Time',
        :'dashboard_count' => :'Integer',
        :'id' => :'Integer',
        :'is_favorite' => :'Boolean',
        :'modified' => :'Time',
        :'name' => :'String',
        :'type' => :'String'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::DashboardList` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::DashboardList`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'author')
        self.author = attributes[:'author']
      end

      if attributes.key?(:'created')
        self.created = attributes[:'created']
      end

      if attributes.key?(:'dashboard_count')
        self.dashboard_count = attributes[:'dashboard_count']
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'is_favorite')
        self.is_favorite = attributes[:'is_favorite']
      end

      if attributes.key?(:'modified')
        self.modified = attributes[:'modified']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
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
          author == o.author &&
          created == o.created &&
          dashboard_count == o.dashboard_count &&
          id == o.id &&
          is_favorite == o.is_favorite &&
          modified == o.modified &&
          name == o.name &&
          type == o.type
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [author, created, dashboard_count, id, is_favorite, modified, name, type].hash
    end
  end
end