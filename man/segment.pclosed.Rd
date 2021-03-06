% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/segment.R
\name{segment.pclosed}
\alias{segment.pclosed}
\title{Calculate empirical P(Closed) of a segment.}
\usage{
segment.pclosed(segment)
}
\arguments{
\item{segment}{The dwells and states table}
}
\value{
The ratio of closed time to total time
}
\description{
Calculate empirical P(Closed) of a segment. NOTE: Assuming that burst starts and ends with 1
}
\examples{

# It's more likely that you created states or dwells with some function
states  <-  c(0,      1,    0,    1,    0,    1,    0,    1,    0,    1)
dwells  <-  c(0.1,  1.1,  0.5,  0.2,  1.0,  1.1,  0.6,  1.1,  0.8,  1.1)
my_burst <- segment.create(states, dwells, seg=1, start_time=3.14159, name="example_segment")

# P(Closed) of this burst
segment.pclosed(my_burst)

}
