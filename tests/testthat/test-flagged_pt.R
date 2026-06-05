df <- data.frame(
  Patient = 1:6,
  "CKD-EPI 2009 Cr CKD Stages" = c("G1", "G2", "G3a", "G3b", "G4", "G5"),
  "CKD-EPI 2021 Cr CKD Stages" = c("G1", "G1", "G3a", "G3a", "G4", "G4"),
  check.names = FALSE
)

test_that("`flagged_pt` returns a dataset containing rows of patients which have had their CKD stages changed", {
  flagged_df <- df[c(2, 4, 6), ]
  rownames(flagged_df) <- NULL
  expect_equal(flagged_pt(df, "CKD-EPI 2009 Cr CKD Stages", "CKD-EPI 2021 Cr CKD Stages"), flagged_df)
})

test_that("`flagged_pt` prints a string to the console if there are no flagged patients", {
  output <- capture.output(flagged_pt(df, "CKD-EPI 2009 Cr CKD Stages", "CKD-EPI 2009 Cr CKD Stages" ))
  expect_equal(output, "There are no flagged patients!")
})
