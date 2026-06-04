set.seed(1)
df <- data.frame(
  age = as.character(c(sample(20:64, 10, TRUE), NA, 21, 54)),
  SCr = as.character(c(round(runif(10, min = 52.0, max = 114.9), 2), 60.62, NA, 98.99)),
  sex = c("male", "Female", "mAle", "feMale", "maLe", "femAle", "malE", "femaLe", "MALE", "femalE", "male", "FEMALE", NA)
)

prepared_df <- prepare_df(df, "age", "SCr", "sex", "umol/l") |>
  egfr_calc("age", "SCr", "sex") |>
  ckd_stager()

test_that("`generate_report` makes a copy of the report template if it does not exist in the working directory", {
  suppressWarnings(file.remove("report_template.qmd")) 
  generate_report(
    file_name = "report",
    df = prepared_df,
    ckdepi2009cr_egfr = "CKD-EPI 2009 Cr eGFR",
    ckdepi2021cr_egfr = "CKD-EPI 2021 Cr eGFR",
    ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages",
    ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages"
    )
  expect_true(file.exists("report_template.qmd"))
})

test_that("`generate_report` outputs a parameterised report", {
  suppressWarnings(file.remove("report.html")) 
  generate_report(
    file_name = "report",
    df = prepared_df,
    ckdepi2009cr_egfr = "CKD-EPI 2009 Cr eGFR",
    ckdepi2021cr_egfr = "CKD-EPI 2021 Cr eGFR",
    ckdepi2009cr_ckd_stages = "CKD-EPI 2009 Cr CKD Stages",
    ckdepi2021cr_ckd_stages = "CKD-EPI 2021 Cr CKD Stages"
  )
  expect_true(file.exists("report.html"))
})

remove(df, prepared_df)
file.remove("df.rds", "report_template.qmd", "report.html")
