@endpoint(logs-pipelines) @endpoint(logs-pipelines-v1)
Feature: Logs Pipelines
  Pipelines and processors operate on incoming logs, parsing and
  transforming them into structured attributes for easier querying.  - See
  the [pipelines configuration
  page](https://app.datadoghq.com/logs/pipelines)   for a list of the
  pipelines and processors currently configured in web UI.  - Additional
  API-related information about processors can be found in the   [processors
  documentation](https://docs.datadoghq.com/logs/log_configuration/processor
  s/?tab=api#lookup-processor).  - For more information about Pipelines, see
  the   [pipeline documentation](https://docs.datadoghq.com/logs/log_configu
  ration/pipelines).  **Notes:**  These endpoints are only available for
  admin users. Make sure to use an application key created by an admin.
  **Grok parsing rules may effect JSON output and require returned data to
  be configured before using in a request.** For example, if you are using
  the data returned from a request for another request body, and have a
  parsing rule that uses a regex pattern like `\s` for spaces, you will need
  to configure all escaped spaces as `%{space}` to use in the body data.

  Background:
    Given a valid "apiKey