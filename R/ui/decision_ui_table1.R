tags$table(
  tags$style(type="text/css",
             "table, tr, td{border: 0.1px solid black; text-align: center;} th{text-align: center;}"),
  tags$tr(
    tags$th(""),
    tags$th("Disease Present"),
    tags$th("Disease Absent"),
    tags$th("Test Totals"),
  ),
  tags$tr(
    tags$th("Test Positive"),
    tags$td(textInput("TP", "", width = validateCssUnit("100pt"))),
    # "True Positive"
    tags$td(textInput("FP", "", width = validateCssUnit("100pt"))
            # p("False Positive, Type I Error")
            ),
    # "False Positive"
    tags$td(textOutput("TPT"))
    ),
  tags$tr(
    tags$th("Test Negative"),
    tags$td(textInput("FN", "", width = validateCssUnit("100pt"))),
    # "False Negative"
    tags$td(textInput("TN", "", width = validateCssUnit("100pt"))),
    # "True Negative"
    tags$td(textOutput("TNT"))
  ),
  tags$tr(
    tags$th("Population Totals"),
    tags$td(textOutput("CP")),
    # "Condition Positive"
    tags$td(textOutput("CN")),
    # "Condition Negative"
    tags$td(textOutput("total"))
  )
)
