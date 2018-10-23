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
#' con <-
#'   make_contract() %>%
#'   add_counterparty("JP Morgan")
#'
#' con
#'
#' has_counterparty(con)
#'
#' get_counterparty(con)


add_counterparty <- function(contract, id){

  check_counterparty_id(id)

  contract$counterparty <- id
  contract
}

#' @rdname add_counterparty

has_counterparty <- function(contract){
  !is.null(contract$counterparty)
}

#' @rdname add_counterparty

get_counterparty <- function(contract){
  if(!has_counterparty(contract)){
    stop("Contract has no counterparty specified", call. = FALSE)
  } else {
    contract$counterparty
  }
}


check_counterparty_id <- function(counterparty){

  if(!is.null(counterparty)){

    if(!is.character(counterparty)){stop("Counterparty must be a character vector of length 1", call. = FALSE)}

    if(is.character(counterparty) & length(counterparty) >1){stop("Counterparty must be length 1", call. = FALSE)}
  }
}
