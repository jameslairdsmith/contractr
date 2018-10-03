#' @title Get the start date of a contract
#'
#' @description This function gets the start date of a contract.
#' @param df A date to start from.
#' @keywords date
#' @export

get_start_date <- function(df, alt_name = "Contract Deal Date"){
  df[[, evt_type == alt_name]]
}
