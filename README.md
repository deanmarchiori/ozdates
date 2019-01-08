
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ozdates

[![Travis build
status](https://travis-ci.org/deanmarchiori/ozdates.svg?branch=master)](https://travis-ci.org/deanmarchiori/ozdates)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

The goal of `ozdates` is to provide historical data to help deal with
important Australian dates such as public holidays when conducting time
series modelling.

## Installation

You can install the development version of ozdates from
[Github](https://github.com/deanmarchiori/ozdates) with:

``` r
devtools::install_github("deanmarchiori/ozdates")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ozdates)
library(dplyr)
library(lubridate)

# What holidays occured in New South Wales in 2018?
nsw_hols <- aus_public_holidays %>% 
  filter(jurisdiction == "NSW",
         year(date) == "2018") %>% 
  select(date, holiday_name, jurisdiction)

nsw_hols
#> # A tibble: 12 x 3
#>    date       holiday_name     jurisdiction
#>    <date>     <chr>            <chr>       
#>  1 2018-01-01 New Year's Day   NSW         
#>  2 2018-01-26 Australia Day    NSW         
#>  3 2018-03-30 Good Friday      NSW         
#>  4 2018-03-31 Easter Saturday  NSW         
#>  5 2018-04-01 Easter Sunday    NSW         
#>  6 2018-04-02 Easter Monday    NSW         
#>  7 2018-04-25 ANZAC Day        NSW         
#>  8 2018-06-11 Queen's Birthday NSW         
#>  9 2018-08-06 Bank Holiday     NSW         
#> 10 2018-10-01 Labour Day       NSW         
#> 11 2018-12-25 Christmas Day    NSW         
#> 12 2018-12-26 Boxing Day       NSW

# Are there any public holidays in the next 2 months?
any(nsw_hols$date %within% interval(ymd("2018-04-01"), ymd("2018-05-30")))
#> [1] TRUE
```

## Source

The data on Australian public holidays were sourced from data.gov.au and
is originally based on the datasets at [Australian Public Holidays Dates
Machine Readable
Dataset](https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10).

These data are covered under the [Creative Commons Attribution 3.0
Australia](https://creativecommons.org/licenses/by/3.0/au/)

-----

Please note that the ‘ozdates’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
