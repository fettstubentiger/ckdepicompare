generate_report <- function(template = "report_template.qmd",
                   file_name, 
                   df, 
                   ckdepi2009cr_egfr = "CKD-EPI 2009 Cr eGFR",
                   ckdepi2021cr_egfr = "CKD-EPI 2021 Cr eGFR",
                   ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages",
                   ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages") {
  saveRDS(df, "df.rds")
  if (!file.exists("report_template.qmd")) {
    file.copy(system.file("extdata", "report_template.qmd", package = "ckdepicompare"), getwd())
  } else {
    quarto::quarto_render(
      input = template,
      output_format = "all",
      output_file = file_name,
      execute_params = list(
        df = normalizePath("df.rds"),
        ckdepi2009cr_egfr = ckdepi2009cr_egfr,
        ckdepi2021cr_egfr = ckdepi2021cr_egfr,
        ckdepi2009cr_ckd_stages = ckdepi2009cr_ckd_stages,
        ckdepi2021cr_ckd_stages = ckdepi2021cr_ckd_stages
      )
    )  
  }
}