set.seed(1)
df <- data.frame(
  age = as.character(c(sample(20:64, 10, TRUE), NA, 21, 54)),
  SCr = as.character(c(round(runif(10, min = 52.0, max = 114.9), 2), 60.62, NA, 98.99)),
  sex = c("male", "Female", "mAle", "feMale", "maLe", "femAle", "malE", "femaLe", "MALE", "femalE", "male", "FEMALE", NA)
)

prepared_df <- prepare_df(df, "age", "SCr", "sex", "umol/l") |>
  egfr_calc("age", "SCr", "sex") |>
  ckd_stager()

test_that("`reclass_table` returns a table object using the inputted columns", {
  tbl <- reclass_table(prepared_df, "CKD-EPI 2009 Cr CKD Stages", "CKD-EPI 2021 Cr CKD Stages")
  expect_true(is.table(tbl))  
})

remove(df, prepared_df)
