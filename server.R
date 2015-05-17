require(signal)
source("butterHz.R")

shinyServer(function(input, output) {
  
  output$signalPlot <- renderPlot({ 
     butterHz(ABRfile, input$hpSlider, input$lpSlider, input$ordSlider)
  })
}
)
