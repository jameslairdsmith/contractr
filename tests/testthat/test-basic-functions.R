context("test-basic-functions")

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
