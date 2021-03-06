% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bursts.R
\name{bursts.remove_first_and_last}
\alias{bursts.remove_first_and_last}
\title{Remove the first and last burst from the list.}
\usage{
bursts.remove_first_and_last(bursts)
}
\arguments{
\item{bursts}{The list of all bursts}
}
\value{
A shorter list of bursts
}
\description{
Remove the first and last burst from the list.
}
\examples{

infile <- system.file("extdata", "example.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, unit="us")

bursts <- bursts.defined_by_tcrit(dwells_c, 1.511842, units="s")

# If there seem to be bad bursts at the ends
bursts <- bursts.remove_first_and_last(bursts)

}
