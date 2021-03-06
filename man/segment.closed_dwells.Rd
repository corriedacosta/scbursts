% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/segment.R
\name{segment.closed_dwells}
\alias{segment.closed_dwells}
\title{Extract closed dwells.}
\usage{
segment.closed_dwells(segment)
}
\arguments{
\item{segment}{the segment object}
}
\value{
the closed dwells
}
\description{
Extract closed dwells.
}
\examples{

# It's more likely that you created states or dwells with some function
states  <-  c(0,      1,    0,    1,    0,    1,    0,    1,    0,    1)
dwells  <-  c(0.1,  1.1,  0.5,  0.2,  1.0,  1.1,  0.6,  1.1,  0.8,  1.1)
my_burst <- segment.create(states, dwells, seg=1, start_time=3.14159, name="example_segment")

closed_dwells <- segment.closed_dwells(my_burst)
head(closed_dwells)

}
