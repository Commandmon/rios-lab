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
  # Number of hosts/containers recorded for each hour for a given organization.
  class UsageHostHour
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Contains the total number of infrastructure hosts reporting
    # during a given hour that were running the Datadog Agent.
    attr_accessor :agent_host_count

    # Contains the total number of hosts that reported through Alibaba integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :alibaba_host_count

    # Contains the total number of Azure App Services hosts using APM.
    attr_accessor :apm_azure_app_service_host_count

    # Shows the total number of hosts using APM during the hour,
    # these are counted as billable (except during trial periods).
    attr_accessor :apm_host_count

    # Contains the total number of hosts that reported through the AWS integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :aws_host_count

    # Contains the total number of hosts that reported through Azure integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :azure_host_count

    # Shows the total number of containers reported by the Docker integration during the hour.
    attr_accessor :container_count

    # Contains the total number of hosts that reported through the Google Cloud integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :gcp_host_count

    # Contains the total number of Heroku dynos reported by the Datadog Agent.
    attr_accessor :heroku_host_count

    # Contains the total number of billable infrastructure hosts reporting during a given hour.
    # This is the sum of `agent_host_count`, `aws_host_count`, and `gcp_host_count`.
    attr_accessor :host_count

    # The hour for the usage.
    attr_accessor :hour

    # Contains the total number of hosts that reported through the Azure App Services integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :infra_azure_app_service

    # Contains the total number of hosts using APM reported by Datadog exporter for the OpenTelemetry Collector.
    attr_accessor :opentelemetry_apm_host_count

    # Contains the total number of hosts reported by Datadog exporter for the OpenTelemetry Collector.
    attr_accessor :opentelemetry_host_count

    # The organization name.
    attr_accessor :org_name

    # The organization public ID.
    attr_accessor :public_id

    # Contains the total number of hosts that reported through vSphere integration
    # (and were NOT running the Datadog Agent).
    attr_accessor :vsphere_host_count

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'agent_host_count' => :'agent_host_count',
        :'alibaba_host_count' => :'alibaba_host_count',
        :'apm_azure_app_service_host_count' => :'apm_azure_app_service_host_count',
        :'apm_host_count' => :'apm_host_count',
        :'aws_host_count' => :'aws_host_count',
        :'azure_host_count' => :'azure_host_count',
        :'container_count' => :'container_count',
        :'gcp_host_count' => :'gcp_host_count',
        :'heroku_host_count' => :'heroku_host_count',
        :'host_count' => :'host_count',
        :'hour' => :'hour',
        :'infra_azure_app_service' => :'infra_azure_app_service',
        :'opentelemetry_apm_host_count' => :'opentelemetry_apm_host_count',
        :'opentelemetry_host_count' => :'opentelemetry_host_count',
        :'org_name' => :'org_name',
        :'public_id' => :'public_id',
        :'vsphere_host_count' => :'vsphere_host_count'
      }
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'agent_host_count' => :'Integer',
        :'alibaba_host_count' => :'Integer',
        :'apm_azure_app_service_host_count' => :'Integer',
        :'apm_host_count' => :'Integer',
        :'aws_host_count' => :'Integer',
        :'azure_host_count' => :'Integer',
        :'container_count' => :'Integer',
        :'gcp_host_count' => :'Integer',
        :'heroku_host_count' => :'Integer',
        :'host_count' => :'Integer',
        :'hour' => :'Time',
        :'infra_azur