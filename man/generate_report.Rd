\name{generate_report}
\alias{generate_report}
\title{Generate Report}
\description{
A function that generates a html report comparing the CKD-EPI 2009 Creatinine (without race variable) equation and CKD-EPI 2021 Creatinine equation.
}
\usage{
generate_report(
  template = "report_template.qmd", 
  file_name, 
  df, 
  ckdepi2009cr_egfr = "CKD-EPI 2009 Cr eGFR",
  ckdepi2021cr_egfr = "CKD-EPI 2021 Cr eGFR",
  ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages",
  ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages"
)
}
\arguments{
\item{template}{A character string of the name or path towards the template Quarto document.}
\item{file_name}{A character string of the preferred name of output file.}
\item{df}{A data frame containing the CKD-EPI 2009 Creatinine eGFR, CKD-EPI 2021 Creatinine eGFR, CKD-EPI 2009 Creatinine CKD Stages, and CKD-EPI 2021 Creatinine CKD Stages columns.}
\item{ckdepi2009cr_egfr}{A character string of the name of the CKD-EPI 2009 Creatinine eGFR column.}
\item{ckdepi2021cr_egfr}{A character string of the name of the CKD-EPI 2021 Creatinine eGFR column.}
\item{ckdepi2009cr_ckd_stages}{A character string of the name of the CKD-EPI 2009 Creatinine CKD Stages column.}
\item{ckdepi2021cr_ckd_stages}{A character string of the name of the CKD-EPI 2021 Creatinine CKD Stages column.}
}
\value{
A html report comparing the CKD-EPI 2009 Creatinine (without race variable) and CKD-EPI 2021 Creatinine equations. The report contains a Bland-Altman plot and a reclassification table.
}
\examples{
generate_report(file_name = "sample_report", df = df)
generate_report("personal_template.qmd", "sample_report", df, "2009 eGFR", "2021 eGFR", "2009 CKD Stages", "2021 CKD Stages")
}