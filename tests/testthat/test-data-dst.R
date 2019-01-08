context("daylight saving data tests")

test_that("Data is a data frame", {
  expect_true(is.data.frame(aus_daylight_saving))
  })

test_that("Data has rows > 0", {
  expect_gt(nrow(aus_daylight_saving), 0)
  })

test_that("Data has four columns", {
  expect_equal(ncol(aus_daylight_saving), 4)
})

test_that("dst_start_date column is type date", {
  expect_is(aus_daylight_saving$dst_start_date, "Date")
})

test_that("dst_finish_date column is type date", {
  expect_is(aus_daylight_saving$dst_finish_date, "Date")
})

test_that("There are data starting from 1916", {
  expect_true(min(aus_daylight_saving$season_start) == 1916)
  })

test_that("There are data up to 2017", {
  expect_true(max(aus_daylight_saving$season_start) == 2017)
})



