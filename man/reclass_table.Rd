\name{reclass_table}
\alias{reclass_table}
\title{Reclassification Table}
\description{
A function that creates a table object of a CKD-EPI 2009 Creatinine equation (without race variable) chronic kidney disease to CKD-EPI 2021 Creatinine equation chronic kidney disease reclassification table.
}
\usage{
reclass_table(ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages", ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages")
}
\arguments{
\item{df}{A data frame containing both the CKD-EPI 2009 Cr CKD Stages and CKD-EPI 2021 Cr CKD Stages columns.}
\item{ckdepi2009cr_ckd_stages}{A character string of the name of the CKD-EPI 2009 Cr CKD Stages.}
\item{ckdepi2021cr_ckd_stages}{A character string of the name of the CKD-EPI 2021 Cr CKD Stages.}
}
\value{
A table object containing a reclassification table showing the shift of chronic kidney disease stages from the CKD-EPI 2009 Creatinine equation (without race variable) to the CKD-EPI 2021 Creatinine equation.
}
\examples{
tbl <- reclass_table(df, "CKD-EPI 2009 Cr CKD Stages", "CKD-EPI 2021 Cr CKD Stages")
}