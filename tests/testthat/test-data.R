context("data regression tests")

test_that(desc = "Data has length > 0", code = {
  expect_gt(nrow(auspubhols_2019), 0)
  })
