05-20-2024         
Shirley Li, Bioinformatician, TTS Research Technology       
xue.li37@tufts.edu       


# The grammar of graphics        
## The seven grammatical elements     
* Data: The data-set being plotted. 
* Aesthetics: The scales onto which we map our data. 
* Geometries: The visual elements used for our data. 
* Themes: All non-data ink.    
* Statistics: Representations of our data to aid understanding.    
* Coordinates: The space on which the data will be plotted.   
* Facets: Plotting small multiples.     



## ggplot2 layers     


# Aesthetics       
| Aesthetics | Description                                          |
|------------|------------------------------------------------------|
| x          | x-axis position                                      |
| y          | y-axis position                                      |
| fill       | fill color                                           |
| color      | color of points, outlines of other geoms             |
| size       | Area or radius of points, thickness of lines         |       
| alpha      | Transparency                                         |       
| linetype   | line dash pattern                                    |       
| labels     | Text on a plot or axes                               |       
| shape      | Shape                                                |       
       

# Attributes       


## Positions      
Adjustment for overlapping     

## Scale functions     
scale_x_*()    
### the limit argument
### the breaks argument  

### Aesthetics best practices     
Form follows function    



# Geometries         

# Themes         
Three types:    
text: element_text()    
line: element_line()   
rectangle: element_rect()    

# Tricks of ggplot2       
## Reordering graphs      
## Changing tick labels angle      
## Changing to % scales       



#      
dataset link: https://www.kaggle.com/datasets/synful/world-happiness-report/data       

https://www.kaggle.com/datasets/prasertk/homicide-suicide-rate-and-gdp 

```r
library(data.table)
library(ggplot2)

data <- fread("/Users/xli37/Dropbox/Tufts/workshop/visualization/happiness_report/2019.csv")

ggplot(data, aes(x=Score, y=`Social support`)) +
    geom_point()


ggplot(data, aes(x=Score, y=`Social support`)) +
    geom_point(alpha=0.5, size=4, color="steelblue4") +
    geom_smooth(method="lm") +
    theme_classic() 

ggplot(data, aes(x=Score, y=`GDP per capita`)) +
    geom_point(alpha=0.5, size=4, color="steelblue4") +
    geom_smooth(method="lm") +
    theme_classic() 

ggplot(data, aes(x=`Social support`, y=`GDP per capita`)) +
    geom_point(alpha=0.5, size=4, color="steelblue4") +
    geom_smooth(method="lm") +
    theme_classic() 





```




```r
theme_set(theme_classic())

```