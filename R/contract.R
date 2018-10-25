#' @title Create a tidy financial contract object
#'
#' @description This function creates a financial contract object to which contractual terms can be added.
#' @keywords contract
#' @importFrom tibble tibble
#' @export

make_contract <- function(){

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
#'
#' @author James Laird-Smith
#' @export

print.contract <- function(x, form_width = 30, ...) {
  cat("\nA Financial (Tidy) Contract\n\n")

  if (length(x$terms) > 0) {
    cat("Clauses:\n")
    for (i in seq_along(x$terms))
      print(x$terms[[i]], form_width = form_width)
  }
  invisible(x)
  }
