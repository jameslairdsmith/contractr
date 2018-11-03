#' Create a series of payments or reciepts
#'
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


term_series <-
  function(contract, freq, from, to, amount, event_name = "series", ...){

    output <-
      contract %>%
      add_term(
        term_series_new(
          freq = freq,
          from = from,
          to = to,
          amount = amount,
          event_name = event_name,
          ...
        )
      )

    output
  }

term_series_new <- function(freq, from, to, amount, event_name, ...){
  make_term(
    subclass = "series",
    freq = freq,
    from = from,
    to = to,
    amount = amount,
    event_name = event_name,
    unique = F,
    ...
  )
}

#' @export
schedule.term_series <- function(object, ...) {

  #make_partial_date_seq <- function(...){make_date_seq(...)}

  if(has_element_named(object, "include_first")){
    make_partial_date_seq <- purrr::partial(make_date_seq, include_first = object$include_first, .lazy = F)
  }

  if(has_element_named(object, "include_last")){
    make_partial_date_seq <- purrr::partial(make_date_seq, include_last = object$include_last, .lazy = F)
  }

  dates <- make_partial_date_seq(object$from,
                                 object$to,
                                 object$freq)

  amounts <- object$amount

  tibble::tibble(
    event_date = dates,
    event_type = object$event_name,
    event_value = amounts
  )
}

print.term_series <- function(x, width = max(20, options()$width - 29), ...) {
  cat("- Series of amounts ", sep = "")
  #cat(format(x$start_date, "%e %b %Y"), sep = "")

  #if(x$payment != 0){
  #  cat(" with payment of ")
  #  cat(x$payment)
  #}

  #if(x$receipt != 0){
  #  cat(" with receipt of ")
  #  cat(x$receipt)
  #}

  invisible(x)
}
