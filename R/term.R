#' Overall wrapper for adding a new term to the current contract
#'
#' `add_term` adds a term to the last location in the contract.
#'
#' @param contract A [contract()].
#' @param object A term to add to the contract.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_term <- function(contract, term, term_name) {
  names(term) <- term_name
  contract$terms[[length(contract$terms) + 1]] <- term
  contract
}
