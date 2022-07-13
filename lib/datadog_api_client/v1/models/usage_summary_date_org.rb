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
  # Global hourly report of all data billed by Datadog for a given organization.
  class UsageSummaryDateOrg
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Shows the 99th percentile of all agent hosts over all hours in the current date for the given org.
    attr_accessor :agent_host_top99p

    # Shows the 99th percentile of all Azure app services using APM over all hours in the current date for the given org.
    attr_accessor :apm_azure_app_service_host_top99p

    # Shows the average of all APM ECS Fargate tasks over all hours in the current months for the given org.
    attr_accessor :apm_fargate_count_avg

    # Shows the 99th percentile of all distinct APM hosts over all hours in the current date for the given org.
    attr_accessor :apm_host_top99p

    # Shows the average of all Application Security Monitoring ECS Fargate tasks over all hours in the current months for the given org.
    attr_accessor :appsec_fargate_count_avg

    # Shows the sum of all audit logs lines indexed over all hours in the current date for the given org.
    attr_accessor :audit_logs_lines_indexed_sum

    # Shows whether Audit Trail is enabled for the current date for the given org.
    attr_accessor :audit_trail_enabled_hwm

    # The average profiled task count for Fargate Profiling.
    attr_accessor :avg_profiled_fargate_tasks

    # Shows the 99th percentile of all AWS hosts over all hours in the current date for the given org.
    attr_accessor :aws_host_top99p

    # Shows the sum of all AWS Lambda invocations over all hours in the current date for the given org.
    attr_accessor :aws_lambda_func_count

    # Shows the sum of all AWS Lambda invocations over all hours in the current date for the given org.
    attr_accessor :aws_lambda_invocations_sum

    # Shows the 99th percentile of all Azure app services over all hours in the current date for the given org.
    attr_accessor :azure_app_service_top99p

    # Shows the sum of all log bytes ingested over all hours in the current date for the given org.
    attr_accessor :billable_ingested_bytes_sum

    # Shows the sum of all browser lite sessions over all hours in the current date for the given org.
    attr_accessor :browser_rum_lite_session_count_sum

    # Shows the sum of all browser replay sessions over all hours in the current date for the given org.
    attr_accessor :browser_rum_replay_session_count_sum

    # Shows the sum of all browser RUM units over all hours in the current date for the given org.
    attr_accessor :browser_rum_units_sum

    # Shows the sum of all CI pipeline indexed spans over all hours in the current date for the given org.
    attr_accessor :ci_pipeline_indexed_spans_sum

    # Shows the sum of all CI test indexed spans over all hours in the current date for the given org.
    attr_accessor :ci_test_indexed_spans_sum

    # Shows the high-water ma