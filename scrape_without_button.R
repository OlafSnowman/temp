scrape_without_button <- function(scholar_site) {
  
  coauth_gsid <- scholar_site %>%
    html_nodes(xpath = '//*[@class="gsc_rsb_a_desc"]') %>%
    html_nodes('a') %>%
    html_attr("href")
  
  coauth_gsid <- str_match(coauth_gsid, "=\\s*(.*?)\\s*&hl=")[,2]
  
  coauth_institution <- scholar_site %>%
    html_nodes(xpath='//*[@class="gsc_rsb_a_ext"]') %>%
    html_text()
  
  coauth_name <- scholar_site %>%
    html_nodes(xpath = '//*[@class="gsc_rsb_a_desc"]') %>%
    html_nodes('a') %>%
    html_text()
  
  return(data.frame(coauth_gsid, coauth_name, coauth_institution))
}
