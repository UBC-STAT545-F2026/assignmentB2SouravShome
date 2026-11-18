#' @title Summarize a Numeric Vector
#'
#' @description This function calculates descriptive statistics for a
#' numeric vector and allows the user to control how missing values are handled.
#'
#' @param x A numeric vector to summarize.
#'
#' @param na.rm A logical value (TRUE or FALSE) indicating whether
#' missing values should be removed. The default is TRUE.
#'
#' @details By default, na.rm is set to TRUE to remove missing values.
#'
#' @return A data frame with one row containing the total number
#' of observations, missing values, mean, median, standard deviation,
#' minimum, and maximum.
#'
#' @examples
#' summarize_numeric(c(2, 4, 6, 8, 10))
#' summarize_numeric(c(2, 4, NA, 8, 10))
#' summarize_numeric(c(2, 4, NA, 8, 10), na.rm = FALSE)
#' summarize_numeric(c(5, 10, NA, 20, 25), na.rm = TRUE)
#'
#' @export

summarize_numeric <- function(x, na.rm = TRUE) {

  # Check if the input is numeric
  if (!is.numeric(x)) {
    stop("Input must be a numeric vector.")
  }

  # Check if na.rm is TRUE or FALSE
  if (!is.logical(na.rm) || length(na.rm) != 1 || is.na(na.rm)) {
    stop("na.rm must be TRUE or FALSE.")
  }

  # Check if the vector is empty or contains only missing values
  if (length(x) == 0 || all(is.na(x))) {
    stop("Input must contain at least one non-missing value.")
  }

  # Calculate the summary statistics
  result <- data.frame(
    n = length(x),
    missing = sum(is.na(x)),
    mean = mean(x, na.rm = na.rm),
    median = stats::median(x, na.rm = na.rm), # Calculate median using stats
    sd = stats::sd(x, na.rm = na.rm), # Calculate standard deviation using stats
    min = min(x, na.rm = na.rm),
    max = max(x, na.rm = na.rm)
  )

  # Return the results
  return(result)
}
