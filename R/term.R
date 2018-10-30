#' Make a new term object
#'
#' The function is an overall wrapper for creating objects
#' with class of `term`. These are used as part of the
#' process of adding custom terms.
#' @param subclass A character string for the resulting class. For example,
#'   if `subclass = "blah"` the term object that is returned has class
#'   `term_blah`. Subclasses should describe the kind of term that is
#'   being created; for example, the term at the begining of the
#'   contract is called `term_start`.
#' @param ... All arguments to the term that should be returned.
#' @param .prefix Prefix to the subclass created. Defaults to
#'   `term_` which is reccomended.
#' @importFrom magrittr %>%
#' @importFrom purrr some keep
#' @keywords contract term
#' @return An contractual term with the new class.
#' @export

make_term <- function(subclass, ..., .prefix = "term_") {
  structure(list(...),
            class = c(paste0(.prefix, subclass), "term"))
}


#' Add a new term to a contract
#'
#' `add_term` adds a term to the last location in the contract.
#' The function is most useful as a wrapper for the creation of
#' custom terms (in conjuction with `make_term()`.
#'
#' @param contract A [contract()].
#' @param object A term object.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_term <- function(contract, term) {

  if(term$unique == T){
  if(has_term(contract, get_term_type(term))){
    stop("Contract can only hold 1 term of type ", get_term_type(term), call. = F)
  }}

  contract$terms[[length(contract$terms) + 1]] <- term
  contract
}


has_term <- function(contract, term_type){

  contract[["terms"]] %>%
    purrr::some(inherits, term_type)
}

get_term_type <- function(term){
  term %>%
    class() %>%
    purrr::keep(. != "term")
}
