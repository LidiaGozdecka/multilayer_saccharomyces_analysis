#https://cdn.netbiol.org/tflink/download_files/TFLink_Saccharomyces_cerevisiae_interactions_All_simpleFormat_v1.0.tsv

library(httr2)
library(readr)
library(dotenv)
library(here)

#link to the tflink.net site 
url_tflink_yeast <- "https://cdn.netbiol.org/tflink/download_files/TFLink_Saccharomyces_cerevisiae_interactions_All_simpleFormat_v1.0.tsv"
#this is where i will be saving the raw data
local_grn_yeast_path <- here("data", "raw", "raw_yeast_grn_tflink.gz")

#downlaod from server
download.file(url_tflink_yeast, destfile=local_grn_yeast_path)

grn_yeast_tflink <- read_tsv(local_grn_yeast_path)

View(grn_yeast_tflink)

