#' @title Add a maturity date to a contract
#'
#' @description This function specifies the maturity date to a tidy contract.
#' @param contract A contract to which the maturity date needs to be specified.
#' @param id The maturity date
#' @keywords contract, maturity
#' @export
#' @examples
#' library(magrittr)
#'
#' make_contract() %>%
#'   add_counterparty("JP Morgan")
#'


add_maturity <- function(contract, date){

  data <- as.Date(date)

  #check_maturity(date)

  contract$terms <- contract$terms %>%  tibble::add_row(term_name = "maturity date", term_value = date)
  contract
}



#check_maturity <- function(counterparty = NULL){

#  if(!is.null(counterparty)){

#    if(!is.character(counterparty)){stop("Counterparty must be a character vector of length 1", call. = FALSE)}

#    if(is.character(counterparty) & length(counterparty) >1){stop("Counterparty must be length 1", call. = FALSE)}
#  }
#}
