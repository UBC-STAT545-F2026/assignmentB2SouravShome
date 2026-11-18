
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2SouravShome

The `assignmentB2SouravShome` package provides a simple function for
calculating descriptive statistics for numeric vectors.

The `summarize_numeric()` function calculates the total number of
observations, missing values, mean, median, standard deviation, minimum,
and maximum. It also allows users to choose how missing values are
handled.

## Installation

You can install the package from GitHub using `devtools`:

``` r
# Install the package from GitHub
devtools::install_github("UBC-STAT545-F2026/assignmentB2SouravShome")
```

Alternatively, you can install the package using `pak`:

``` r
# Install pak if it is not already installed
install.packages("pak")

# Install the package from GitHub using pak
pak::pak("UBC-STAT545-F2026/assignmentB2SouravShome")
```

## Example

``` r
# Load the package
library(assignmentB2SouravShome)

# Example 1: Summarize a numeric vector
summarize_numeric(c(2, 4, 6, 8, 10))
#>   n missing mean median       sd min max
#> 1 5       0    6      6 3.162278   2  10

# Example 2: Summarize a vector with missing values
summarize_numeric(c(2, 4, NA, 8, 10))
#>   n missing mean median       sd min max
#> 1 5       1    6      6 3.651484   2  10

# Example 3: Calculate statistics without removing missing values
summarize_numeric(c(2, 4, NA, 8, 10), na.rm = FALSE)
#>   n missing mean median sd min max
#> 1 5       1   NA     NA NA  NA  NA

# Example 4: Explicitly remove missing values
summarize_numeric(c(5, 10, NA, 20, 25), na.rm = TRUE)
#>   n missing mean median       sd min max
#> 1 5       1   15     15 9.128709   5  25
```
