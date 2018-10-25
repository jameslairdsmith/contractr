#' Add a new date term to the current contract
#'
#' `add_date_term` specifies a date term to be added to a contract.
#' This is most useful when made part of a custom clause.
#'
#' @param contract A [contract()].
#' @param date_type The type of date to be added to the contract.
#' @param date_value The date of the event.
#' @importFrom tibble add_row
#' @importFrom magrittr %>%
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_date_term <-
  function(contract, date_type, date_value) {

    contract$date_terms <-
      contract$date_terms %>%
      tibble::add_row(date_type = date_type, date_value = date_value)

    contract
}
