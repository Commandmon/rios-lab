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
  # Object describing the issuer of a SSL certificate.
  class SyntheticsSSLCertificateIssuer
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Country Name that issued the certificate.
    attr_accessor :c

    # Common Name that issued certificate.
    attr_accessor :cn

    # Locality that issued the certificate.
    attr_accessor :l

    # Organization that issued the certificate.
    attr_accessor :o

    # Organizational Unit that issued the certificate.
    attr_accessor :ou

    # State Or Province Name that issued the certificate.
    attr_accessor :st

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'c' => :'C',
        :'cn' => :'CN',
        :'l' => :'L',
        :'o' => :'O',
        :'ou' => :'OU',
        :'st' => :'ST'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'c' => :'String',
        :'cn' => :'String',
        :'l' => :'String',
        :'o' => :'String',
        :'ou' => :'String',
        :'st' => :'String'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::SyntheticsSSLCertificateIssuer` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::SyntheticsSSLCertificateIssuer`. Please c