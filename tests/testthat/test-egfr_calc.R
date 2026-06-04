set.seed(1)
df <- data.frame(
  age = as.character(c(sample(20:64, 10, TRUE), NA, 21, 54)),
  SCr = as.character(c(round(runif(10, min = 52.0, max = 114.9), 2), 60.62, NA, 98.99)),
  sex = c("male", "Female", "mAle", "feMale", "maLe", "femAle", "malE", "femaLe", "MALE", "femalE", "male", "FEMALE", NA)
)

prepared_df <- prepare_df(df, "age", "SCr", "sex", "umol/l")

eGFR <- data.frame(
   A = c(91, 67, 96, 47, 107, 52, 75, 104, 81, 110),
   B = c(93, 70, 99, 49, 111, 54, 78, 107, 85, 113)
)

test_that("`egfr_calc` creates a new column containing calculated eGFR values using the CKD-EPI 2009 Cr equation", {
df <- egfr_calc(prepared_df, "age", "SCr", "sex", "CKD-EPI 2009 Cr")
expect_equal(df$`CKD-EPI 2009 Cr eGFR`, eGFR$A)
})

test_that("`egfr_calc` creates a new column containing calculated eGFR values using the CKD-EPI 2021 Cr equation", {
  df <- egfr_calc(prepared_df, "age", "SCr", "sex", "CKD-EPI 2021 Cr")
  expect_equal(df$`CKD-EPI 2021 Cr eGFR`, eGFR$B)
})

test_that("`egfr_calc` creates two new columns containing calculated eGFR values using both the CKD-EPI 2009 Cr CKD-EPI 2021 Cr equations", {
  df <- egfr_calc(prepared_df, "age", "SCr", "sex", "Both")
  expect_equal(df$`CKD-EPI 2009 Cr eGFR`, eGFR$A)
  expect_equal(df$`CKD-EPI 2021 Cr eGFR`, eGFR$B)
})

test_that("`egfr_calc` stops when invalid input for equation is given", {
  expect_error(egfr_calc(prepared_df, "age", "SCr", "sex", "2009"), "Please input either 'CKD-EPI 2009 Cr', 'CKD-EPI 2021 Cr', or 'Both' for the equation argument.")
})

remove(df, prepared_df, eGFR)

