#' @title Add a generic financial event or set of events to a dataframe of financial events
#'
#' @description This function adds a financial event or a set of financial events to a dataframe of financial events.
#' @param df a dataframe to which the event is to be added.
#' @param evt_dates A date or vector of dates corresponding to the days on which the financial event or events will take place.
#' @param evt_types A string or vector of strings corresponding to the types of financial events taking place.
#' @param evt_values A numeric value or vector corresponding to the values of the financial events. Typically a currency value.
#' @keywords event
#' @export
#' @examples
#' make_date_seq(from=1,to=5, by=1)

add_events <- function(df, evt_dates, evt_types, evt_values){
  if(is.null(df)){
    data_frame(evt_dates, evt_types, evt_values)
  } else {
    df %>% add_row(evt_dates = evt_dates, evt_types = evt_types, evt_values = evt_values)
  }
}

add_event <- function(...){
  add_events(...)
}
