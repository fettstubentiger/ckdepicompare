report <- function(input_file = "report_template.qmd",
                   output_file, 
                   df, 
                   ckdepi2009cr_egfr = "CKD-EPI 2009 Cr eGFR",
                   ckdepi2021cr_egfr = "CKD-EPI 2021 Cr eGFR",
                   ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages",
                   ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages") {
  
  if (!file.exists("report_template.qmd")) {
    file.copy(system.file("extdata", "report_template.qmd", package = "ckdepicompare"), getwd())
  }
  
  quarto::quarto_render(
    input = input_file,
    output_format = "all",
    output_file = output_file,
    execute_params = list(
      df = normalizePath(df),
      ckdepi2009cr_egfr = ckdepi2009cr_egfr,
      ckdepi2021cr_egfr = ckdepi2021cr_egfr,
      ckdepi2009cr_ckd_stages = ckdepi2009cr_ckd_stages,
      ckdepi2021cr_ckd_stages = ckdepi2021cr_ckd_stages
    )
  )
}