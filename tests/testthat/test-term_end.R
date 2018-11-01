context("test-term-end")

library(lubridate)
library(magrittr)

test_that("end details can be added to a contract", {
  contract_a <-
    contract() %>%
    term_end(dmy("01/01/2018"))

  expect_equal(length(contract_a[["terms"]]),1)
  expect_true(inherits(contract_a[["terms"]][[1]],"term_end"))
})

test_that("a different event name can be added to end term", {
  events <-
    contract() %>%
    term_end(dmy("01/01/2018"), event_name = "sale date") %>%
    schedule()

  expect_equal(events[1, "event_type"] %>% dplyr::pull(),"sale date")
})

test_that("a receipt value can be specified for an end term", {
  contract_a <-
    contract() %>%
    term_end(as.Date("2000/02/01"), receipt = 1000)

  expect_equal(as.numeric(contract_a$stipulations[[2]]), 1000)

  events <- contract_a %>% schedule()

  expect_equal(events[1, "event_value"] %>% dplyr::pull(), 1000)
})

test_that("a payment value can be specified for an end term", {
  contract_a <-
    contract() %>%
    term_end(as.Date("2000/02/01"), payment = 50)

  expect_equal(as.numeric(contract_a$stipulations[[2]]), 50)

  events <- contract_a %>% schedule()

  expect_equal(events[1, "event_value"] %>% dplyr::pull(), -50)
})

test_that("only one of either payment or reciept can be specified for an end term", {
  expect_error(
    contract() %>%
      term_end(
                as.Date("2000/02/01"),
                payment = 50,
                receipt = 10)
    )

})
