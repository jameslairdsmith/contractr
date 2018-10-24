context("test-adding-clauses")

library(lubridate)

contract <- make_contract() %>% add_counterparty("JP Morgan")

test_that("counterparty can be added", {
  expect_identical(contract[["counterparty"]], "JP Morgan")
  expect_error(make_contract() %>% add_counterparty(c("JP Morgan", "Goldman Sacs")))
  expect_error(make_contract() %>% add_counterparty(mtcars))
})

contract <- make_contract() %>%
  starting_from(dmy("01/01/2018"))

test_that("unique clauses can only be added to a contract once", {

  expect_true(contract[["clauses"]][[1]][["unique"]])

  expect_error(
    make_contract() %>%
      starting_from(dmy("01/01/2018")) %>%
      starting_from(dmy("01/01/2018"))
  )
})
