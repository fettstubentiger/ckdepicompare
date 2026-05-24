prepare_df <- function(df, age, SCr, sex, eGFR, SCr_unit) {
  df <- df |>
    dplyr::mutate(
      {{age}} := as.numeric(.data[[age]]),
      {{SCr}} := as.numeric(.data[[SCr]]),
      {{sex}} := str_to_upper(.data[[sex]]),
      {{eGFR}} := as.numeric(.data[[eGFR]])) |>
    dplyr::filter(
      !is.na(.data[[age]]), !is.infinite(.data[[age]]),
      !is.na(.data[[SCr]]), !is.infinite(.data[[SCr]]),
      .data[[sex]] %in% c("FEMALE", "MALE"),
      !is.na(.data[[eGFR]]), !is.infinite(.data[[eGFR]]))
  if (SCr_unit == "umol/l") {
      df <- dplyr::mutate(df, {{SCr}} := .data[[SCr]]/88.42)
  }
  return(df)
}
