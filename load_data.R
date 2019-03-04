library("googledrive")
library("readxl")
CIED_1998_1_20000 <- read_xlsx("C:/Users/hongs/zerenhongshen/CIED(1998-2013)/CIED(1998)1-20000.xls")
setwd("C:/Users/hongs/zerenhongshen/CIED(1998-2013)2")

#  create a list of all files in the working directory with the .csv extension
files <- list.files(pattern="*.csv")
require(purrr)
library(readr)

mainDF <- files %>% map_dfr(read_csv) 


fileIn=read_csv("C:/Users/hongs/zerenhongshen/CIED(1998-2013)2/CIED(1998)1-20000.csv")

