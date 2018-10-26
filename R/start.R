#' @title Add a start date to a contract
#'
#' @description This function specifies the start date to a tidy contract.
#' @param contract A contract for which the start date is to be specified.
#' @param date The start date
#' @keywords contract, inception
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
#' @export
#' @examples
#' library(magrittr)
#' library(lubridate)
#'
#' make_contract() %>%
#'   term_start(dmy("01/01/2000"))
#'

term_start <-

  function(contract, start_date, id = "start_date"){
    contract %>%
      add_term(
        term_start_new(start_date = start_date, id = id)
        ) %>%
      add_stipulation(start_date, "start_date")
}

term_start_new <- function(start_date, id){
    make_term(
      subclass = "start",
      start_date = start_date,
      id = id,
      unique = T
    )
}

#' @export
schedule.term_start <- function(object, ...) {

  tibble::tibble(
    evt_date = object$start_date,
    evt_type = "start date",
    evt_value = 0
  )
}

print.term_start <- function(x, width = max(20, options()$width - 29), ...) {
  cat("Start date of", sep = "")
  cat(format(x$start_date, "%e %b %Y"), sep = "")
  invisible(x)
}
