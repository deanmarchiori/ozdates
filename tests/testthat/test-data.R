context("data regression tests")

test_that(desc = "Data has length > 0", code = {
  expect_gt(nrow(aus_public_holidays), 0)
  })
