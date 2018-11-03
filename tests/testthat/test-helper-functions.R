context("test-helper-functions")

library(lubridate)

test_that("date sequence can be created", {
  dates <- make_date_seq(dmy("01/01/2000"),dmy("03/01/2000"), days(1))
  expect_is(dates, "Date")
  expect_type(dates, "double")
})

test_that("date sequence can be created with certain character strings", {
  dates <- make_date_seq(dmy("01/01/2000"),dmy("03/01/2000"), "daily")
  expect_is(dates, "Date")
  expect_type(dates, "double")
})

test_that("date sequence wont accept certain character strings", {
  expect_error(make_date_seq(dmy("01/01/2000"),dmy("03/01/2000"), "days 1"))
})

test_that("date sequence tolerance setting works", {
  expect_error(make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(2)))
  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(2), tolerance = 0.5)
  expect_is(dates, "Date")
  expect_type(dates, "double")
})

test_that("date sequence can exclude first date", {
  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(1))
  expect_equal(length(dates), 4)

  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(1), include_first = F)
  expect_equal(length(dates), 3)
})

test_that("date sequence can exclude last date", {
  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(1))
  expect_equal(length(dates), 4)

  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(1), include_last = F)
  expect_equal(length(dates), 3)
})

test_that("date sequence can allow for a last date jump", {
  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(2), tolerance = 0.5)
  expect_equal(length(dates), 2)

  dates <- make_date_seq(dmy("01/01/2000"),dmy("04/01/2000"), days(2), tolerance = 0.5, allow_last_jump = T)
  expect_equal(length(dates), 3)
  expect_equal(dates[3], dmy("05/01/2000"))
})
