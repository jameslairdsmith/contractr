#' @title Overall wrapper to make new clause objects
#'
#' @description The function creates objects with class of `clause`
#' @param subclass A character string for the resulting class. For example,
#'   if `subclass = "blah"` the term object that is returned has class
#'   `clause_blah`.
#' @param ... All arguments to the operator that should be returned.
#' @param .prefix Prefix to the subclass created.
#' @keywords contract term
#' @return An updated term with the new class.
#' @export

clause <- function(subclass, ..., .prefix = "clause_") {
  structure(list(...),
            class = c(paste0(.prefix, subclass), "clause"))
}


#' Add a new clause to the current contract
#'
#' `add_clause` adds a step to the last location in the recipe.
#'
#' @param contract A [contract()].
#' @param object A clause object.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_clause <- function(contract, object) {
  contract$clause[[length(contract$clause) + 1]] <- object
  contract
}
