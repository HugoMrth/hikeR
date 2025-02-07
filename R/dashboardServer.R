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
        )
        rownames(df) <- NULL

        datatable(df) %>%
          formatRound(columns = "Km", digits = 0, mark = " ") %>%
          formatRound(columns = "Dp", digits = 0, mark = " ") %>%
          formatRound(columns = "Dm", digits = 0, mark = " ")
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
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
        arrange(-Km)
        rownames(df) <- NULL

        datatable(df) %>%
          formatRound(columns = "Km", digits = 0, mark = " ") %>%
          formatRound(columns = "Dp", digits = 0, mark = " ") %>%
          formatRound(columns = "Dm", digits = 0, mark = " ")
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
      )
      )

      output$statParTrek <- renderDT({
        df <- data.frame(
          Trek = levels(values$data$Contexte),
          Jours = as.numeric(table(values$data$Contexte)),
          Km = by(values$data$Km, values$data$Contexte, sum),
          "Dp" = by(values$data$`D+`, values$data$Contexte, sum),
          "Dm" = by(values$data$`D-`, values$data$Contexte, sum)
        ) %>%
        arrange(-Jours, -Km)
        rownames(df) <- NULL

        datatable(df) %>%
          formatRound(columns = "Km", digits = 0, mark = " ") %>%
          formatRound(columns = "Dp", digits = 0, mark = " ") %>%
          formatRound(columns = "Dm", digits = 0, mark = " ")
      },
      rownames = FALSE,
      options = list(
        pageLength = 15
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
        pageLength = 10
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
        pageLength = 10
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
        pageLength = 15
      )
      )

    })
    }
