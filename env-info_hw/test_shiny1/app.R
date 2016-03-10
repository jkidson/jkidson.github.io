# Jennifer Kidson
# Test Shiny 
library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Hello World!"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

server = function(input, output) {
  
  output$main_plot <- renderPlot({
    
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Duration (minutes)",
         main = "Geyser eruption duration")
    
  })
  
}
  
shinyApp(ui, server)

