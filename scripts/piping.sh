#!/usr/bin/env bash

LIST_OF_FILTERS=pandocfilter_graphviz.py

for filter in $LIST_OF_FILTERS
do
    >&2 echo -e "\t[FILTER] $filter"
    $filter
done

