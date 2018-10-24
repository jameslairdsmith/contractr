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
    terms = list(),
    date_terms = tibble::tibble(date_type = character(), date_value = as.Date(character()))
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

  if (length(x$clauses) > 0) {
    cat("Clauses:\n")
    for (i in seq_along(x$clauses))
      print(x$clauses[[i]], form_width = form_width)
  }
  invisible(x)
  }
