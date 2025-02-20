tidyHikes <- function(data) {
  data <- data %>%
    dplyr::select(-Itinéraire, -Commentaire) %>%
    mutate(
      Date = as.Date(Date, origin = "1900-01-01"),
      Durée = Durée * 24,
      DuréeChar = paste0(floor(Durée), "h", str_pad(round(60 * (Durée - floor(Durée)), 0), 2, "left", "0")),
      Année = as.factor(year(Date)),
      Chaussures = as.factor(Chaussures),
      Contexte = as.factor(Contexte),
      KmEff = formatC(KmEff, digits = 1, format = "f"),
      `D+/Km` = floor(`D+/Km`)
    )
}


# cells <- xlsx_cells("data/Randonnée.xlsx")
#
#
# trekID <- cells[cells$col == 1, c("row", "local_format_id")][2:(nrow(DATA)),]$local_format_id
# trekID <- ifelse(trekID != 3 & trekID != 90, NA, trekID)

