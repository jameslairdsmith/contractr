#' @title Add a counterparty to a contract.
#'
#' @description This function adds a counterparty to a tidy contract.
#' @param contract A contract to which the counterparty needs to be specified.
#' @param counterparty_id The name or id of the counterparty.
#' @keywords contract, counterparty
#' @export



with_counterparty <- function(contract, counterparty_id){
  contract$counterparty <- counterparty_id
  contract
}


#' @rdname with_counterparty

check_counterparty <- function(counterparty){

  if(!is.na(counterparty)){

    if(!is.character(counterparty)){stop("Counterparty must either be NULL or a character vector of length 1", call. = FALSE)}

    if(is.character(counterparty) & length(counterparty) >1){stop("Counterparty must be length 1", call. = FALSE)}
  }
}
