#' @title Overall wrapper to make new clause objects
#'
#' @description The function creates objects with class of `clause`
#' @param subclass A character string for the resulting class. For example,
#'   if `subclass = "blah"` the term object that is returned has class
#'   `clause_blah`.
#' @param ... All arguments to the operator that should be returned.
#' @param .prefix Prefix to the subclass created.
#' @importFrom magrittr %>%
#' @importFrom purrr some keep
#' @keywords contract term
#' @return An updated term with the new class.
#' @export

make_clause <- function(subclass, ..., .suffix = "_clause") {
  structure(list(...),
            class = c(paste0(subclass, .suffix), "clause"))
}


#' Add a new clause to the current contract
#'
#' `add_clause` adds a step to the last location in the recipe.
#'
#' @param contract A [contract()].
#' @param object A clause object.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_clause <- function(contract, clause) {

  if(clause$unique == T){
  if(has_clause(contract, get_clause_type(clause))){
    stop("Contract can only hold 1 clause of type ",get_clause_type(clause), call. = F)
  }}

  contract$clauses[[length(contract$clauses) + 1]] <- clause
  contract
}


has_clause <- function(contract, clause_type){

  contract[["clauses"]] %>%
    purrr::some(inherits, clause_type)
}

get_clause_type <- function(clause){
  clause %>%
    class() %>%
    purrr::keep(. != "clause")
}
