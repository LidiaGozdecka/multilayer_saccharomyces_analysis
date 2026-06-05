library(httr2)
library(readr)
library(dotenv)
library(here)



#i need to load the file with my key for biogrid API 
load_dot_env()
api_key <- Sys.getenv("BIOGRID_API_KEY")

#just making sure that the key actually exists in the .env file
if(api_key==""){
  stop("Error: the BIOGRID_API_KEY was not found in the .env file!")
}

#defining endpoint and parameters

url_biogrid <- "https://webservice.thebiogrid.org/interactions"

my_query <- request(url_biogrid) %>% 
  req_url_query(
    accesskey=api_key,
    taxId="559292", #id for S.cerevisiae
    format="tab2", #tabular data
    includeInteractors="true" #full info on proteins
  )


#sending request & getting the reponse

cat("Downloadinf the data from BioGRID.. remember, patience is a virtue\n")

my_response <- my_query %>% 
  req_perform


#tab2 to tekst rozdizelony tabulatorammi



#record raw data into a file

#this will be the place whre i save data
saving_path <- here("data", "raw", "raw_data_ppi_Scerevisiae.txt")

resp_body_raw(my_response) %>% 
  writeBin(saving_path)


cat("Yippie! The data has been downloaded and saved. \n")


