#' @title Add a start date to a contract
#'
#' @description This function specifies the start date to a tidy contract.
#' @param contract A contract for which the start date is to be specified.
#' @param date The start date
#' @keywords contract, inception
#' @importFrom magrittr %>%
#' @export
#' @examples
#' library(magrittr)
#' library(lubridate)
#'
#' make_contract() %>%
#'   starting_from(dmy("01/01/2000"))
#'

starting_from <-

  function(contract, start_date, id = "start date"){
    contract %>%
      add_clause(
        starting_from_clause(start_date = start_date, id = id)
        ) %>%
      add_date_term(date_type = id, date_value = start_date) %>%
      add_term(start_date, "start date")
}

starting_from_clause <- function(start_date, id){
    make_clause(
      subclass = "starting_from",
      start_date = start_date,
      id = id,
      unique = T
    )
  }

print.starting_from_clause <- function(x, width = max(20, options()$width - 29), ...) {
  cat("Start date of ", sep = "")
  invisible(x)
}
