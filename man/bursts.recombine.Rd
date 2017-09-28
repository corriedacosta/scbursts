% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bursts.R
\name{bursts.recombine}
\alias{bursts.recombine}
\title{From a list of segments, return the concatenated 
segment containing all bursts.}
\usage{
bursts.recombine(bursts)
}
\arguments{
\item{bursts}{The list of all bursts}
}
\value{
The segment containing all bursts.
}
\description{
Inverse of functions like bursts.defined_by_tcrit
}
\examples{
\dontrun{

record <- bursts.recombine(bursts)

}
}