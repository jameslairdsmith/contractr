#' Set the end details of a contract
#'
#' This function can be used to specify the end date of a contract.
#'
#' Note that `receipt` and `payment` cannot both be specified. If they are
#' an error will be thrown.
#'
#' @param contract The contract for which the `end date` is to be specified.
#' @param end_date The end date to be specified.
#' @param event_name An optional name for the event. Defaults to "end_date"
#' (which is reccomended).
#' @param payment The amount paid at the end of the contract.
#' Defaults to 0.
#' @param receipt The amount recieved at the end of the contract.
#' Defaults to 0.
#' @keywords contract, end, date
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
#'   term_end(as.Date("2000/01/01"))
#'
#' contract_a
#'
#' contract_a %>% schedule()
#'
#' contract() %>%
#'  term_end(as.Date("2000/01/01"), event_name = "sale date") %>%
#'  schedule()
#'
#' contract() %>%
#'  term_end(as.Date("2000/02/01"), receipt = 1000) %>%
#'  schedule()
#'
#' contract() %>%
#'  term_end(as.Date("2000/03/01"), payment = 50) %>%
#'  schedule()

term_end <-
  function(contract, end_date, event_name = "end_date", payment = 0, receipt = 0){

    if(payment != 0 & receipt != 0){
      stop("End date cannot have both payment and reciept.", call. = F)
    }

    output <-
      contract %>%
      add_term(
        term_end_new(
          end_date = end_date,
          event_name = event_name,
          payment = payment,
          receipt = receipt
          )
        ) %>%
      stipulate(end_date, "end_date")

    if(payment != 0){
      output %<>%
        stipulate(payment, "final_payment")
    }

    if(receipt != 0){
      output %<>%
        stipulate(receipt, "final_receipt")
    }

    output
}

term_end_new <- function(end_date, event_name, payment, receipt){
    make_term(
      subclass = "end",
      end_date = end_date,
      event_name = event_name,
      payment = payment,
      receipt = receipt,
      unique = T
    )
}

#' @export
schedule.term_end <- function(object, ...) {

  consideration <- object$receipt - object$payment

  tibble::tibble(
    event_date = object$end_date,
    event_type = object$event_name,
    event_value = consideration
  )
}

print.term_end <- function(x, width = max(20, options()$width - 29), ...) {
  cat("- End date of ", sep = "")
  cat(format(x$end_date, "%e %b %Y"), sep = "")

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
