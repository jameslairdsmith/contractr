#' @title Add a start date to a contract
#'
#' @description This function specifies the start date to a tidy contract.
#' @param contract A contract for which the start date is to be specified.
#' @param date The start date
#' @keywords contract, inception
#' @export
#' @examples
#' library(magrittr)
#' library(lubridate)
#'
#' make_contract() %>%
#'   starting_from(dmy("01/01/2000"))
#'


#starting <- function(contract, date){

 # data <- as.Date(date)

#  contract$terms <- contract$terms %>%  tibble::add_row(term_name = "maturity date", term_value = date)
#  contract
#}

starting_from <- function(contract, start_date, id = "inception"){

  add_clause(
    contract,
    starting_from_clause(
      start_date = start_date,
      id = id
    )
  )
}


starting_from_clause <- function(start_date, id) {
    clause(
      subclass = "starting",
      start_date = start_date,
      id = id
    )
  }

