#!/usr/bin/env bash

THIS_WD=$(dirname  ${BASH_SOURCE[0]})

execute() {
    >&2 echo -e "\t[FILTER] $1";
    ${THIS_WD}/$1
}

execute graphviz-filter.py     | \
execute msc-filter.py

