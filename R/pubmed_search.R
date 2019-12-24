# https://github.com/ropensci/rentrez/issues/60
#' Statistical Methods
#'
#'@import shiny
#'@import miniUI
#'@import leaflet
#'@import shinyWidgets
#'@import glue
#'
#' @return
#' @export
#'
#' @examples
#'
# pubmed_search <- function() {

ui <-
  miniUI::miniPage(
    miniUI::gadgetTitleBar("PubMed Search"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel(
        "Parameters",
        icon = icon("keyboard"),
        miniUI::miniContentPanel(
          shiny::fillCol(
            # First Row ----
            shiny::fillRow(
              textInput("text1", "Text1"),
              
              selectInput(
                "field1",
                "Field1",
                
                choices = c(
                  '',
                  'Affiliation',
                  'All Fields',
                  'Author',
                  'Journal',
                  'MeSH Major Topic',
                  'MeSH Terms',
                  'PMID',
                  'Title',
                  'Title/Abstract'
                )
              )
            ),
            
            # Second Row ----
            shiny::fillRow(
              selectInput("bool1", "Boolean1",
                          choices = c("", "AND", "OR", "NOT")),
              
              textInput("text2", "Text2"),
              
              selectInput(
                "field2",
                "Field2",
                choices = c(
                  '',
                  'Affiliation',
                  'All Fields',
                  'Author',
                  'Journal',
                  'MeSH Major Topic',
                  'MeSH Terms',
                  'PMID',
                  'Title',
                  'Title/Abstract'
                )
              )
            ),
            
            # Third Row ----
            shiny::fillRow(
              selectInput("bool2", "Boolean2",
                          choices = c("", "AND", "OR", "NOT")),
              
              textInput("text3", "Text3"),
              
              selectInput(
                "field3",
                "Field3",
                choices = c(
                  '',
                  'Affiliation',
                  'All Fields',
                  'Author',
                  'Journal',
                  'MeSH Major Topic',
                  'MeSH Terms',
                  'PMID',
                  'Title',
                  'Title/Abstract'
                )
              )
            )
          )
        )
      ),
      
      # TODO ----
      
      miniUI::miniTabPanel(
        "Query",
        icon = icon("cogs"),
        
        
        
        miniUI::miniContentPanel(
          
          # verbatimTextOutput("search"),
          
          textInput("deneme2", "Modify Paranthesis Here"),
          
          
          tags$b("Final Search Formula"),
          textOutput("search2")
          
          
          
          
          )
      )
      
    )
  )








server <- function(input, output, session) {
  
  
  bool_1 <- reactiveVal()
  
  observeEvent( input$bool1 , {
    
    bool<- 
    switch(input$bool1,
           "AND" = "AND",
           "OR" = "OR",
           "NOT" = "NOT")
  
    bool_1(bool)
    
  })
  
  
  bool_2 <- reactiveVal()
  
  observeEvent( input$bool2 , {
    
    bool<- 
      switch(input$bool2,
             "AND" = "AND",
             "OR" = "OR",
             "NOT" = "NOT")
    
    bool_2(bool)
    
  })
  
  
  
  
  text_1 <- reactiveVal()

  observeEvent( input$text1 , {
    
    text_1(input$text1)
    
  })
  
  
  text_2 <- reactiveVal()
  
  observeEvent( input$text2 , {
    
    text_2(input$text2)
    
  })
  
  
  text_3 <- reactiveVal()
  
  observeEvent( input$text3 , {
    
    text_3(input$text3)
    
  })
  
  
  
  field_1 <- reactiveVal()
  
  
  observeEvent( input$field1 , {
  
    field <-   switch(
      input$field1,
      'Affiliation' =  'AD' ,
      'All Fields' =  'ALL' ,
      'Author' =  'AU' ,
      'Journal' =  'TA' ,
      'MeSH Major Topic' =  'MAJR' ,
      'MeSH Terms' =  'MH' ,
      'PMID' =  'PMID' ,
      'Title' =  'TI' ,
      'Title/Abstract' =  'TIAB'
    )
    
    
    field_1(field)
    
  })
  
  
  field_2 <- reactiveVal()
  
  
  observeEvent( input$field2 , {
    
    field <-   switch(
      input$field2,
      'Affiliation' =  'AD' ,
      'All Fields' =  'ALL' ,
      'Author' =  'AU' ,
      'Journal' =  'TA' ,
      'MeSH Major Topic' =  'MAJR' ,
      'MeSH Terms' =  'MH' ,
      'PMID' =  'PMID' ,
      'Title' =  'TI' ,
      'Title/Abstract' =  'TIAB'
    )
    
    
    field_2(field)
    
  })
  
  
  
  field_3 <- reactiveVal()
  
  
  observeEvent( input$field3 , {
    
    field <-   switch(
      input$field3,
      'Affiliation' =  'AD' ,
      'All Fields' =  'ALL' ,
      'Author' =  'AU' ,
      'Journal' =  'TA' ,
      'MeSH Major Topic' =  'MAJR' ,
      'MeSH Terms' =  'MH' ,
      'PMID' =  'PMID' ,
      'Title' =  'TI' ,
      'Title/Abstract' =  'TIAB'
    )
    
    
    field_3(field)
    
  })
  
  

  bbb1 <- quote({ 
    
    paste0("'",
           text_1(), "'[", field_1(), "] ")
    
    })
  
  
  bbb2 <- quote({ 
    
    paste0("'",
           text_1(), "'[", field_1(), "] ",
           bool_1(), " '", 
           text_2(), "'[", field_2(), "] ")
    
  })
  
  
  
  bbb3 <- quote({ 
    
    paste0("'",
           text_1(), "'[", field_1(), "] ",
           bool_1(), " '", 
           text_2(), "'[", field_2(), "] ",
           bool_2()," '",
           text_3(), "'[", field_3(), "] "
    )
     
  })
  
  
  
  bbb <-  reactive({
    

  bbb <- observe(bb1, quoted = TRUE)
    
  })
  
  
  
  
  aaa <- reactive({
    
    
    # if(length(input$bool1) + length(input$bool2) >1) {
    
    
    
    expr <- paste0("'",
      text_1(), "'[", field_1(), "] ",
                   bool_1(), " '", 
                   text_2(), "'[", field_2(), "] ",
                   bool_2()," '",
                   text_3(), "'[", field_3(), "] "
                   )
    
    return(expr)
    
    # }
    
  })
  
  
  # TODO 2 ----
  
  
  output$search <- renderPrint({

    searchf <- aaa()
    
    return(searchf)
    
  })
  
  
  observe({

    text_to_modify <- aaa()
    
    updateSelectInput(session = session,
                      inputId = 'deneme2',
                      selected = text_to_modify,
                      choices = NULL
                      )
  })
  
  
  
  search2 <- reactive({
    
    search2 <- input$deneme2
    
  })
  
  
  output$search2 <- renderText({
    
    searchf <- search2()
    
    return(searchf)
    
  })
  
  
  
  
  # When the Done button is clicked, return a value
  shiny::observeEvent(input$done, {
    returnValue <- search2()
    
    shiny::stopApp(returnValue)
  })
}

shiny::runGadget(ui, server,
                 viewer = dialogViewer(dialogName = "PubMed Search", width = 600, height = 600)
                 # viewer = paneViewer()
                 )
# }
