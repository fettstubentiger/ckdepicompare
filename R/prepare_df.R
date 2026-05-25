prepare_df <- function(df, age, SCr, sex, SCr_unit) {
  if (SCr_unit == "umol/l") {
    df <- dplyr::mutate(df, {{SCr}} := .data[[SCr]]/88.42)
  } else if (SCr_unit == "mg/dl") {
  } else {
    stop("Please enter either 'umol/l' or 'mg/dl' for the SCr_unit argument")
  }
  df <- df |>
    dplyr::mutate(
      {{age}} := as.numeric(.data[[age]]),
      {{SCr}} := as.numeric(.data[[SCr]]),
      {{sex}} := str_to_upper(.data[[sex]])) |>
    dplyr::filter(
      !is.na(.data[[age]]), !is.infinite(.data[[age]]),
      !is.na(.data[[SCr]]), !is.infinite(.data[[SCr]]),
      .data[[sex]] %in% c("FEMALE", "MALE"))
  return(df)
}
