has_element_named <- function(object, name){
  !is.null(purrr::pluck(object, name))
}
