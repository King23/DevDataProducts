library(shiny)
library(shinythemes)
library(DT)
library(datasets)
library(markdown)

shinyUI(navbarPage("mtcars dataset",
                   inverse=TRUE,
                   theme = shinytheme("cosmo"),
                   collapsible=TRUE,
                   windowTitle="Simple Mtcars Shiny Apps",
                   
                   
                   tabPanel("Simple Mtcars Shiny Apps", 
                 
                            mainPanel( 
                                
                                 fluidRow(
                
                               
                                     
                            radioButtons("radio", label = h3("Select Cylinder type:"), choices = c("All", unique(mtcars$cyl)), selected = "All" )
                            
                                  ),
 
                                
                                 fluidRow(
                                
                                div(column(6,
                                    #h2("", align ="center",style = "color:blue"),
                                    plotOutput("mpg_plot", height="400"))  	#, width="auto", height="auto"
                                    ),   
                                		
                                         
                                    
                                     div( style="width:155%;",column(6,                                
                                     DT::dataTableOutput("mt_cars"), style = "font-size:100%" )
                                     )                     
                                     
                                ),
                                
                                fluidRow(
                                tabsetPanel(
                                    
                                    tabPanel(
                                        h4('Estimate', align ="center",style = "color:blue"),
                                        plotOutput("prediction_plot", height="350")
                                       
                                        
                                             ),
                                    
                                    tabPanel(
                                        h4('About This Shiny App', align ="center",style = "color:blue"),
                                        htmlOutput("readme")
                                        
                                             
                                    )
                                  )
                                )
                            )
                   )            

))
