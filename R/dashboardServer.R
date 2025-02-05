dashboardServer <- function(id, values) {

  moduleServer(
    id,
    function(input, output, session) {


      #### ObserveEvents ####




      #### Outputs ####

      #### __Datatable ####
      output$statParAn <- renderDT({
        data.frame(
          Année = levels(values$data$Année),
          N = as.numeric(table(values$data$Année)),
          Km = by(values$data$Km, values$data$Année, sum),
          "Dp" = by(values$data$`D+`, values$data$Année, sum),
          "Dm" = by(values$data$`D-`, values$data$Année, sum)
        )
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
      )
      )

      output$statParChaussure <- renderDT({
        data.frame(
          Chaussure = levels(values$data$Chaussures),
          N = as.numeric(table(values$data$Chaussures)),
          Km = by(values$data$Km, values$data$Chaussures, sum),
          "Dp" = by(values$data$`D+`, values$data$Chaussures, sum),
          "Dm" = by(values$data$`D-`, values$data$Chaussures, sum)
        ) %>%
        arrange(-Km)
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
      )
      )

      output$statParTrek <- renderDT({
        data.frame(
          Contexte = levels(values$data$Contexte),
          Jours = as.numeric(table(values$data$Contexte)),
          Km = by(values$data$Km, values$data$Contexte, sum),
          "Dp" = by(values$data$`D+`, values$data$Contexte, sum),
          "Dm" = by(values$data$`D-`, values$data$Contexte, sum)
        ) %>%
        arrange(-Jours, -Km)
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
        pageLength = 15
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
        pageLength = 15
      )
      )

    })
    }
