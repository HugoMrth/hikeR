dashboardServer <- function(id, values) {

  moduleServer(
    id,
    function(input, output, session) {


      #### ObserveEvents ####


      #### Outputs ####

      #### __Datatable ####
      output$statParAn <- renderDT({
        df <- data.frame(
          Année = levels(values$data$Année),
          N = as.numeric(table(values$data$Année)),
          Km = by(values$data$Km, values$data$Année, sum),
          "Dp" = by(values$data$`D+`, values$data$Année, sum),
          "Dm" = by(values$data$`D-`, values$data$Année, sum)
        ) %>%
          mutate(
            Km = formatC(Km, digits = 0, big.mark = " ", format = "f"),
            Dp = formatC(Dp, digits = 0, big.mark = " ", format = "f"),
            Dm = formatC(Dm, digits = 0, big.mark = " ", format = "f")
          )
      },
      rownames = FALSE,
      options = list(
        pageLength = 5,
        lengthChange = FALSE
      )
      )

      output$statParChaussure <- renderDT({
        df <- data.frame(
          Chaussure = levels(values$data$Chaussures),
          N = as.numeric(table(values$data$Chaussures)),
          Km = by(values$data$Km, values$data$Chaussures, sum),
          "Dp" = by(values$data$`D+`, values$data$Chaussures, sum),
          "Dm" = by(values$data$`D-`, values$data$Chaussures, sum)
        ) %>%
        arrange(-Km) %>%
          mutate(
            Km = formatC(Km, digits = 0, big.mark = " ", format = "f"),
            Dp = formatC(Dp, digits = 0, big.mark = " ", format = "f"),
            Dm = formatC(Dm, digits = 0, big.mark = " ", format = "f")
          )
      },
      rownames = FALSE,
      options = list(
        pageLength = 5,
        lengthChange = FALSE
      )
      )

      output$statParTrek <- renderDT({
        dfData <- values$data[!str_detect(values$data$Contexte, "Vacances"), ]
        df <- data.frame(
          Trek = levels(dfData$Contexte),
          Jours = as.numeric(table(dfData$Contexte)),
          Km = by(dfData$Km, dfData$Contexte, sum),
          Dp = by(dfData$`D+`, dfData$Contexte, sum),
          Dm = by(dfData$`D-`, dfData$Contexte, sum)
        ) %>%
          filter(Jours > 1) %>%
          arrange(-Jours, -Km) %>%
          mutate(
            Km = round(Km, 0),
            Dp = round(Dp, 0),
            Dm = round(Dm, 0),
            KmEff = round((Km+Dp/100+Dm/300)/Jours, 0)
          )
        colnames(df) <- c("Itinéraire", "Jours", "Km", "D+", "D-", "KmEff/J")
        df
      },
      rownames = FALSE,
      options = list(
        pageLength = 12,
        lengthChange = FALSE
      )
      )

      output$statParMassif <- renderDT({
        vecMassifs <- table(unlist(str_split(values$data$Massif, " & ")))

        data.frame(
          Massif = names(vecMassifs),
          N = as.numeric(vecMassifs)
        ) %>%
          arrange(-N)
      },
      rownames = FALSE,
      options = list(
        pageLength = 5,
        lengthChange = FALSE
      )
      )

      output$statParCompagnie <- renderDT({
        vecCompagnie <- table(unlist(str_split(values$data$Compagnie, ", ")))

        data.frame(
          Compagnie = names(vecCompagnie),
          N = as.numeric(vecCompagnie)
        ) %>%
          arrange(-N)
      },
      rownames = FALSE,
      options = list(
        pageLength = 5,
        lengthChange = FALSE
      )
      )

      #### __Datatable ####
      output$hikesBrowser <- renderDT({
        values$data %>%
          mutate(
            Durée = DuréeChar
          ) %>%
          dplyr::select(-DuréeChar, -Année, -Chaussures, -Pays) %>%
          arrange(desc(Date))
      },
      rownames = FALSE,
      options = list(
        pageLength = 15,
        lengthChange = FALSE
      )
      )

    })
    }
