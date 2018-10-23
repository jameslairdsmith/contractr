context("test-adding-counterparty")

contract <- make_contract() %>% add_counterparty("JP Morgan")

test_that("counterparty can be added", {
  expect_identical(contract[["counterparty"]], "JP Morgan")
  expect_error(make_contract() %>% add_counterparty(c("JP Morgan", "Goldman Sacs")))
  expect_error(make_contract() %>% add_counterparty(mtcars))
})
