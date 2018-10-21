#' @title Overall wrapper to make new term objects
#'
#' @description The function creates objects with class of `term`
#' @param subclass A character string for the resulting class. For example,
#'   if `subclass = "blah"` the term object that is returned has class
#'   `term_blah`.
#' @param ... All arguments to the operator that should be returned.
#' @param .prefix Prefix to the subclass created.
#' @keywords contract term
#' @return An updated term with the new class.
#' @export

term <- function(subclass, ..., .prefix = "term_") {
  structure(list(...),
            class = c(paste0(.prefix, subclass), "term"))
}


#' Add a new term to the current contract
#'
#' `add_term` adds a step to the last location in the recipe.
#'
#' @param contract A [contract()].
#' @param object A term object.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_term <- function(contract, object) {
  contract$terms[[length(contract$terms) + 1]] <- object
  contract
}
