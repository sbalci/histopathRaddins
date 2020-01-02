library(shiny)
library(miniUI)
#' Decision
#' 
#' # http://www.biyoistatistik.hacettepe.edu.tr/doktora/BIS_710.pdf
#' https://www.wikizeroo.org/index.php?q=aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvU2Vuc2l0aXZpdHlfYW5kX3NwZWNpZmljaXR5
#' 
#'@import shiny
#'@import miniUI
#'@import shinyWidgets
#'@import scales
decision <- function() {
ui <- miniUI::miniPage(
  miniUI::gadgetTitleBar("Decision Rates"),
  miniUI::miniTabstripPanel(
    miniUI::miniTabPanel(
      "Test Results",
      icon = shiny::icon("table"),
      miniUI::miniContentPanel(
        # Define layout, inputs, outputs
        source(file.path("R/ui", "decision_ui_table1.R"),  local = TRUE)$value,
        tags$hr(),
        source(file.path("R/ui", "decision_ui_table2.R"),  local = TRUE)$value
      )
    )
  )
)

server <- function(input, output, session) {
  # Define reactive expressions, outputs, etc.
  source(file.path("R/server", "decision_server_table.R"),  local = TRUE)$value
  

  # When the Done button is clicked, return a value
  observeEvent(input$done, {
    returnValue <- "done"
    stopApp(returnValue)
  })
}

shiny::runGadget(ui, server,
                 viewer = shiny::dialogViewer(dialogName = "Decision Rates",
                                              width = 600,
                                              height = 600)
                 # viewer = paneViewer()
)

}

