% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix_month.R
\name{fix_month}
\alias{fix_month}
\title{fix_month}
\usage{
fix_month(v)
}
\arguments{
\item{v}{this is a vector using the $ from a data frame or subsetted from a matrix or data frame}
}
\value{
a vector character strings the size of one or two representing a month
}
\description{
takes the character string column of the Miami311 data csv file, "Created"
or gathered API data, "created_year_month", and filters out the month part of the character string.
}
