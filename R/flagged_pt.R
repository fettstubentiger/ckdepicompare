flagged_pt <- function(df, ckdepi2009cr_ckd_stages, ckdepi2021cr_ckd_stages) {
  if (any(df[[ckdepi2009cr_ckd_stages]] != df[[ckdepi2021cr_ckd_stages]])) {
    df <- dplyr::filter(df, {{ckdepi2009cr_ckd_stages}} != {{ckdepi2021cr_ckd_stages}})
    return(df)
  } else {
    cat("There are no flagged patients!")
  }
}
