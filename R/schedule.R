#' @rdname schedule
#' @export

schedule <- function(object, ...)
  UseMethod("schedule")

#' Create the events of a contract
#'
#' For a contract (with at least one term and no missing stipulations)
#' create the financial events that ought result from it.
#' @param contract A contract with at least one term.
#' @return A tibble housing the contract's events.
#' @rdname schedule
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows arrange
#' @export

schedule.contract <- function(contract) {

events <- tibble::tibble()

for (i in seq(along = contract$terms)){
  new_events <- schedule(contract$terms[[i]])
  events <- dplyr::bind_rows(new_events, events)
}
events %>%
  dplyr::arrange(event_date)
}
