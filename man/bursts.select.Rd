% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bursts.R
\name{bursts.select}
\alias{bursts.select}
\title{From a list of bursts, extract those that interest you by passing a selecting function.}
\usage{
bursts.select(bursts, func, one_file = FALSE)
}
\arguments{
\item{bursts}{The list of all bursts}

\item{func}{A function of a segment that returns either TRUE or FALSE}

\item{one_file}{TRUE or FALSE: Return a single file to write to disk, or a list of bursts.
The one_file will return a file with all unselected bursts zeroed out.}
}
\value{
A shorter list of bursts OR if one_file is passed one segment with zeros where the other bursts might have been originally. Defaults to FALSE.
}
\description{
From a list of bursts, extract those that interest you by passing a selecting function.
}
\examples{

high_popen <- function (seg) {

    segment.popen(seg) > 0.7

}

infile <- system.file("extdata", "example_corrected.dwt", package = "scbursts")
dwells_c <- dwt.read(infile)

bursts <- bursts.defined_by_tcrit(dwells_c, 1.511842, units="s")

subset <- bursts.select(bursts, high_popen)

# To export to one .dwt file
subset_f <- bursts.select(bursts, high_popen, one_file=TRUE)

}
