import pathlib

import click
from jinja2 import Environment, FileSystemLoader

from . import openapi
from . import formatter

GEM_NAME = "datadog_api_client"

MODULE_NAME = "DatadogAPIClient"


@click.command()
@click.argument(
    "specs",
    nargs=-1,
    type=click.Path(exists=True, file_okay=True, dir_okay=False, path_type=pathlib.Path),
)
@click.option(
    "-o",
    "--output",
    type=click.Path(path_type=pathlib.Path),
)
def cli(specs, output):
    """
    Generate a Ruby code snippet from OpenAPI specification.
    """
    env = Environment(loader=FileSystemLoader(str(pathlib.Path(__file__).parent / "templates")))

    env.filters["accept_headers"] = openapi.accept_headers
    env.filters["attribute_name"] = formatter.attribute_name
    env.filters["block_comment"] = formatter.block_comment
    env.filters["camel_case"] = formatter.camel_case
    env.filters["collection_format"] = openapi.collection_format
    env.filters["format_server"] = openapi.format_server
    env.filters["format_value"] = formatter.format_value
    env.filters["parameter_schema"] = openapi