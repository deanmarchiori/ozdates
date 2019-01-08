#' Australian Public Holidays
#'
#' The dataset is an aggregate of published public holiday data on data.gov.au from 2014-2019.
#'
#' This data was collected from the Australian Public Holidays page on australia.gov.au. It is republished in a machine-readable
#' format on data.gov.au. The dataset is an aggregate of published public holiday data on data.gov.au from 2014-2019. This data is correct at the time of publishing but is subject to change.
#'
#'
#' @format A data frame with five variables:
#' \describe{
#' \item{date}{public holiday date}
#' \item{holiday_name}{public holiday description}
#' \item{information}{description of the public holiday}
#' \item{more_information}{usually a link to further information or source}
#' \item{jurisdiction}{the state in which the holiday applies}
#' }
#' @source \url{https://data.gov.au/dataset/b1bc6077-dadd-4f61-9f8c-002ab2cdff10}
#'
#' @usage The use of this data must comply with Creative Commons Attribution 3.0 Australia: \url{https://creativecommons.org/licenses/by/3.0/au/}
#'
"aus_public_holidays"

#' Australian Daylight Saving Time Dates
#'
#' This data shows the historical start and end time of Australian daylight saving time
#' dates according to the Australian Bureau of Meterology.
#'
#' In all the cases listed, the change to Daylight Saving Time took place at
#' 0200 Local Standard Time on the day concerned, and from Daylight Saving Time
#' to standard time at 0300. Data Current as of : 2017-12-12
#'
#' @format A data frame with four variables:
#' \describe{
#' \item{season_start}{year of the starting period of DST}
#' \item{state}{state the time is adjusted for}
#' \item{dst_start_date}{start date of DST, with the change occuring at 0200 Local Standard Time}
#' \item{dst_finish_time}{end date of DST, with the change from DST to standard time at 0300}
#' }
#'
#' @source \url{http://www.bom.gov.au/climate/averages/tables/dst_times.shtml}
#'
#' @note The Bureau of Meteorology does not have responsibility for managing
#' Daylight Saving Time. This is a State responsibility and you should contact
#' the relevant State Government authority
#' \url{https://www.australia.gov.au/about-australia/facts-and-figures/time-zones-and-daylight-saving}.
#'
#' @usage Use in accordance with copyright conditions: \url{http://www.bom.gov.au/other/copyright.shtml?ref=ftr}
#'
"aus_daylight_saving"
