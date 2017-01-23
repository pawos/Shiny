#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  titlePanel("Sklepy raporter"),
  sidebarLayout(
    sidebarPanel(
      h3('Parametry'),
      uiOutput("campSelector"),
      dateRangeInput('dateRange',
                     label = 'Wybierz zakres:', format = "yyyy-mm-dd",
                     start = Sys.Date() - 90, end = Sys.Date() )
    ),
    mainPanel(
      h3('Wyniki'),
      plotOutput(outputId = "bar_plot")
    )
  )
))
