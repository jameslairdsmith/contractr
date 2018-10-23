#' @title Add a counterparty to a contract
#'
#' @description This function adds a counterparty to a tidy contract.
#' @param contract A contract to which the counterparty needs to be specified.
#' @param id The name or id of the counterparty.
#' @keywords contract, counterparty
#' @export
#' @examples
#' library(magrittr)
#'
#' make_contract() %>%
#'   add_counterparty("JP Morgan")
#'


add_counterparty <- function(contract, id){

  check_counterparty(id)

  contract$counterparty <- id
  contract
}



check_counterparty <- function(counterparty = NULL){

  if(!is.null(counterparty)){

    if(!is.character(counterparty)){stop("Counterparty must be a character vector of length 1", call. = FALSE)}

    if(is.character(counterparty) & length(counterparty) >1){stop("Counterparty must be length 1", call. = FALSE)}
  }
}
