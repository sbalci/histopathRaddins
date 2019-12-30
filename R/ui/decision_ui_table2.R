tags$table(
  tags$style(type="text/css",
             "table{border: 0.1px solid black; text-align: center;}  th{text-align: center;}"),
  tags$tr(
    tags$th(""),
    tags$td(p("Sensitivity/TPR"),
            textOutput("TPR")),
    tags$td(p("False Positive Rate"),
            textOutput("FPR")),
    tags$td(p("Positive Predictive Value"),
            textOutput("PPV"))
  ),
  tags$tr(
    tags$th(""),
    tags$td(p("False Negative Rate"),
            textOutput("FNR")),
    tags$td(p("Specificity/TNR"),
            textOutput("TNR")),
    tags$td(p("Negative Predictive Value"),
            textOutput("NPV"))
  )
)
