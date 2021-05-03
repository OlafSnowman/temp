library(RSelenium)
library(rvest)
library(tidyverse)
library(dplyr)
library(netstat)


rD <- rsDriver(browser="firefox", port=netstat::free_port(), verbose=F)
remDr <- rD[["client"]]

coauth_information_button <- get_profile_more_enhanced("xYcl1kgAAAAJ", remDr)
coauth_information_no_button <- get_profile_more_enhanced("odwfssgAAAAJ", remDr)

remDr$close()
rD$server$stop()
gc()

