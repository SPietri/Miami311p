#' @title geteR
#'
#' @description Gathers Miami json API data from the Miami-Dade County website and stores it in to RSQLite database.
#' @param name Insert your name in quotation marks. It is required to start the function.
#' @param by= If (by="day"), this means your data is gathered once a day ONLY.
#' If (by = "time"), this means your data is gathered multiple times in one day
#' The default is by = "day"
#' If running more than once in a day due to a mistake, set by = "time". This will stop an error
#' message from appearing.
#' @return Miami311API: object in global environment
#' @return miami311API.csv: data file with the current date's API data
#' @return mapi_db: this is the name of the database in R created from the function
#' @export


geteR <- function(name="Insert Your Name", by = "day"){
  #Enter your name to begin function
  print(paste("Hello", name, "this function is for gathering Miami 311 Data using a json API"))

  #Installing json package
  if(!"jsonlite" %in% installed.packages()){
    print("Installing jsonlite package...")
    install.packages("jsonlite")
    print("The jsonlite package is now installed, calling library...")
    library(jsonlite)
  }else{
    print("The jsonlite package was already installed, calling library...")
    library(jsonlite)
  }

  #Installing RSQLite package
  if(!"RSQLite" %in% installed.packages()){
    print("Installing RSQLite package...")
    install.packages("RSQLite")
    print("The RSQLite package is now installed, calling library...")
    library(RSQLite)
  }else{
    print("The RSQLite package was already installed, calling library...")
  }

  # Grab Data from the API
  print("Required packages have been installed. Now gathering the API data. Just a moment...")
  data.json<- fromJSON("https://opendata.miamidade.gov/resource/rbng-6mha.json")

  # Clean the data
  print("Preparing the data...")
  data_after_columns_removed<- data.json[ , -which(names(data.json) %in% c(":@computed_region_txnr_gjhz", ":@computed_region_engu_ybxz", "ticket_status", "ticket_last_updated_date_time",
                                                                           "state", "location_state", "location_city", "location_address",
                                                                           "location", ":@computed_region_secj_6v34", ":@computed_region_sbwq_2egt", ":@computed_region_gqkf_326d",
                                                                           ":@computed_region_9gk8_96b4", "location_zip"))]
  data_after_na_removed <- na.omit(data_after_columns_removed)
  colnames(data_after_na_removed)<- c("actual.days", "case.owner", "case.owner.description", "city","created", "goal.days",
                                      "issue.type", "latitude", "longitude", "method", "district", "street.address", "ticket.closed",
                                      "ticket.open","id", "x.coor", "y.coor", "zipcode")
  print("You can find the data gathered from the API in your enviroment under the name - Miami311API -. Change it as you please. This will be overwritten each time you run the function.")
  created_year<- fix_year(data_after_na_removed$created)
  created_month <- convert_month(fix_month(data_after_na_removed$created))
  data_after_na_removed$created_year <- created_year
  data_after_na_removed$created_month <- created_month
  Miami311API <<- data_after_na_removed
  wd<- getwd()
  print(paste("Also, a csv file titled - miami311API - will be in", wd , "This file will be overwritten each time you run the function."))
  write.csv(Miami311API, "miami311API.csv")

  #Creating the database
  print(paste( name, "now the database is being created for you using the defualt file placed previously in your directory. The purpose of this database is to store data gathered once a day. It wll save in the database as the date you gathered it."))
  s <- getwd()
  setwd(s)
  miami4db<- read.csv("miami311API.csv")
  mydb <- dbConnect(SQLite(), dbname="Miami311API.sqlite")

  ######### Option for date ################
  if(by != "day"){
    date1<- Sys.time()
    date<- format(date1, "%Y-%m, %I:%M %p")
  }else
  { date <- as.character(Sys.Date())}
  ###########################################

  print("The name of your database is - MiamiAPI311.sqlite - an it can be found in your working directory.")
  dbWriteTable(conn= mydb,
               name= paste(date), value = miami4db, row.names = FALSE, header=TRUE, append = TRUE)
  mapi_db <<- mydb
  print("The database is created and filled with the API data.It is titled - mapi_db- .")
}
