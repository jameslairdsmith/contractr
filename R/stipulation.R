#' Add a stipulation to a contract
#'
#' The function allows for the adding of a stipulation
#' to the list of stipulations in a contract. This is most
#' useful when used as a wrapper together with `add_term()`
#' and `make_term()` for creating a custom term type.
#'
#' @param contract The `contract` to which the stipulation is to be added.
#' @param stipulation_value The value of the stipulation.
#' @param stipulation_name The name of the stipulation.
#' @return A updated `contract` with the new stipulation in the last slot.
#' @export

stipulate <- function(contract, stipulation_value, stipulation_name) {
  names(stipulation_value) <- stipulation_name
  contract$stipulations[[length(contract$stipulations) + 1]] <- stipulation_value
  contract
}
