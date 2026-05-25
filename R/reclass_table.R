reclass_table <- function(df, ckdepi2009cr_ckd_stages, ckdepi2021cr_ckd_stages) {
  ckd_stages <- c("G1", "G2", "G3a", "G3b", "G4", "G5")
  a <- factor(df[[ckdepi2009cr_ckd_stages]], levels = ckd_stages)
  b <- factor(df[[ckdepi2021cr_ckd_stages]], levels = ckd_stages)
  table <- table("CKD-EPI 2009 Cr" = a, "CKD-EPI 2021 Cr" = b)
  return(table)
}

