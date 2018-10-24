#' Check for Empty Ellipses
#'
#' @param ... Arguments pass in from a call to `step`
#' @return If not empty, a list of quosures. If empty, an error is thrown.
#' @importFrom rlang quos is_empty
#' @export
#' @keywords internal
#' @rdname recipes-internal
ellipse_check <- function(...) {
  terms <- quos(...)
  if (is_empty(terms))
    stop("Please supply at least one variable specification.",
         "See ?selections.",
         call. = FALSE)
  terms
}
