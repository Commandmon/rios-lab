
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
  # Define a time window.
  class WidgetTimeWindows
    include BaseEnumModel

    SEVEN_DAYS = "7d".freeze
    THIRTY_DAYS = "30d".freeze
    NINETY_DAYS = "90d".freeze
    WEEK_TO_DATE = "week_to_date".freeze
    PREVIOUS_WEEK = "previous_week".freeze
    MONTH_TO_DATE = "month_to_date".freeze
    PREVIOUS_MONTH = "previous_month".freeze
    GLOBAL_TIME = "global_time".freeze
  end
end