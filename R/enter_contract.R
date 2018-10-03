#' @title Create a contract type
#'
#' @description This function begins the process of creating a new contract type by adding an initial exchange date.
#' @param on The date on which the contract begins.
#' @param exchanging Optional. The initial amount exchanged at the start of the contract. If omitted, defaults to 0.
#' @keywords contract, event
#' @export true
#' @examples
#' library(lubridate)
#' enter_contract(on = dmy(01/01/2018))

enter_contract <- function(starting){
  tibble(
    evt_date = starting,
    evt_type = "Contract Deal Date",
    evt_value = NA_real_,
    evt_currency = NA_character_ )
    #add_row(evt_date = on, evt_type = "Interest Exchange Date", evt_value = exchanging)
}
