tidyHikes <- function(data) {
  data <- data %>%
    dplyr::select(-Itinéraire, -Commentaire) %>%
    mutate(
      Date = as.Date(Date, origin = "1900-01-01"),
      Durée = Durée * 24,
      DuréeChar = paste0(floor(Durée), "h", str_pad(round(60 * (Durée - floor(Durée)), 0), 2, "left", "0")),
      Année = as.factor(year(Date)),
      Chaussures = as.factor(Chaussures)
    )
}



