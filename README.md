# Miami311p
This is a repository for the R package Miami311p. 
The package is for the purpose of gathering API data and storing it to a SQL database in the users working directory. 
The data can be gathered daily and will be stored in the database under the label of the date (without overwriting the previous days data). 
Since the API only includes recent entries of size 1000, a dataset of Miami 311 data going back to 2013 is also included by the name 
Miami_Dade. 

                             Install from GitHub :  devtools::install_github("SPietri/Miami311p")

data source: https://opendata.miamidade.gov/311/311-Service-Requests-Miami-Dade-County/dj6j-qg5t
