% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.R
\name{CPM}
\alias{CPM}
\title{Convert a gene expression count matrix into CPM matrix.}
\usage{
CPM(data = NULL)
}
\arguments{
\item{data}{A dataframe or matrix object.
Note: Must contain a column named "Length", "Length" means gene length.}
}
\value{
A dataframe or matrix object.
}
\description{
Convert a gene expression count matrix into CPM matrix
}
\examples{
data <- data.frame(s1 = seq(100), Length = seq(100))
res <- CPM(data)

}
