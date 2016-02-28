---
title       : Developing Data Products 
                - Course Project  
subtitle    : Mtcars Data Analysis
author      : King23
job         : 
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : default       # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---


## <font color="yellow">Developing Data Products 
## - Course Project </font>
<br>
Mtcars Data Analysis with Single Regression Modeling

author: King23


---

## <font color="yellow">Introduction</font>

<p style="text-align: left;" markdown="1">
This presentation is being created as part of the course project for the coursera developing data products class. The assignment objective is to ensure the following concepts were well understood by the students 
<br><br> </p>  


+ <font color="yellow">**Shiny**</font> to build data product application  
+ <font color="yellow">**Slidify**</font> to create data product related presentations

---
## <font color="yellow">The Shiny Application</font>  

<p style="text-align: left;" markdown="1">
This shiny application is simply use the mtcars dataset from library(dataset) in R and build a data visualization to users.  <br><br>

First, user can select the type of cylinder to filter the dataset. This application will provide data visualization below based on the user's input.  <br><br>

1) boxplot    - Comparison of mpg by car's tranmission type <br>
2) data table - Display user's filtered dataset interactively  <br>
3) ggplot     - Visualize the Estimate value of coefficient from Single Regreesion Model calculation  <br><br>

<font color="yellow">fit <- lm(mpg ~ am , data = dat1) </font> <br>
where 'mpg' is mile per gallon, 'am' is tranmission type and 'dat1' if filtered dataset based on user input.


<br><br> </p>

---

## <font color="yellow">Dataset</font>
<p style="text-align: left;" markdown="1">
The dataset being used in this application is 'mtcars' from  
library(datasets) <br><br> </p>  


```r
library(datasets)
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

---

## <font color="yellow">Links</font>
<br>
<p style="text-align: Center;" markdown="1">
The source code for the project is available here: </p> [GitHub](https://github.com/King23/DevDataProducts)  

<br>
<p style="text-align: Center;" markdown="1">
While for the online presentation, it can be viewed here: </p> [GitHub_Presentation](http://king23.github.io/DevDataProducts/presentation/index.html)
