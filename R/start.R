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
#' @return A contract object with the term added.
#' @details If both `payment`` and `receipt` are specified,
#' only the netted amount will be captured in the event.
#' @examples
#' library(magrittr)
#'
#' contract_a <-
#'   contract() %>%
#'   term_start(as.Date("2000/01/01"))
#'
#' contract_a
#'
#' contract_a %>% schedule()
#'
#' contract() %>%
#'  term_start(as.Date("2000/02/01"), receipt = 100) %>%
#'  schedule()
#'
#' contract() %>%
#'  term_start(as.Date("2000/03/01"), payment = 50) %>%
#'  schedule()
#'
#' contract() %>%
#'  term_start(as.Date("2000/04/01"), payment = 50, receipt = 100) %>%
#'  schedule()

term_start <-
  function(contract, start_date, id = "start_date", payment = 0, receipt = 0){

    contract %>%
      add_term(
        term_start_new(
          start_date = start_date,
          id = id,
          payment = payment,
          receipt = receipt
          )
        ) %>%
      add_stipulation(start_date, "start_date")
}

term_start_new <- function(start_date, id, payment, receipt){
    make_term(
      subclass = "start",
      start_date = start_date,
      id = id,
      payment = payment,
      receipt = receipt,
      unique = T
    )
}

#' @export
schedule.term_start <- function(object, ...) {

  consideration <- object$receipt - object$payment

  tibble::tibble(
    evt_date = object$start_date,
    evt_type = object$id,
    evt_value = consideration
  )
}

print.term_start <- function(x, width = max(20, options()$width - 29), ...) {
  cat("Start date of", sep = "")
  cat(format(x$start_date, "%e %b %Y"), sep = "")
  invisible(x)
}
