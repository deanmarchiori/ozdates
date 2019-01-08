context("public holiday data tests")
library(lubridate)

test_that("Data is a data frame", {
  expect_true(is.data.frame(aus_public_holidays))
  })

test_that("Data has rows > 0", {
  expect_gt(nrow(aus_public_holidays), 0)
  })

test_that("Data has five columns", {
  expect_equal(ncol(aus_public_holidays), 5)
})

test_that("date column is type date", {
  expect_is(aus_public_holidays$date, "Date")
})

test_that("Jurisdiction col contains only AUS States", {
  expect_true(all(unique(aus_public_holidays$jurisdiction) %in% c("ACT","NSW","NT","QLD","TAS","VIC","WA","SA")))
})

test_that("There are data from 2014", {
  expect_true(c(2014) %in% unique(year(aus_public_holidays$date)))
  })

test_that("There are data from 2015", {
  expect_true(c(2015) %in% unique(year(aus_public_holidays$date)))
})

test_that("There are data from 2016", {
  expect_true(c(2016) %in% unique(year(aus_public_holidays$date)))
})

test_that("There are data from 2017", {
  expect_true(c(2017) %in% unique(year(aus_public_holidays$date)))
})

test_that("There are data from 2018", {
  expect_true(c(2018) %in% unique(year(aus_public_holidays$date)))
})

test_that("There are data from 2019", {
  expect_true(c(2019) %in% unique(year(aus_public_holidays$date)))
})


