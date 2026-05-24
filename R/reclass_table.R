reclass_table <- function(df, ckdepi2009cr_ckdstage, ckdepi2021cr_ckdstage) {
  ckdstages <- c("G1", "G2", "G3a", "G3b", "G4", "G5")
  a <- factor(df[[ckdepi2009cr_ckdstage]], levels = ckdstages)
  b <- factor(df[[ckdepi2021cr_ckdstage]], levels = ckdstages)
  table <- table("CKD-EPI 2009 Cr" = a, "CKD-EPI 2021 Cr" = b)
  return(table)
}

