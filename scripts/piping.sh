#!/usr/bin/env bash

LIST_OF_FILTERS=$(dirname ${BASH_SOURCE[0]})/graphviz-filter.py \
                $(dirname ${BASH_SOURCE[0]})/msc-filter.py

for filter in $LIST_OF_FILTERS
do
    >&2 echo -e "\t[FILTER] $filter"
    $filter
done

