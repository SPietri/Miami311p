#' @title fix_month
#'
#' @description takes the character string column of the Miami311 data csv file, "Created"
#' or gathered API data, "created_year_month", and filters out the month part of the character string.
#' @param  v this is a vector using the $ from a data frame or subsetted from a matrix or data frame
#' @return a vector character strings the size of one or two representing a month
#'
#' @export

fix_month<-function(v){
    created_month<-unlist(lapply(v, function(v){
    if(nchar(v)==6){
      substring((v[which(nchar(v)==6)]),5,6)}
    else if(nchar(v)==5){
      substring((v[which(nchar(v)==5)]), 5,5)}
    }))
    print(created_month, quote=FALSE)}

