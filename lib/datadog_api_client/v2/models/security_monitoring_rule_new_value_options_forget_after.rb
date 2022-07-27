
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
  # The duration in days after which a learned value is forgotten.
  class SecurityMonitoringRuleNewValueOptionsForgetAfter
    include BaseEnumModel

    ONE_DAY = 1.freeze
    TWO_DAYS = 2.freeze
    ONE_WEEK = 7.freeze
    TWO_WEEKS = 14.freeze
    THREE_WEEKS = 21.freeze
    FOUR_WEEKS = 28.freeze
  end
end