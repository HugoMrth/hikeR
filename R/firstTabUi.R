firstTabUi <- function(id) {
  ns <- NS(id)
  tagList(
        fluidRow(
          box(
            title = "Box title", width = 6, status = "primary",
            "Box content"
          ),
          box(
            status = "warning", width = 6,
            "Box content"
          )
        ),

        fluidRow(
          column(width = 4,
                 box(
                   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                   "Box content"
                 ),
                 box(
                   width = NULL, background = "black",
                   "A box with a solid black background"
                 )
          ),

          column(width = 4,
                 box(
                   title = "Title 3", width = NULL, solidHeader = TRUE, status = "warning",
                   "Box content"
                 ),
                 box(
                   title = "Title 5", width = NULL, background = "light-blue",
                   "A box with a solid light-blue background"
                 )
          ),

          column(width = 4,
                 box(
                   title = "Title 2", width = NULL, solidHeader = TRUE,
                   "Box content"
                 ),
                 box(
                   title = "Title 6", width = NULL, background = "maroon",
                   "A box with a solid maroon background"
                 )
          )
        )
  )
}

