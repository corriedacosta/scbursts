% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bursts.R
\name{bursts.get_gaps}
\alias{bursts.get_gaps}
\title{Extract vector of gaps from the bursts}
\usage{
bursts.get_gaps(bursts, end_time = -1)
}
\arguments{
\item{bursts}{The list of segments}
}
\value{
A vector of N+1 gaps for N bursts times
}
\description{
This is done using the start_time attribute, which
is mostly hidden in the data.
}
\details{
(The gaps at the ends may have length 0)

================ Bursts =================

1      2     3   4   5   6   7
     |||   |||||   |   |   |   |   |
_____|||___|||||___|___|___|___|___|_____
  1      2       3   4   5   6   7    8

================= Gaps ==================
}
\examples{
\dontrun{
gaps <- bursts.get_gaps(bursts)
}
}