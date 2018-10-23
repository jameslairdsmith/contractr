#' @title Create a tidy financial contract object
#'
#' @description This function creates a financial contract object to which contractual terms can be added.
#' @keywords contract
#' @importFrom tibble tibble
#' @export

make_contract <- function(){

  out <- list(
    counterparty = NULL,
    clauses = list(),
    terms = tibble::tibble(term_name = character(), term_value = as.Date(character()))
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
  cat("\nA Financial (Tidy) Contract\n\n")
  cat("Counterparty: ", x$counterparty, "\n\n")
  cat("Inputs:\n\n")
  }
