egfr_calc <- function(df, age, SCr, sex, equation) {
  if (equation == "CKD-EPI 2009 Cr") {
    df <- df |>
      dplyr::mutate(
        "tmpA" = ifelse(.data[[sex]] == "FEMALE", 144, 141),
        "tmpB" = ifelse(.data[[sex]] == "FEMALE", 0.7, 0.9),
        "tmpC" = dplyr::case_when(
          .data[[sex]] == "FEMALE" & .data[[SCr]] <= 0.7 ~ -0.329,
          .data[[sex]] == "FEMALE" & .data[[SCr]] > 0.7 ~ -1.209,
          .data[[sex]] == "MALE" & .data[[SCr]] <= 0.9 ~ -0.411,
          .data[[sex]] == "MALE" & .data[[SCr]] > 0.9 ~ -1.209,
          .default = NA),
        "CKD-EPI 2009 Cr eGFR" = round(.data[["tmpA"]]*(.data[[SCr]]/.data[["tmpB"]])^.data[["tmpC"]]*0.993^.data[[age]])
      ) |>
      dplyr::select(-starts_with("tmp"))
  } else if (equation == "CKD-EPI 2021 Cr") {
    df <- df |>
      dplyr::mutate(
        "tmpA" = ifelse(.data[[sex]] == "FEMALE", 0.7, 0.9),
        "tmpB" = dplyr::case_when(
          .data[[sex]] == "FEMALE" & .data[[SCr]] <= 0.7 ~ -0.241,
          .data[[sex]] == "FEMALE" & .data[[SCr]] > 0.7 ~ -1.2,
          .data[[sex]] == "MALE" & .data[[SCr]] <= 0.9 ~ -0.302,
          .data[[sex]] == "MALE" & .data[[SCr]] > 0.9 ~ -1.2,
          .default = NA),
        "CKD-EPI 2021 Cr eGFR" = ifelse(
          .data[[sex]] == "FEMALE",
          round(142*(.data[[SCr]]/.data[["tmpA"]])^.data[["tmpB"]]*0.9938^.data[[age]]*1.012),
          round(142*(.data[[SCr]]/.data[["tmpA"]])^.data[["tmpB"]]*0.9938^.data[[age]])
        )
      ) |>
      dplyr::select(-starts_with("tmp"))
  } else {
    cat("Please input either 'CKD-EPI 2009 Cr' or 'CKD-EPI 2021 Cr'")
  }
  return(df)
}

