% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{aus_daylight_saving}
\alias{aus_daylight_saving}
\title{Australian Daylight Saving Time Historical Dates}
\format{
A data frame with four variables:
\describe{
\item{season_start}{year of the starting period of DST}
\item{state}{state the time is adjusted for}
\item{dst_start_date}{start date of DST, with the change occuring at 0200 Local Standard Time}
\item{dst_finish_date}{end date of DST, with the change from DST to standard time at 0300}
}
}
\source{
\url{http://www.bom.gov.au/climate/averages/tables/dst_times.shtml}
}
\usage{
aus_daylight_saving
}
\description{
This data shows the historical start and end time of Australian daylight saving time
dates according to the Australian Bureau of Meterology.
}
\details{
In all the cases listed, the change to Daylight Saving Time took place at
0200 Local Standard Time on the day concerned, and from Daylight Saving Time
to standard time at 0300. Data Current as of : 2017-12-12
}
\note{
The Bureau of Meteorology does not have responsibility for managing
Daylight Saving Time. This is a State responsibility and you should contact
the relevant State Government authority
\url{https://www.australia.gov.au/about-australia/facts-and-figures/time-zones-and-daylight-saving}.
}
\section{Licence and Copyright}{

Use in accordance with copyright conditions: \url{http://www.bom.gov.au/other/copyright.shtml?ref=ftr}
}

\keyword{datasets}
