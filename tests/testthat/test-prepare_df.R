set.seed(1)
df <- data.frame(
  age = as.character(c(sample(20:64, 10, TRUE), NA, 21, 54)),
  SCr = as.character(c(round(runif(10, min = 52.0, max = 114.9), 2), 60.62, NA, 98.99)),
  sex = c("male", "Female", "mAle", "feMale", "maLe", "femAle", "malE", "femaLe", "MALE", "femalE", "male", "FEMALE", NA)
)

prepared_df <- prepare_df(df, "age", "SCr", "sex", "umol/l")

test_that("`prepare_df` stops when wrong SCr_unit is inputted", {
  expect_error(prepare_df(prepared_df, "age", "SCr", "sex", "umol"), "Please enter either 'umol/l' or 'mg/dl' for the SCr_unit argument")
  expect_error(prepare_df(prepared_df, "age", "SCr", "sex", "mg"), "Please enter either 'umol/l' or 'mg/dl' for the SCr_unit argument")
})

test_that("`prepare_df` coerces the age column into a numeric storage mode", {
  expect_true(is.numeric(prepared_df$age))  
})

test_that("`prepare_df` coerces the SCr column into a numeric storage mode", {
  expect_true(is.numeric(prepared_df$SCr))
})

test_that("`prepare_df` capitalises the characters of the strings within the sex column", {
  expect_true(all(prepared_df$sex == toupper(prepared_df$sex)))
})

test_that("`prepare_df` filters out rows without NA or Inf values", {
  expect_true(all(is.finite(prepared_df$age)))
  expect_true(all(is.finite(prepared_df$SCr)))
  expect_true(all(!is.na(prepared_df$age)))
  expect_true(all(!is.na(prepared_df$SCr)))
  expect_true(all(!is.na(prepared_df$sex)))
})

test_that("`prepare_df` converts the SCr from umol/l to mg/dl", {
  df$SCr <- as.numeric(df$SCr)
  df <- subset(df, !is.na(age) & !is.na(SCr) & !is.na(sex))
  expect_equal(prepared_df$SCr, df$SCr / 88.42)
})

test_that("`prepare_df` does not convert the SCr if SCr unit is mg/dl", {
  df$SCr <- as.numeric(df$SCr)
  df <- subset(df, !is.na(age) & !is.na(SCr) & !is.na(sex))
  prepared_df <- prepare_df(df, "age", "SCr", "sex", "mg/dl")
  expect_equal(prepared_df$SCr, df$SCr)
})

remove(df, prepared_df)