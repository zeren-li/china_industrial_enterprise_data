library("googledrive")
setwd("C:/Users/hongs/zerenhongshen/CIED(1998-2013)2")

#  create a list of all files in the working directory with the .csv extension
  files <- list.files(pattern="*.csv")

  # Names of all packages used
  pkgs <- c("dplyr","tidyr", "haven", "MASS","data.table","foreign","mlogit","stargazer",
            "ggplot2","stringr","rms","AER","readr","nnet","lmtest","lme4","arm","sandwich")
  # A function to load all above packages. Install if they have not been installed.
  usePackage <- function(p){
    for (pkg in p){
      if (!is.element(pkg, installed.packages()[,1]))
        install.packages(pkg, dep = TRUE, repos = "https://cloud.r-project.org/")
      require(pkg, character.only = TRUE)
    }
  }
  usePackage(pkgs)

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



