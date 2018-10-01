#' @title Create a series of dates
#'
#' @description This function creates a series of dates evenly spread apart. Currently a thin wrapper around `by()`
#' @param from A date to start from
#' @param to A date to go to.
#' @param by spacing between dates.
#' @keywords date
#' @export
#' @examples
#' make_date_seq(from=1,to=5, by=1)

make_date_seq <- function(...){
  seq(...)
}
