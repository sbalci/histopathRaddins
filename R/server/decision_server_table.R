TP <- reactive({
  req(input$TP)
  TP <- as.numeric(input$TP)
})

FP <- reactive({
  req(input$FP)
  FP <- as.numeric(input$FP)
})

TN <- reactive({
  req(input$TN)
  TN <- as.numeric(input$TN)
})

FN <- reactive({
  req(input$FN)
  FN <- as.numeric(input$FN)
})

CP <- reactive({
  CP <- TP() + FN()
})

output$CP <- renderText({
  CP()
})

CN <- reactive({
  CN <- FP() + TN()
})

output$CN <- renderText({
  CN()
})

TPR <- reactive({
  TPR <- TP() / CP()
})

output$TPR <- renderText({
  TPR <- TPR()
  TPR <- scales::percent(TPR)
})

FNR <- reactive({
  FNR <- FN() / CP()
})

output$FNR <- renderText({
  FNR <- FNR()
  FNR <- scales::percent(FNR)
  
})

FPR <- reactive({
  FPR <- FP() / CN()
})

output$FPR <- renderText({
  FPR <- FPR()
  FPR <- scales::percent(FPR)
  
})

TNR <- reactive({
  TNR <- TN() / CN()
})

output$TNR <- renderText({
  TNR <- TNR()
  TNR <- scales::percent(TNR)
  
})

# test positive total
TPT <- reactive({
  TPT <- TP() + FP()
})

output$TPT <- renderText({
  TPT <- TPT()
})

# test negative total
TNT <- reactive({
  TNT <- TN() + FN()
})

output$TNT <- renderText({
  TNT <- TNT()
})


total <- reactive({
  total <- TP() + TN() + FP() + FN()
})

output$total <- renderText({
  total()
})



PPV <- reactive({
  PPV <- TP() / TPT()
})

output$PPV <- renderText({
  PPV <- PPV()
  PPV <- scales::percent(PPV)
  })



NPV <- reactive({
  NPV <- TN() / TNT()
})

output$NPV <- renderText({
  NPV <- NPV()
  NPV <- scales::percent(NPV)
})


