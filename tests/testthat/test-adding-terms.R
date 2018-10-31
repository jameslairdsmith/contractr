context("test-adding-terms")

library(lubridate)
library(magrittr)

test_that("start details can be added to a contract", {
  contract_a <-
    contract() %>%
    term_start(dmy("01/01/2018"))

  expect_equal(length(contract_a[["terms"]]),1)
  expect_true(inherits(contract_a[["terms"]][[1]],"term_start"))
})

test_that("unique clauses can only be added to a contract once", {
  contract_a <-
    contract() %>%
    term_start(dmy("01/01/2018"))

  expect_true(contract_a[["terms"]][[1]][["unique"]])
  expect_error(
    contract() %>%
      term_start(dmy("01/01/2018")) %>%
      term_start(dmy("01/01/2018"))
  )
})
