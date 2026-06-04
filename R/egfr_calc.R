egfr_calc <- function(df, age, SCr, sex, equation = "Both") {
  valid_equations <- c("CKD-EPI 2009 Cr", "CKD-EPI 2021 Cr", "Both")
  if (equation %in% valid_equations) {
    df <- df |>
      dplyr::mutate(
        "tmpA_2009" = ifelse(.data[[sex]] == "FEMALE", 144, 141),
        "tmpB_2009" = ifelse(.data[[sex]] == "FEMALE", 0.7, 0.9),
        "tmpC_2009" = dplyr::case_when(
          .data[[sex]] == "FEMALE" & .data[[SCr]] <= 0.7 ~ -0.329,
          .data[[sex]] == "FEMALE" & .data[[SCr]] > 0.7 ~ -1.209,
          .data[[sex]] == "MALE" & .data[[SCr]] <= 0.9 ~ -0.411,
          .data[[sex]] == "MALE" & .data[[SCr]] > 0.9 ~ -1.209,
          .default = NA),
        "tmpA_2021" = ifelse(.data[[sex]] == "FEMALE", 0.7, 0.9),
        "tmpB_2021" = dplyr::case_when(
          .data[[sex]] == "FEMALE" & .data[[SCr]] <= 0.7 ~ -0.241,
          .data[[sex]] == "FEMALE" & .data[[SCr]] > 0.7 ~ -1.2,
          .data[[sex]] == "MALE" & .data[[SCr]] <= 0.9 ~ -0.302,
          .data[[sex]] == "MALE" & .data[[SCr]] > 0.9 ~ -1.2,
          .default = NA),
        "CKD-EPI 2009 Cr eGFR" = round(.data[["tmpA_2009"]]*(.data[[SCr]]/.data[["tmpB_2009"]])^.data[["tmpC_2009"]]*0.993^.data[[age]]),
        "CKD-EPI 2021 Cr eGFR" = ifelse(
          .data[[sex]] == "FEMALE",
          round(142*(.data[[SCr]]/.data[["tmpA_2021"]])^.data[["tmpB_2021"]]*0.9938^.data[[age]]*1.012),
          round(142*(.data[[SCr]]/.data[["tmpA_2021"]])^.data[["tmpB_2021"]]*0.9938^.data[[age]])
        )
      ) |>
      dplyr::select(-starts_with("tmp"))
  } else {
    stop("Please input either 'CKD-EPI 2009 Cr', 'CKD-EPI 2021 Cr', or 'Both' for the equation argument.")
  }
  if (equation == "Both") {
    return(df)
  } else if (equation == "CKD-EPI 2009 Cr") {
    df <- dplyr::select(df, -"CKD-EPI 2021 Cr eGFR")
    return(df)
  } else if (equation == "CKD-EPI 2021 Cr") {
    df <- dplyr::select(df, -"CKD-EPI 2009 Cr eGFR")
    return(df)
  }
}

