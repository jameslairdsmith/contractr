#' @rdname schedule
#' @aliases schedule schedule.contract
#' @author James Laird-Smith
#' @keywords event contract
#' @export

schedule <- function(object, ...)
  UseMethod("schedule")

#' Create the events from a contract
#'
#' For a contract with at least one term and no missing stipulations
#' create the financial events that ought result from it.
#' @param object A contract with at least one term.
#' @return A tibble
#' @rdname schedule
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows
#' @export

schedule.contract <- function(object) {

events <- tibble::tibble()

for (i in seq(along = object$terms)){
  new_events <- schedule(object$terms[[i]])
  events <- dplyr::bind_rows(new_events, events)
}
events
}
