#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  library(RODBC)
  
  spr_df <- sprzedaz<-read.csv("Zeszyt2.csv", sep=";",header= TRUE, na.strings='NULL')
  spr_df[,3] <- as.Date(spr_df[,3])
  ChoseList <- unique(spr_df$Sklep)
  
  output$campSelector <- renderUI({
    selectInput("variable1", "Wybierz sklepy:", ChoseList, multiple = TRUE, selectize = TRUE) 
  })
  
  

  output$bar_plot <- renderPlot({
    
    ggplot(spr_df[spr_df$Sklep %in% c(input$variable1) & spr_df$Data > as.character(input$dateRange[1]) & spr_df$Data < as.character(input$dateRange[2]), ],aes(x=IdSklep,y=WartoscsprzedazyBrutto)) + geom_bar(,stat="identity")})
  
  
  

})

  

  
