#' @title Create a series of dates
#'
#' @description This function creates a series of dates evenly spread apart. Currently a thin wrapper around `by()`
#' @param from A date to start from.
#' @param to A date to go to.
#' @param by spacing between dates.
#' @keywords date
#' @export
#' @examples
#' make_date_seq(from=1,to=5, by=1)

make_date_seq <- function(...){
  seq(...)
}


#' @title Modify periods into dates
#'
#' @description This function changes period strings into date strings readable by `seq()``
#' @param period_string A string indicating the period.
#' @keywords period, string, date
#' @importFrom dplyr case_when
#' @importFrom stringr str_sub str_length str_c
#' @examples
#'
#' translate_period_freq("quarterly")
#'
#'

translate_period_freq <- function(period_string){

  if(stringr::str_sub(period_string, 1, 1) == "-"){

    word <- stringr::str_sub(period_string, 2, -1L)

  } else {

    word <- period_string

  }

  changed <-
    dplyr::case_when(
      word == "quarterly" ~ "3 months",
      word == "annually" ~ "1 year",
      word == "monthly" ~ "month",
      TRUE ~ "other"
    )

  if(stringr::str_sub(period_string, 1, 1) == "-"){
    out <- stringr::str_c("-", changed)
  } else {
    out <- changed
  }
  out
}
