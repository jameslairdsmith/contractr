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
#' @importFrom dplyr case_when
#' @importFrom stringr str_to_lower
#' @importFrom lubridate interval
#'
#' @export

make_date_seq <- function(start_date,
                          end_date,
                          period_gap,
                          tolerance = 0.2,
                          include_first = T,
                          include_last = T,
                          replace_last = F,
                          allow_last_jump = F){

  if(is.character(period_gap)){
    period_gap <- stringr::str_to_lower(period_gap)
  }

  period_gap <-
    dplyr::case_when(
      period_gap == "quarterly" ~ months(3),
      period_gap == "annually" ~ years(1),
      period_gap == "monthly" ~ months(1),
      period_gap == "weekly" ~ weeks(1),
      period_gap == "daily" ~ days(1),
      TRUE ~ as.period(period_gap)
    )

  if(inherits(period_gap, what = "Period") == FALSE){
    stop("period_gap must be a `Period` object. See the lubridate package for details.")
  }

  if(include_last == F & replace_last == T){
    stop("replace_last is set to true, but last value already excluded as include_last == F")
  }

  if(include_last == F & allow_last_jump == T){
    stop("allow_last_jump is set to true, but last value already excluded as include_last == F")
  }

  if(replace_last == T & allow_last_jump == T){
    stop("allow_last_jump is set to true, but last value already being replaced as replace_last == T")
  }

  date_interval <- lubridate::interval(start = start_date, end = end_date)

  n_periods <- date_interval / period_gap

  if(allow_last_jump == T){
    rounded_n_periods <- round(n_periods, digits = 0)
  } else {
    rounded_n_periods <- floor(n_periods)
  }

  if(abs(n_periods - rounded_n_periods) > tolerance){
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
