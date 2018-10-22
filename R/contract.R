#' @title Create a tidy financial contract object
#'
#' @description This function creates a financial contract object to which contractual terms can be added.
#' @param counterparty the party with whome the contract is made. Defaults to NULL.
#' @keywords contract
#' @export

contract <- function(counterparty = NULL){

  check_counterparty(counterparty)

  out <- list(
    counterparty = counterparty,
    terms = list(),
    steps = list()
  )
  class(out) <- "contract"
  out
}


#' Print a Contract
#'
#' @aliases print.contract
#' @param x A `contract` object
#' @param form_width The number of characters used to print
#' @param ... further arguments passed to or from other methods.
#' @return The original object (invisibly)
#'
#' @author James Laird-Smith
#' @export

print.contract <- function(x, form_width = 30, ...) {
  cat("Financial contract\n\n")
  cat("Inputs:\n\n")
  }
