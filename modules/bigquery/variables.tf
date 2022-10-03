# Project ID declaration
variable "project_id" {
  type = string
}

# Define datasets
variable "datasets" {
  default = ["wisdb"]
}



variable "partitioned_bq_external_tables" {
  default = {
    cstbhv_call_fact = {
      schema_path       = "schema/cstbhv_call_fact.json",
      dataset           = "wisdb",
      source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
      source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    },
    cstbhv_call_fact_transfer = {
      schema_path       = "schema/cstbhv_call_fact_transfer.json",
      dataset           = "wisdb",
      source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact_transfer/v1/*.parquet"],
      source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact_transfer/v1/{start_date:INTEGER}"
    },
    cstbhv_data_request = {
      schema_path       = "schema/cstbhv_data_request.json",
      dataset           = "wisdb",
      source_uris       = ["gs://htg-wisdb/bhv/cstbhv_data_request/v1/*.parquet"],
      source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_data_request/v1/{start_date:INTEGER}"
    },
    cstbhv_prompt_collect_fact = {
      schema_path       = "schema/cstbhv_prompt_collect_fact.json",
      dataset           = "wisdb",
      source_uris       = ["gs://htg-wisdb/bhv/cstbhv_prompt_collect_fact/v1/*.parquet"],
      source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_prompt_collect_fact/v1/{start_date:INTEGER}"
    },
    cstbhv_segment = {
      schema_path       = "schema/cstbhv_segment.json",
      dataset           = "wisdb",
      source_uris       = ["gs://htg-wisdb/bhv/cstbhv_segment/v1/*.parquet"],
      source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_segment/v1/{start_date:INTEGER}"
    }
    # HRC_CALL_FACT = {
    #   schema_path       = "schema/HRC_CALL_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # },
    # HRC_OPTION_FACT = {
    #   schema_path       = "schema/HRC_OPTION_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # },
    # HRC_EVENT_FACT = {
    #   schema_path       = "schema/HRC_EVENT_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # },
    # HRC_ASR_FACT = {
    #   schema_path       = "schema/HRC_ASR_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # },
    # HRC_TTS_TALENT_FACT = {
    #   schema_path       = "schema/HRC_TTS_TALENT_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # },
    # SMS_FACT = {
    #   schema_path       = "schema/SMS_FACT.json", 
    #   dataset           = "wisdb",
    #   source_uris       = ["gs://htg-wisdb/bhv/cstbhv_call_fact/v1/*.parquet"],
    #   source_uri_prefix = "gs://htg-wisdb/bhv/cstbhv_call_fact/v1/{start_date:INTEGER}"
    # }
  }
}

variable "partitioned_bq_native_tables" {
  default = {
    cstbhv_prompt_collect_hour_summary = {
      schema_path      = "schema/cstbhv_prompt_collect_hour_summary.json",
      dataset          = "wisdb",
      partition_type   = "DAY",
      partition_field  = "start_date",
      partition_filter = "true"
    },
    cstbhv_repeat_caller_summary = {
      schema_path      = "schema/cstbhv_repeat_caller_summary.json",
      dataset          = "wisdb",
      partition_type   = "DAY",
      partition_field  = "start_date",
      partition_filter = "true"
    },
    cstbhv_call_hour_summary = {
      schema_path      = "schema/cstbhv_call_hour_summary.json",
      dataset          = "wisdb",
      partition_type   = "DAY",
      partition_field  = "start_date",
      partition_filter = "true"
    },
    cstbhv_self_service_hour_summary = {
      schema_path      = "schema/cstbhv_self_service_hour_summary.json",
      dataset          = "wisdb",
      partition_type   = "DAY",
      partition_field  = "start_date",
      partition_filter = "true"
    }
  }
}

variable "partitioned_bq_native_tables_routine" {
  default = {
    cstbhv_prompt_collect_hour_summary_routine = {
      routine         = "PROCEDURE",
      dataset         = "wisdb",
      language        = "SQL",
      definition_body = "procedures/cstbhv_prompt_collect_hour_summary.sql",
      name            = "custom_dt_input",
      data_type       = "{\"typeKind\":\"int64\"}"
    },
    cstbhv_repeat_caller_summary_routine = {
      routine         = "PROCEDURE",
      dataset         = "wisdb",
      language        = "SQL",
      definition_body = "procedures/cstbhv_repeat_caller_summary.sql",
      name            = "custom_dt_input",
      data_type       = "{\"typeKind\":\"int64\"}"
    },
    cstbhv_call_hour_summary_routine = {
      routine         = "PROCEDURE",
      dataset         = "wisdb",
      language        = "SQL",
      definition_body = "procedures/cstbhv_call_hour_summary.sql",
      name            = "custom_dt_input",
      data_type       = "{\"typeKind\":\"int64\"}"
    },
    cstbhv_self_service_hour_summary = {
      routine         = "PROCEDURE",
      dataset         = "wisdb",
      language        = "SQL",
      definition_body = "procedures/cstbhv_self_service_hour_summary.sql",
      name            = "custom_dt_input",
      data_type       = "{\"typeKind\":\"int64\"}"
    }
  }
}
