#' Set the start details of a contract
#'
#' This function can be used to specify the start date of a contract.
#'
#' Note that `receipt` and `payment` cannot both be specified. If they are
#' an error will be thrown.
#'
#' @param contract The contract for which the `start date` is to be specified.
#' @param start_date The start date to be specified.
#' @param event_name An optional name for the event. Defaults to "start_date"
#' (which is reccomended).
#' @param payment The amount paid at the start of the contract.
#' Defaults to 0.
#' @param receipt The amount recieved at the start of the contract.
#' Defaults to 0.
#' @keywords contract, start, date
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
#' @importFrom rlang enexpr
#' @export
#' @return A contract object with the term added.
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
#'  term_start(as.Date("2000/01/01"), event_name = "purchase date") %>%
#'  schedule()
#'
#' contract() %>%
#'  term_start(as.Date("2000/02/01"), receipt = 1000) %>%
#'  schedule()
#'
#' contract() %>%
#'  term_start(as.Date("2000/03/01"), payment = 50) %>%
#'  schedule()

term_start <-
  function(contract, start_date, event_name = "start_date", payment = 0, receipt = 0){

    if(payment != 0 & receipt != 0){
      stop("Start date cannot have both payment and reciept.", call. = F)
    }

    output <-
      contract %>%
      add_term(
        term_start_new(
          start_date = start_date,
          event_name = event_name,
          payment = payment,
          receipt = receipt
          )
        ) %>%
      stipulate(start_date, "start_date")

    if(payment != 0){
      output %<>%
        stipulate(payment, "initial_payment")
    }

    if(receipt != 0){
      output %<>%
        stipulate(receipt, "initial_receipt")
    }

    output
}

term_start_new <- function(start_date, event_name, payment, receipt){
    make_term(
      subclass = "start",
      start_date = start_date,
      event_name = event_name,
      payment = payment,
      receipt = receipt,
      unique = T
    )
}

#' @export
schedule.term_start <- function(object, ...) {

  consideration <- object$receipt - object$payment

  tibble::tibble(
    event_date = object$start_date,
    event_type = object$event_name,
    event_value = consideration
  )
}

print.term_start <- function(x, width = max(20, options()$width - 29), ...) {
  cat("- Start date of ", sep = "")
  cat(format(x$start_date, "%e %b %Y"), sep = "")

  if(x$payment != 0){
    cat(" with payment of ")
    cat(x$payment)
  }

  if(x$receipt != 0){
    cat(" with receipt of ")
    cat(x$receipt)
  }

  invisible(x)
}
