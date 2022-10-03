# Create Bigquery datasets
resource "google_bigquery_dataset" "dataset" {
  for_each    = toset(var.datasets)
  dataset_id  = each.key
  description = "This dataset contain wsidb data"
  project     = var.project_id
}


#***************BHV_Proces Extranl tables*****************************

# Create Bigquery tables
resource "google_bigquery_table" "partitioned_bq_external_tables" {
  for_each   = var.partitioned_bq_external_tables
  table_id   = each.key
  dataset_id = google_bigquery_dataset.dataset[each.value.dataset].dataset_id
  project    = var.project_id
  external_data_configuration {
    autodetect            = false
    ignore_unknown_values = true
    schema                = file(each.value.schema_path)
    source_format         = "PARQUET"
    source_uris           = each.value.source_uris
    hive_partitioning_options {
      mode                     = "CUSTOM"
      source_uri_prefix        = each.value.source_uri_prefix
      require_partition_filter = true
    }
  }
  deletion_protection = false
}

# #***************BHV_Proces Native tables*****************************

# Create Bigquery tables
resource "google_bigquery_table" "partitioned_bq_native_tables" {
  for_each   = var.partitioned_bq_native_tables
  table_id   = each.key
  dataset_id = google_bigquery_dataset.dataset[each.value.dataset].dataset_id
  project    = var.project_id

  time_partitioning {
    type                     = each.value.partition_type
    field                    = each.value.partition_field
    require_partition_filter = each.value.partition_filter
  }
  schema              = file(each.value.schema_path)
  deletion_protection = false
}


# Create stored procedure in BigQuery 
resource "google_bigquery_routine" "partitioned_bq_native_tables_routine" {
  for_each        = var.partitioned_bq_native_tables_routine
  dataset_id      = google_bigquery_dataset.dataset[each.value.dataset].dataset_id
  routine_id      = each.key
  project         = var.project_id
  routine_type    = each.value.routine
  language        = each.value.language
  definition_body = file(each.value.definition_body)
  arguments {
    name      = each.value.name
    data_type = each.value.data_type
  }
}

# *************** client static table **********************

# Create Bigquery tables client static table
resource "google_bigquery_table" "client" {
  table_id   = "client"
  dataset_id = google_bigquery_dataset.dataset["wisdb"].dataset_id
  project    = var.project_id

  schema              = file("schema/client.json")
  deletion_protection = false
}

resource "google_bigquery_job" "client_data" {
  job_id = "wisdb_client_data"

  labels = {
    "my_job" = "load"
  }

  load {
    source_uris = [
      "gs://htg-wisdb/client/v1/demobackup_client"
    ]
    destination_table {
      project_id = google_bigquery_table.client.project
      dataset_id = google_bigquery_dataset.dataset["wisdb"].dataset_id
      table_id   = google_bigquery_table.client.table_id
    }

    skip_leading_rows = 1

    write_disposition = "WRITE_APPEND"
    autodetect        = false
  }
}