#' @title Create a financial contract
#'
#' @description This function creates a financial contract object
#' to which contractual terms can then be added. There are no terms
#' or stipulations attached to the contract when it is first created.
#' @keywords contract
#' @importFrom tibble tibble
#' @export
#' @return A contract object.
#' @examples
#' library(magrittr)
#'
#' contract_a <- contract()
#'
#' contract_a
#'
#' contract_a %>%
#'   term_start(as.Date("2000/01/01"))

contract <- function(){
  out <- list(
    terms = list(),
    stipulations = list()
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

print.contract <- function(x, form_width = 30, ...) {
  cat("A Financial Contract\n\n")

  if (length(x$terms) > 0) {
    cat("Terms:\n")
    for (i in seq_along(x$terms)){
      print(x$terms[[i]], form_width = form_width)
      cat("\n")}
  }
  invisible(x)
  }
