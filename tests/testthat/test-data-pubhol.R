context("public holiday data tests")

test_that("Data is a data frame", {
  expect_true(is.data.frame(aus_public_holidays))
  })

test_that("Data has rows > 0", {
  expect_gt(nrow(aus_public_holidays), 0)
  })

test_that("Data has five columns", {
  expect_equal(ncol(aus_public_holidays), 5)
})

test_that("col names correct", {
  expect_true(all(colnames(aus_public_holidays) == c("date", "holiday_name", "information",
                                                   "more_information", "jurisdiction")))
})

test_that("date column is type date", {
  expect_is(aus_public_holidays$date, "Date")
})

test_that("Jurisdiction col contains only AUS States", {
  expect_true(all(unique(aus_public_holidays$jurisdiction) %in% c("ACT","NSW","NT","QLD","TAS","VIC","WA","SA")))
})

test_that("There are data from 2014", {
  expect_true("2014" %in% format(aus_public_holidays$date, "%Y"))
  })

test_that("There are data from 2015", {
  expect_true("2015" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2016", {
  expect_true("2016" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2017", {
  expect_true("2017" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2018", {
  expect_true("2018" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2019", {
  expect_true("2019" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2020", {
  expect_true("2020" %in% format(aus_public_holidays$date, "%Y"))
})

test_that("There are data from 2021", {
  expect_true("2021" %in% format(aus_public_holidays$date, "%Y"))
})




