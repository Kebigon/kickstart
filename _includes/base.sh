#!/bin/bash
set -e

{% assign files = site.static_files | where: "root", true %}
{%- for file in files -%}
  curl {{ file.path | absolute_url }} --create-dirs -o {{ file.path | remove_first: "/root" }}
{% endfor %}

{%- assign executable_files = files | where: "executable", true -%}
{%- for file in executable_files -%}
  chmod +x {{ file.path | remove_first: "/root" }}
{% endfor %}

{%- assign execute_files = executable_files | where: "execute", true -%}
{%- for file in execute_files -%}
  {{ file.path | remove_first: "/root" }}
{% endfor %}
