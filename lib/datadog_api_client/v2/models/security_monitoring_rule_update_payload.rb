
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
  # Update an existing rule.
  class SecurityMonitoringRuleUpdatePayload
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Cases for generating signals.
    attr_accessor :cases

    # How to generate compliance signals. Useful for cloud_configuration rules only.
    attr_accessor :compliance_signal_options

    # Additional queries to filter matched events before they are processed.
    attr_accessor :filters

    # Whether the notifications include the triggering group-by values in their title.
    attr_accessor :has_extended_title

    # Whether the rule is enabled.
    attr_accessor :is_enabled

    # Message for generated signals.
    attr_accessor :message

    # Name of the rule.
    attr_accessor :name

    # Options on rules.
    attr_accessor :options

    # Queries for selecting logs which are part of the rule.
    attr_accessor :queries

    # Tags for generated signals.
    attr_accessor :tags

    # The version of the rule being updated.
    attr_reader :version

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'cases' => :'cases',
        :'compliance_signal_options' => :'complianceSignalOptions',
        :'filters' => :'filters',
        :'has_extended_title' => :'hasExtendedTitle',
        :'is_enabled' => :'isEnabled',
        :'message' => :'message',
        :'name' => :'name',
        :'options' => :'options',
        :'queries' => :'queries',
        :'tags' => :'tags',
        :'version' => :'version'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'cases' => :'Array<SecurityMonitoringRuleCase>',
        :'compliance_signal_options' => :'CloudConfigurationRuleComplianceSignalOptions',
        :'filters' => :'Array<SecurityMonitoringFilter>',
        :'has_extended_title' => :'Boolean',
        :'is_enabled' => :'Boolean',
        :'message' => :'String',
        :'name' => :'String',
        :'options' => :'SecurityMonitoringRuleOptions',
        :'queries' => :'Array<SecurityMonitoringRuleQuery>',
        :'tags' => :'Array<String>',
        :'version' => :'Integer'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::SecurityMonitoringRuleUpdatePayload` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V2::SecurityMonitoringRuleUpdatePayload`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'cases')
        if (value = attributes[:'cases']).is_a?(Array)
          self.cases = value
        end
      end

      if attributes.key?(:'compliance_signal_options')
        self.compliance_signal_options = attributes[:'compliance_signal_options']
      end

      if attributes.key?(:'filters')
        if (value = attributes[:'filters']).is_a?(Array)
          self.filters = value
        end
      end

      if attributes.key?(:'has_extended_title')
        self.has_extended_title = attributes[:'has_extended_title']
      end

      if attributes.key?(:'is_enabled')
        self.is_enabled = attributes[:'is_enabled']
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'options')
        self.options = attributes[:'options']
      end

      if attributes.key?(:'queries')
        if (value = attributes[:'queries']).is_a?(Array)
          self.queries = value
        end
      end

      if attributes.key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.key?(:'version')
        self.version = attributes[:'version']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if !@version.nil? && @version > 2147483647
      true
    end

    # Custom attribute writer method with validation
    # @param version [Object] Object to be assigned
    # @!visibility private
    def version=(version)
      if !version.nil? && version > 2147483647
        fail ArgumentError, 'invalid value for "version", must be smaller than or equal to 2147483647.'
      end
      @version = version
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          cases == o.cases &&
          compliance_signal_options == o.compliance_signal_options &&
          filters == o.filters &&
          has_extended_title == o.has_extended_title &&
          is_enabled == o.is_enabled &&
          message == o.message &&
          name == o.name &&
          options == o.options &&
          queries == o.queries &&
          tags == o.tags &&
          version == o.version
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [cases, compliance_signal_options, filters, has_extended_title, is_enabled, message, name, options, queries, tags, version].hash
    end
  end
end