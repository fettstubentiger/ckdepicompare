set.seed(1)
df <- data.frame(
  age = as.character(c(sample(20:64, 10, TRUE), NA, 21, 54)),
  SCr = as.character(c(round(runif(10, min = 52.0, max = 114.9), 2), 60.62, NA, 98.99)),
  sex = c("male", "Female", "mAle", "feMale", "maLe", "femAle", "malE", "femaLe", "MALE", "femalE", "male", "FEMALE", NA)
)

prepared_df <- prepare_df(df, "age", "SCr", "sex", "umol/l") |>
  egfr_calc("age", "SCr", "sex")

CKD_Stages <- data.frame(
  A = c("G1", "G2", "G1", "G3a", "G1", "G3a", "G2", "G1", "G2", "G1"),
  B = c("G1", "G2", "G1", "G3a", "G1", "G3a", "G2", "G1", "G2", "G1")
)

test_that("`ckd_stager` returns a column containing correctly assigned CKD stages using eGFR values within the inputted column", {
  df <- ckd_stager(prepared_df, "CKD-EPI 2009 Cr eGFR")
  expect_equal(df$`CKD-EPI 2009 Cr CKD Stages`, CKD_Stages$A)
  df <- ckd_stager(prepared_df, "CKD-EPI 2021 Cr eGFR")
  expect_equal(df$`CKD-EPI 2021 Cr CKD Stages`, CKD_Stages$B)
})

test_that("`ckd_stager` returns multiple columns containing correctly assigned CKD stages using eGFR values within multiple columns", {
  egfr_columns <- c("CKD-EPI 2009 Cr eGFR", "CKD-EPI 2021 Cr eGFR")
  df <- ckd_stager(prepared_df, egfr_columns)
  expect_equal(df$`CKD-EPI 2009 Cr CKD Stages`, CKD_Stages$A)
  expect_equal(df$`CKD-EPI 2021 Cr CKD Stages`, CKD_Stages$B)
})
