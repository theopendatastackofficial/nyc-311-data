# pipeline/assets/ingestion/mta_assets.py

import os
import gc
import requests
import polars as pl
from datetime import datetime

# Replace MaterializeResult with Output
from dagster import asset, Output, MetadataValue

@asset(
    name="nyc_threeoneone_requests",
    io_manager_key="fastopendata_partitioned_parquet_io_manager",
    group_name="311",
    tags={"domain": "311", "type": "ingestion", "source": "fastopendata"},
    metadata={
        "data_url": MetadataValue.url("https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2010-to-Present/erm2-nwe9/about_data")
    }
)
def nyc_threeoneone_requests():
    """
    Asset that wants data from March 2022 to December 2024, for example.
    Instead of returning a Polars DataFrame, we return a dict with the
    start/end that the IO manager can use to fetch data from R2.
    """
    return {
        "start_year": 2010,
        "start_month": 1,
        "end_year": 2025,
        "end_month": 1
    }
