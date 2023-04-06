df <- data.frame(Price_objective$`Price nature`)
install.packages("ggplot2")
library(ggplot2)
df <- data.frame(Price_objective$`Price nature`)
install.packages("ggplot2")
library(treemap)
dim(data)
head(data)
#treemap price
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Price",
        type = "index")
attach(data)
summary(data)
#treemap size
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Size",
        type = "index")
library(ggplot2)
heatmap(data)
install.packages('ggplots')
library(ggplots)
installed.packages()
install.packages('gplots')
library(gplots)
library(ggplot2)
heatmap()
class(data)
convert <- as.matrix(data)
class(convert)
heatmap(convert)
heatmap(convert$Price)
convertprice <- as.matrix(data$Price)
convertsize <- as.matrix(data$Size)
class(convertsize)
class(convertprice)
heatmap(convertsize, convertprice)
heatmap('convertsize')
view(convertsize)
install.packages("treemap")
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Price",
        type = "index",
        title = 'To make all investments in one locality (by price)')
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Size",
        type = "index",
        title = 'To make all investments in one locality (by size)')
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Price",
        type = "index",
        title = 'To make all investments in one place')
