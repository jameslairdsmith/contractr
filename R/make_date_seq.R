#' Create a sequence of dates
#'
#' It is often the case that one needs to create
#' a series of dates using only the start, end and
#' freqency.
#'
#' @param start_date The start date
#' @param end_date The end date
#' @param period_gap The period gap
#' @param tolerance the tolerance
#' @param  include_first whether to include the first date
#' @param include_last whether to include the last date
#' @param replace_last whether to replace the last date with `end_date`
#'
#' @export

make_date_seq <- function(start_date,
                          end_date,
                          period_gap,
                          tolerance = 0.2,
                          include_first = F,
                          include_last = T,
                          replace_last = T){

  date_diff <- end_date - start_date

  date_diff <- as.period(date_diff)

  n_periods <- suppressMessages(date_diff / period_gap)

  rounded_n_periods <- floor(n_periods)

  print(n_periods - rounded_n_periods)

  if((n_periods - rounded_n_periods) > tolerance){
    stop("Distance between supplied and projected last date is beyond tolerance level.")
  }

  if(include_first == T){
    first <- 0
  } else {first <- 1}

  if(include_last == F){
    rounded_n_periods <- rounded_n_periods - 1
  }

  interger_series <- first:rounded_n_periods

  period_series <- interger_series * period_gap

  date_series <- start_date %m+% period_series

  if(replace_last == TRUE){
    date_series[length(date_series)] <- end_date}

  date_series
}
