ckd_stager <- function(df, eGFR) {
  colname <- paste(stringr::str_sub(eGFR, 1, 15), "CKD Stages")
  df <- df |>
    dplyr::mutate(
      {{colname}} := case_when(
        .data[[eGFR]] >= 90 ~ "G1",
        .data[[eGFR]] >= 60 & .data[[eGFR]] <= 89 ~ "G2",
        .data[[eGFR]] >= 45 & .data[[eGFR]] <= 59 ~ "G3a",
        .data[[eGFR]] >= 30 & .data[[eGFR]] <= 44 ~ "G3b",
        .data[[eGFR]] >= 15 & .data[[eGFR]] <= 29 ~ "G4",
        .data[[eGFR]] < 15 ~ "G5"
      )
    )
  return(df)
}


