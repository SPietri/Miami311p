#' @title fix_year
#'
#' @description takes the character string column of the Miami311 data csv file, "Created" or gathered API data, "created_year_month", and filters out the year part of the character string.
#' @param  v this is a vector using the $ from a data frame or subsetted from a matrix or data frame
#' @return a vector of dates as character strings
#'
#' @export


fix_year<- function(v){
  created_year<- unlist(lapply(v, function(v){
  if(nchar(v)==6){
    substring((v[which(nchar(v)==6)]),1,4)}
  else if(nchar(v)==5){
    substring((v[which(nchar(v)==5)]), 1,4)}
  }))
  print(created_year, quotes = FALSE)}
