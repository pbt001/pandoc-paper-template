---
title: A Pandoc Markdown Paper Example
author:
  - name: Firstname Lastname
    affiliation: Some University
    email: fname.lname@some.university.noedu
date: January 2016
listings: true
codeBlockCaptions: true
figureTitle: "Figure"
tableTitle: "Table"
listingTitle: "Listing"
titleDelimiter: ":"
figPrefix:
  - "Figure"
  - "Figures"
eqnPrefix:
  - "Equation"
  - "Equations"
tblPrefix:
  - "Table"
  - "Tables"
lstPrefix:
  - "Listing"
  - "Listings"
secPrefix:
  - "Section"
  - "Sections"
chapDelim: "."
rangeDelim: "-"
loftitle: "# List of Figures"
lotTitle: "# List of Tables"
lolTitle: "# List of Listings"
...

# Examples

Here go some \Gls{Example}, so we can see what this compiles to. This example is
taken from [see @examplebibentry, page 15 ff.].

## List examples

* fruits
    + apples
        - macintosh
        - red delicious
    + pears
    + peaches
* vegetables
    + broccoli
    + chard

### Ordered Lists

1.  one
2.  two
3.  three

### Definition lists

Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

## Quote examples

Well

> Someone said something some time ago

Not sure where this came from.

## Formula examples

Here go $n + 1$ formulas:

$\sum_{\substack{i=0 \\ \text{ \( i \) gerade} } } ^{\infty} a_{i}$
