# Test 1: Check the summary statistics
test_that("Summary statistics are calculated correctly", {

  # Create a summary using numeric data
  result <- summarize_numeric(c(10, 20, 30, 40, 50))

  # Check if the output is a data frame
  expect_true(is.data.frame(result))

  # Check the calculated statistics
  expect_equal(result$n, 5)
  expect_equal(result$missing, 0)
  expect_equal(result$mean, 30)
  expect_equal(result$median, 30)
  expect_equal(result$sd, stats::sd(c(10, 20, 30, 40, 50)))
  expect_equal(result$min, 10)
  expect_equal(result$max, 50)

})

# Test 2: Check missing values
test_that("Missing values are handled correctly", {

  # Create a summary with a missing value
  result <- summarize_numeric(c(10, 20, 30, NA, 50))

  # Check the total and missing observations
  expect_equal(result$n, 5)
  expect_equal(result$missing, 1)

  # Check the mean when missing values are removed
  expect_equal(result$mean, 27.5)

  # Keep missing values in the calculation
  result_na <- suppressWarnings(
    summarize_numeric(c(10, 20, 30, NA, 50), na.rm = FALSE)
  )

  # Check if the mean is NA
  expect_true(is.na(result_na$mean))

})

# Test 3: Check character input
test_that("Character input produces an error", {

  # Check the error message for character data
  expect_error(
    summarize_numeric(c("A", "B", "C", "D", "E")),
    "Input must be a numeric vector."
  )

})

# Test 4: Check empty and entirely missing numeric inputs
test_that("Empty and entirely missing numeric inputs produce errors", {

  # Check the error message for an empty vector
  expect_error(
    summarize_numeric(numeric(0)),
    "Input must contain at least one non-missing value."
  )

  # Check the error message when all values are missing
  expect_error(
    summarize_numeric(c(NA_real_, NA_real_)),
    "Input must contain at least one non-missing value."
  )

})

# Test 5: Check invalid na.rm values
test_that("Invalid na.rm values produce errors", {

  # Check that na.rm cannot be a character value
  expect_error(
    summarize_numeric(c(10, 20, 30), na.rm = "TRUE"),
    "na.rm must be TRUE or FALSE."
  )

  # Check that na.rm cannot be NA
  expect_error(
    summarize_numeric(c(10, 20, 30), na.rm = NA),
    "na.rm must be TRUE or FALSE."
  )

  # Check that na.rm cannot contain multiple values
  expect_error(
    summarize_numeric(c(10, 20, 30), na.rm = c(TRUE, FALSE)),
    "na.rm must be TRUE or FALSE."
  )

})
