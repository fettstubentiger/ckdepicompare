\name{egfr_calc}
\alias{egfr_calc}
\title{Estimated Glomerular Filtration Rate Calculator}
\description{
A function that calculates the eGFR using the CKD-EPI 2009 Creatinine (without race variable) and/or the CKD-EPI 2021 Creatinine equations.
}
\usage{
egfr_calc(df, age, SCr, sex, equation = "Both")
}
\arguments{
\item{df}{A data frame containing the age, SCr, and sex columns.}
\item{age}{A character string of the name of the age column.}
\item{SCr}{A character string of the name of the SCr column.}
\item{sex}{A character string of the name of the sex column.}
\item{equation}{A character string of the equation to be used to calculate the eGFR. Either "CKD-EPI 2009 Cr", "CKD-EPI 2021 Cr", or "Both" to calculate the eGFR using both equations.}
}
\value{
A modified version of the inputted data frame with an additional one or two more columns containing the calculated eGFR values using either one or both of the equations.
}
\examples{
df <- egfr_calc(df, "Age", "Serum Creatinine", "Gender", "CKD-EPI 2009 Cr".)
df <- egfr_calc(df, "Age", "Serum Creatinine", "Gender", "CKD-EPI 2021 Cr".)
df <- egfr_calc(df, "Age", "Serum Creatinine", "Gender", "Both".)
}