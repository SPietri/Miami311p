#' @title convert_month
#'
#' @description Converts any numbers 1:12 to months of the year character strings
#' @param  x this is a vector, matrix, or subsetted matrix/dataframe in the form of a vector
#' @return a vector of full name months
#'
#' @export



convert_month <- function(x){
  stopifnot(is.data.frame(x) == FALSE)
  for(i in 1:length(x)){
    if(x[i]==1){
      x[i] <- "January"
    }else if(x[i] ==2){
      x[i]<- "February"
    }else if(x[i]==3){
      x[i] <- "March"
    }else if(x[i] ==4){
      x[i] <- "April"
    }else if(x[i] ==5){
      x[i] <- "May"
    }else if(x[i] ==6){
      x[i] <- "June"
    }else if(x[i] ==7){
      x[i]<- "July"
    }else if(x[i] ==8){
      x[i] <- "August"
    }else if(x[i] ==9){
      x[i] <- "September"
    }else if(x[i] ==10){
      x[i]<- "October"
    }else if(x[i] ==11){
      x[i]<- "November"
    }else if(x[i]==12){
      x[i]<- "December"
    }else if(is.na(x[i] == TRUE)){
      x[i] <- NA
    }
  }
  print(x, quote =FALSE)
}
