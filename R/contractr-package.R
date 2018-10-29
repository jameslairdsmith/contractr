#' contractr: a grammar of financial contracts
#'
#' The `contractr` package can be used to compose financial contracts
#'   in R. Superficially, it may appear that financial contracts exist
#'   in huge variety, but in reality almost all are combinations of a
#'   few event patterns. `contractr` has built-in functions for each of
#'   these patterns, any of which can be added to contract as a "term"
#'   of that contract. Thus:
#'
#'\enumerate{
#'\item A contract consists of one or more terms that determine the
#'  events that result from the contract.
#'\item Term can be added  to a contact sequentially using pipes.
#'}
#'
#' @section Basic Functions:
#' The three main functions in contractr are [contract()], [draft()],
#'   and [schedule()].
#'
#' [contract()] creates an empty contract object. to which terms
#'   can be added. [draft()] fills in the missing elements of a
#'   contract given the information already added to the contract
#'   or provided separately. Lastly the [schedule()] function returns
#'   the events that result from the contract.
#'
#' @section Term Functions:
#' These functions are used to add new terms to the contract and have the
#'   naming convention `"term_x"`. For example,
#'   [term_start()] stipulates the start date of the contract.
#' @docType package
#' @name contractr
#'
#' @keywords internal
"_PACKAGE"
