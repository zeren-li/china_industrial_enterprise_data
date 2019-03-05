library("googledrive")
setwd("C:/Users/hongs/zerenhongshen/CIED(1998-2013)2")

#  create a list of all files in the working directory with the .csv extension
  files <- list.files(pattern="*.csv")

library(readr)
library(dplyr)
library(stringr)

get_data = function(year) {
  text = str_extract(files, paste0("\\w{4}\\(","(",year,")","\\)\\d+[-]\\d+(.csv)")) %>%
    na.omit()
  data = read_csv(text[1])
  for (i in 2:length(text)) {
    newdata = read_csv(text[i])
    data = rbind(data,newdata)
  }
  data = data %>% 
    mutate(year = year)
}


data_2004 = get_data(2004)
data_2005 = get_data(2005)
data_2006 = get_data(2006)
data_2007 = get_data(2007)

