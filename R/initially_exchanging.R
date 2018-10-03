#' @title Add initial exchange event to a contract
#'
#' @description This function adds an initial exchange event between the parties to a contact.
#' @param df A contract to which the initial exchange is to be added.
#' @param evt_value The amount exchanged at the begining of the contract.
#' @param evt_currency The currency of the exchange amount. Defaults to "USD".
#' @param on The date on which this payment is made. Defaults to "initial", which gets the start of the contract already specified.
#' @keywords contract, event
#' @export true
#' @examples
#' library(lubridate)
#' enter_contract(on = dmy(01/01/2018))

initially_exchanging <- function(df, evt_value, evt_currency = "USD", on = "initial"){
  if(on == "initial"){
    df %>% add_event(
      evt_date = get_start_date(df),
      evt_value = evt_value,
      evt_type = "Initial Exchange",
      evt_currency = evt_currency,
      )
  } else {
    df %>% add_event(
      evt_date = on,
      evt_value = evt_value,
      evt_type = "Initial Exchange",
      evt_currency = evt_currency,
    )
  }
}
