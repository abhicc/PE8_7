library(gapminder)
data("gapminder")


ui7 <- fluidPage(
  
  titlePanel("Distribution of Life Expectancy"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "year",
                   label = "Select year:",
                   min = 1952,
                   max = 2007,
                   value = 1952,
                   step = 5)
    ),
    mainPanel(plotOutput("hist"))
  )
)

server7 <- function(input, output){
  
  output$hist <- renderPlot({
    
    ggplot(data = gapminder %>% filter(year == input$year)) +
      geom_histogram(aes(x = lifeExp), color = "white", fill = "blue")
  })
}

shinyApp(ui = ui7, server = server7)
