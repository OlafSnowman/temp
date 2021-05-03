scrape_with_button <- function(scholar_site) {
  
  coauth_gsid <- scholar_site %>%
    html_nodes(xpath = '//*[@class="gs_ai_name"]') %>%
    html_nodes('a') %>%
    html_attr("href")
  
  coauth_gsid <- str_split(coauth_gsid, '=', simplify = TRUE)[,3]
  
  coauth_name <- scholar_site %>%
    html_nodes(xpath = '//*[@class="gs_ai_name"]') %>%
    html_nodes('a') %>%
    html_text()
  
  coauth_institution <- scholar_site %>%
    html_nodes(xpath = '//*[@class="gs_ai_aff"]') %>%
    html_text()
  
  return(data.frame(coauth_gsid, coauth_name, coauth_institution))
}
