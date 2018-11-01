context("test-basic-functions")

library(lubridate)
library(magrittr)

test_that("contracts can be created", {
  expect_true(is.list(contract()))
  expect_is(contract(), "contract")
})

test_that("contracts can be scheduled", {
  expect_is(contract() %>% schedule(), "tbl_df")
})

test_that("terms can be created", {
  contract_a <-
    contract() %>%
    term_start(dmy("01/01/2018"))

  expect_is(contract_a[["terms"]][[1]], "term")
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
