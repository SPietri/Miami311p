# Fix for combine_ym in geteR function
convert_month2 <- function(x){
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
}

combine_ym2<- function(dataset, column){
  new.months<- month_cre(column)
  new.months2 <- convert_month2(new.months)
  month_created <- new.months2
  #cbind(dataset, month_created)
  new.years <- year_cre(column)
  year_created <- new.years
  cbind(dataset, year_created, month_created)
}
