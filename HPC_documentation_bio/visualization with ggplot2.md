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
 
# Geometries         

# Themes         


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