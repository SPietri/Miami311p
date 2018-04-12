#' @title combine_ym
#'
#' @description  fixes dates and months from "Created" or "created_year_month" columns to allow for easy query.
#' @param dataset data set you want to add a column to.
#' @param column this can be a column of the data set using the $ operator or a vector that will be
#' added to dataset as a cloumn.
#' @return dataset with the colums: year_created, month_created.
#' @export


combine_ym<- function(dataset, column){
  new.months<- month_cre(column)
  new.months2 <- convert_month(new.months)
  month_created <- new.months2
  #cbind(dataset, month_created)
  new.years <- year_cre(column)
  year_created <- new.years
  cbind(dataset, year_created, month_created)
}
