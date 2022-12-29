
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
  # Object describing the extra options for a Synthetic test.
  class SyntheticsTestOptions
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # For SSL test, whether or not the test should allow self signed
    # certificates.
    attr_accessor :accept_self_signed

    # Allows loading insecure content for an HTTP request in an API test.
    attr_accessor :allow_insecure

    # For SSL test, whether or not the test should fail on revoked certificate in stapled OCSP.
    attr_accessor :check_certificate_revocation

    # CI/CD options for a Synthetic test.
    attr_accessor :ci

    # For browser test, array with the different device IDs used to run the test.
    attr_accessor :device_ids

    # Whether or not to disable CORS mechanism.
    attr_accessor :disable_cors

    # Disable Content Security Policy for browser tests.
    attr_accessor :disable_csp

    # For API HTTP test, whether or not the test should follow redirects.
    attr_accessor :follow_redirects

    # HTTP version to use for a Synthetic test.
    attr_accessor :http_version

    # Ignore server certificate error for browser tests.
    attr_accessor :ignore_server_certificate_error

    # Timeout before declaring the initial step as failed (in seconds) for browser tests.
    attr_accessor :initial_navigation_timeout

    # Minimum amount of time in failure required to trigger an alert.
    attr_accessor :min_failure_duration

    # Minimum number of locations in failure required to trigger
    # an alert.
    attr_accessor :min_location_failed

    # The monitor name is used for the alert title as well as for all monitor dashboard widgets and SLOs.
    attr_accessor :monitor_name

    # Object containing the options for a Synthetic test as a monitor
    # (for example, renotification).
    attr_accessor :monitor_options

    # Integer from 1 (high) to 5 (low) indicating alert severity.
    attr_reader :monitor_priority

    # Prevents saving screenshots of the steps.
    attr_accessor :no_screenshot

    # A list of role identifiers that can be pulled from the Roles API, for restricting read and write access.
    attr_accessor :restricted_roles

    # Object describing the retry strategy to apply to a Synthetic test.
    attr_accessor :_retry

    # The RUM data collection settings for the Synthetic browser test.
    # **Note:** There are 3 ways to format RUM settings:
    #
    # `{ isEnabled: false }`
    # RUM data is not collected.
    #
    # `{ isEnabled: true }`
    # RUM data is collected from the Synthetic test's default application.
    #
    # `{ isEnabled: true, applicationId: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", clientTokenId: 12345 }`
    # RUM data is collected using the specified application.
    attr_accessor :rum_settings

    # Object containing timeframes and timezone used for advanced scheduling.
    attr_accessor :scheduling

    # The frequency at which to run the Synthetic test (in seconds).
    attr_reader :tick_every

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'accept_self_signed' => :'accept_self_signed',
        :'allow_insecure' => :'allow_insecure',
        :'check_certificate_revocation' => :'checkCertificateRevocation',
        :'ci' => :'ci',
        :'device_ids' => :'device_ids',
        :'disable_cors' => :'disableCors',
        :'disable_csp' => :'disableCsp',
        :'follow_redirects' => :'follow_redirects',
        :'http_version' => :'httpVersion',
        :'ignore_server_certificate_error' => :'ignoreServerCertificateError',
        :'initial_navigation_timeout' => :'initialNavigationTimeout',
        :'min_failure_duration' => :'min_failure_duration',
        :'min_location_failed' => :'min_location_failed',
        :'monitor_name' => :'monitor_name',
        :'monitor_options' => :'monitor_options',
        :'monitor_priority' => :'monitor_priority',
        :'no_screenshot' => :'noScreenshot',
        :'restricted_roles' => :'restricted_roles',
        :'_retry' => :'retry',
        :'rum_settings' => :'rumSettings',
        :'scheduling' => :'scheduling',
        :'tick_every' => :'tick_every'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'accept_self_signed' => :'Boolean',
        :'allow_insecure' => :'Boolean',
        :'check_certificate_revocation' => :'Boolean',
        :'ci' => :'SyntheticsTestCiOptions',
        :'device_ids' => :'Array<SyntheticsDeviceID>',
        :'disable_cors' => :'Boolean',
        :'disable_csp' => :'Boolean',
        :'follow_redirects' => :'Boolean',
        :'http_version' => :'SyntheticsTestOptionsHTTPVersion',
        :'ignore_server_certificate_error' => :'Boolean',
        :'initial_navigation_timeout' => :'Integer',
        :'min_failure_duration' => :'Integer',
        :'min_location_failed' => :'Integer',
        :'monitor_name' => :'String',
        :'monitor_options' => :'SyntheticsTestOptionsMonitorOptions',
        :'monitor_priority' => :'Integer',
        :'no_screenshot' => :'Boolean',
        :'restricted_roles' => :'Array<String>',
        :'_retry' => :'SyntheticsTestOptionsRetry',
        :'rum_settings' => :'SyntheticsBrowserTestRumSettings',
        :'scheduling' => :'SyntheticsTestOptionsScheduling',
        :'tick_every' => :'Integer'
      }
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::SyntheticsTestOptions` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::SyntheticsTestOptions`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'accept_self_signed')
        self.accept_self_signed = attributes[:'accept_self_signed']
      end

      if attributes.key?(:'allow_insecure')
        self.allow_insecure = attributes[:'allow_insecure']
      end

      if attributes.key?(:'check_certificate_revocation')
        self.check_certificate_revocation = attributes[:'check_certificate_revocation']
      end

      if attributes.key?(:'ci')
        self.ci = attributes[:'ci']
      end

      if attributes.key?(:'device_ids')
        if (value = attributes[:'device_ids']).is_a?(Array)
          self.device_ids = value
        end
      end

      if attributes.key?(:'disable_cors')
        self.disable_cors = attributes[:'disable_cors']
      end

      if attributes.key?(:'disable_csp')
        self.disable_csp = attributes[:'disable_csp']
      end

      if attributes.key?(:'follow_redirects')
        self.follow_redirects = attributes[:'follow_redirects']
      end

      if attributes.key?(:'http_version')
        self.http_version = attributes[:'http_version']
      end

      if attributes.key?(:'ignore_server_certificate_error')
        self.ignore_server_certificate_error = attributes[:'ignore_server_certificate_error']
      end

      if attributes.key?(:'initial_navigation_timeout')
        self.initial_navigation_timeout = attributes[:'initial_navigation_timeout']
      end

      if attributes.key?(:'min_failure_duration')
        self.min_failure_duration = attributes[:'min_failure_duration']
      end

      if attributes.key?(:'min_location_failed')
        self.min_location_failed = attributes[:'min_location_failed']
      end

      if attributes.key?(:'monitor_name')
        self.monitor_name = attributes[:'monitor_name']
      end

      if attributes.key?(:'monitor_options')
        self.monitor_options = attributes[:'monitor_options']
      end

      if attributes.key?(:'monitor_priority')
        self.monitor_priority = attributes[:'monitor_priority']
      end

      if attributes.key?(:'no_screenshot')
        self.no_screenshot = attributes[:'no_screenshot']
      end

      if attributes.key?(:'restricted_roles')
        if (value = attributes[:'restricted_roles']).is_a?(Array)
          self.restricted_roles = value
        end
      end

      if attributes.key?(:'_retry')
        self._retry = attributes[:'_retry']
      end

      if attributes.key?(:'rum_settings')
        self.rum_settings = attributes[:'rum_settings']
      end

      if attributes.key?(:'scheduling')
        self.scheduling = attributes[:'scheduling']
      end

      if attributes.key?(:'tick_every')
        self.tick_every = attributes[:'tick_every']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if !@monitor_priority.nil? && @monitor_priority > 5
      return false if !@monitor_priority.nil? && @monitor_priority < 1
      return false if !@tick_every.nil? && @tick_every > 604800
      return false if !@tick_every.nil? && @tick_every < 30
      true
    end

    # Custom attribute writer method with validation
    # @param monitor_priority [Object] Object to be assigned
    # @!visibility private
    def monitor_priority=(monitor_priority)
      if !monitor_priority.nil? && monitor_priority > 5
        fail ArgumentError, 'invalid value for "monitor_priority", must be smaller than or equal to 5.'
      end
      if !monitor_priority.nil? && monitor_priority < 1
        fail ArgumentError, 'invalid value for "monitor_priority", must be greater than or equal to 1.'
      end
      @monitor_priority = monitor_priority
    end

    # Custom attribute writer method with validation
    # @param tick_every [Object] Object to be assigned
    # @!visibility private
    def tick_every=(tick_every)
      if !tick_every.nil? && tick_every > 604800
        fail ArgumentError, 'invalid value for "tick_every", must be smaller than or equal to 604800.'
      end
      if !tick_every.nil? && tick_every < 30
        fail ArgumentError, 'invalid value for "tick_every", must be greater than or equal to 30.'
      end
      @tick_every = tick_every
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accept_self_signed == o.accept_self_signed &&
          allow_insecure == o.allow_insecure &&
          check_certificate_revocation == o.check_certificate_revocation &&
          ci == o.ci &&
          device_ids == o.device_ids &&
          disable_cors == o.disable_cors &&
          disable_csp == o.disable_csp &&
          follow_redirects == o.follow_redirects &&
          http_version == o.http_version &&
          ignore_server_certificate_error == o.ignore_server_certificate_error &&
          initial_navigation_timeout == o.initial_navigation_timeout &&
          min_failure_duration == o.min_failure_duration &&
          min_location_failed == o.min_location_failed &&
          monitor_name == o.monitor_name &&
          monitor_options == o.monitor_options &&
          monitor_priority == o.monitor_priority &&
          no_screenshot == o.no_screenshot &&
          restricted_roles == o.restricted_roles &&
          _retry == o._retry &&
          rum_settings == o.rum_settings &&
          scheduling == o.scheduling &&
          tick_every == o.tick_every
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [accept_self_signed, allow_insecure, check_certificate_revocation, ci, device_ids, disable_cors, disable_csp, follow_redirects, http_version, ignore_server_certificate_error, initial_navigation_timeout, min_failure_duration, min_location_failed, monitor_name, monitor_options, monitor_priority, no_screenshot, restricted_roles, _retry, rum_settings, scheduling, tick_every].hash
    end
  end
end