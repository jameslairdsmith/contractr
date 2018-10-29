#' @title Set the start date of a contract
#'
#' @description This function can be used to specify the start date of a contract.
#' @param contract The contract for which the start date is to be specified.
#' @param start_date The start date to be specified.
#' @param id An optional name for the event. Defaults to "start_date"
#' (which is reccomended).
#' @param payment The amount paid at the start of the contract.
#' Defaults to zero.
#' @param receipt The amount recieved at the start of the contract.
#' Defaults to zero.
#' @keywords contract, start, date
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
#' @export
#' @examples
#' library(magrittr)
#'
#' a_contract <-
#'   contract() %>%
#'   term_start(as.Date("2000/01/01"))
#'
#' a_contract
#'
#' a_contract %>% schedule()

term_start <-
  function(contract, start_date, id = "start_date"){
    contract %>%
      add_term(
        term_start_new(start_date = start_date, id = id)
        ) %>%
      add_stipulation(start_date, "start_date")
}

term_start_new <- function(start_date, id){
    make_term(
      subclass = "start",
      start_date = start_date,
      id = id,
      unique = T
    )
}

#' @export
schedule.term_start <- function(object, ...) {

  tibble::tibble(
    evt_date = object$start_date,
    evt_type = object$id,
    evt_value = 0
  )
}

print.term_start <- function(x, width = max(20, options()$width - 29), ...) {
  cat("Start date of", sep = "")
  cat(format(x$start_date, "%e %b %Y"), sep = "")
  invisible(x)
}
