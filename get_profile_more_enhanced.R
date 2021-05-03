get_profile_more_enhanced <- function(gsid, remDr) {
  link <- paste("https://scholar.google.com/citations?user=", gsid, "&hl=en",
                sep = "")
  remDr$navigate(link)
  buttonTest <- remDr$findElements("id", "gsc_coauth_opn")
  
  if(length(buttonTest) == 0) {
    return(scrape_without_button(read_html(remDr$getPageSource()[[1]])))
  } else if(length(buttonTest) != 0){
    remDr$findElements("id", "gsc_coauth_opn")[[1]]$clickElement()
    return(scrape_with_button(read_html(remDr$getPageSource()[[1]])))
  }
}
