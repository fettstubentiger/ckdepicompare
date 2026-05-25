\name{prepare_df}
\alias{prepare_df}
\title{Prepare Data Frame}
\description{
A function that prepares a data frame for analysis.
}
\usage{
prepare_df(df, age, SCr, sex, SCr_unit)
}
\arguments{
\item{df}{A data frame containing the age, SCr, and sex columns.}
\item{age}{A character string of the name of the age column.}
\item{SCr}{A character string of the name of the SCr column.}
\item{sex}{A character string of the name of the sex column.}
\item{SCr_unit}{A character string of the unit the SCr value is stored in. Either "umol/l" or "mg/dl"}
}
\value{
A clean and prepared version of the inputted data frame with the age, SCr, and sex columns coerced into the necessary storage mode required for analysis, free from any special values (NA, Inf). The units of the measurements in the SCr columns are also converted into mg/dl.  
}
\examples{
df <- prepare_df(df, "Age", "Serum Creatinine", "Gender", "umol/l")
}