\name{ckd_stager}
\alias{ckd_stager}
\title{Chronic Kidney Disease Stager}
\description{
A function that assigns chronic kidney disease stages using the eGFR values
}
\usage{
ckd_stager(df, eGFR)
}
\arguments{
\item{df}{A data frame containing a eGFR column.}
\item{eGFR}{A character string of the name of the eGFR column.}
}
\value{
A modified version of the inputted data frame with additional column(s) containing the assigned chronic kidney disease stages.
}
\examples{
df <- ckd_stager(df, "CKD-EPI 2009 Cr eGFR")
df <- ckd_stager(df, "CKD-EPI 2021 Cr eGFR")
}