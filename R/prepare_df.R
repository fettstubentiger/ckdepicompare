prepare_df <- function(df, age, SCr, sex, SCr_unit) {
  valid_SCr_units <- c("umol/l", "mg/dl")
  if (SCr_unit %in% valid_SCr_units) {
    df <- df |>
      dplyr::mutate(
        {{age}} := as.numeric(.data[[age]]),
        {{SCr}} := as.numeric(.data[[SCr]]),
        {{sex}} := stringr::str_to_upper(.data[[sex]])) |>
      dplyr::filter(
        !is.na(.data[[age]]),
        !is.na(.data[[SCr]]),
        .data[[sex]] %in% c("FEMALE", "MALE"))
  } else {
    stop("Please enter either 'umol/l' or 'mg/dl' for the SCr_unit argument")
  }
  if (SCr_unit == "umol/l") {
    df <- dplyr::mutate(df, {{SCr}} := .data[[SCr]]/88.42)
    return(df) 
  } else {
    return(df)
  }
}