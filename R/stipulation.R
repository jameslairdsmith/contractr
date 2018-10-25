#' Overall wrapper for adding a new term to the current contract
#'
#' `add_stipulation` adds a term to the last location in the contract.
#'
#' @param contract A [contract()].
#' @param object A stipulation to add to the contract.
#' @return A updated [contract()] with the new term in the last slot.
#' @export

add_stipulation <- function(contract, stipulation, stipulation_name) {
  names(stipulation) <- stipulation_name
  contract$stipulations[[length(contract$stipulations) + 1]] <- stipulation
  contract
}
