# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  
  function(input, output) {
    
    
    output$map <- renderPlot({
      
      percent_map(counties[,switch(input$var,
                                   "Percent White" = "white",
                                   "Percent Black" = "black",
                                   "Percent Asian" = "asian",
                                   "Percent Hispanic" = "hispanic")],
                  switch(input$var,
                         "Percent White" = "green",
                         "Percent Black" = "blue",
                         "Percent Asian" = "red",
                         "Percent Hispanic" = "purple"), input$var, input$range[1], input$range[2] )
    })
      
  }
)
    
    
