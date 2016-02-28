library(shiny)
library(DT)
library(ggplot2)
#library(data.table)
library(datasets)

mtcars$am <- factor(mtcars$am,labels=c("Auto","Manual"))


shinyServer(function(input, output){
    
    myplot <- function(dat) {        
        boxplot(mpg ~ am, data = dat, col = (c("green","yellow")), ylab = "Miles Per Gallon",
                xlab = "Transmission Type (0=auto, 1=manual)",
                main="Comparison of MPG of Automatic vs. Manual Transmission")    
    }
    
    predic_plot <- function(dat1) {
        
        fit <- lm(mpg ~ am , data = dat1)
        coef_fit <- coef(summary(fit))
        coef_fit <- cbind(Predictors = rownames(coef_fit), coef_fit)
        coef_fit <- as.data.frame(coef_fit )
        coef_fit$Estimate <- round(as.numeric(levels(coef_fit$Estimate))[coef_fit$Estimate] ,2)
        
        estimate <- ggplot(coef_fit, aes(x=Predictors, y=Estimate , fill=Predictors)) 
        estimate <- estimate + geom_bar(position="dodge", stat="identity")
        estimate <- estimate + ggtitle("Estimate of Coeffient by Regression Modeling") + theme(plot.title = element_text(lineheight=.8, face="bold", size=24, colour = "blue"),axis.text.x=element_text(vjust=.5,angle=0, size=15), axis.text.y=element_text(size=15), text = element_text(size=20)) + geom_text(aes(label=Estimate, y=Estimate),size=5, hjust=.5, vjust=-.5) + ylim (0,25)
        estimate
        
    }
    
    
    
    getPage<-function() {
        return(includeHTML("README.html"))
    }
    output$readme<-renderUI({getPage()})
    
    
        
     output$mt_cars <- DT::renderDataTable(rownames = FALSE,options= list(pageLength=5, autoWidth = TRUE,columnDefs = list(list(width = '500px', targets = "repair"))),selection = 'single',{
         data <- mtcars
         
         
         if (input$radio != "All"){
             data <- data[data$cyl == input$radio,]
             
             output$mpg_plot<- renderPlot(width="auto" ,height="auto"   , {
                 myplot(data)
        
             })    
             
             output$prediction_plot<- renderPlot(width=800 ,height="auto"  , {

                 predic_plot(data)
                 
             })
             
             
             
             
             
         }
         
#          if (input$vs != "All"){
#              data <- data[data$vs == input$vs,]
#              
#              output$mpg_plot<- renderPlot(width="auto" ,height="auto"  , {
#                  myplot(data)                                   
#              }) 
#              
#              output$prediction_plot<- renderPlot(width=800 ,height="auto"  , {
#                  
#                  predic_plot(data)
#                  
#              })    
#          }
#          
#          
#          if (input$gear != "All"){
#              data <- data[data$gear == input$gear,]
#              output$mpg_plot<- renderPlot(width="auto" ,height="auto"  , {
#                  myplot(data)                                  
#              }) 
#              
#              output$prediction_plot<- renderPlot(width=800 ,height="auto"  , {
#                  
#                  predic_plot(data)
#                  
#              })   
#          }
#          
#          
         if (input$radio == "All"){
         output$mpg_plot<- renderPlot(width="auto" ,height="auto"  , {
             myplot(mtcars)
         }) 
         
         output$prediction_plot<- renderPlot(width=800,height="auto"  , {
             
             predic_plot(mtcars)
             
         })    
     }
         data
         
     })
    
})


