#view dataset
View(data)
------------------------------------------------------------------------------
#EXPLORING DATASET 
#dimension of dataset
dim(data)
#class of data
class(data)
# first 6 in R using head()
head(data)
#last 6 in R using tail()
tail(data)
#Names of the columns in the datset
colnames(data)
#Names of the rows in the datset
row.names(data)
#only the first 5 columns
head(data, ncol=5)
#no of columns in the datset
ncol(data)
#finding class of the data (dataframe)
data.class(data)
#no of rows in the datset
nrow(data)
#Only the first 5 rows
tail(data, nrow=5)
----------------------------------------------------------------------------
#extract a column in R is using symbol '$'
#Describe/summary - min,max,Q1,Q2(median),Q3,Q4, mean,class, mode & length 
#Describe/summary -  for entire dataset 
summary(data)
#Describe/summary - for a particular column 
summary(data$Price)
------------------------------------------------------------------------------
#mean of a column in the dataset
mean(data$Price, na.rm = TRUE, trim = 0)
#standard deviation 
sd(data$Price, na.rm = FALSE)
------------------------------------------------------------------------------
#installing & activating packages & libraries (in this case - dplyr)
#install packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")
install.packages('dplyr')
#loading
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(dplyr)
------------------------------------------------------------------------------
#TABLES
#table - for single column
table(data$City_name)
#table for multiple columns
table(data$City_name, data$is_furnished)
------------------------------------------------------------------------------
#BARPLOTS
#barplot - simple (without data labels)
colours <- c('Green','Red','Yellow') #defining colours for futher use
LMH <- table(data$is_furnished) #attaching counts to a variable (in this case LMH)
barplot(LMH, main = 'FURNITURE', xlab = '', ylab = 'Frequency', col = colours,
        legend.text = TRUE, beside = TRUE)
##barplot - simple (without data labels)
colours <- c('Green','Red','Yellow') #defining colours for futher use
LMH <- table(data$is_furnished) #attaching counts to a variable (in this case LMH)
barplot(LMH, main = 'FURNITURE', xlab = '', ylab = 'Frequency', col = colours,
        legend.text = TRUE, beside = TRUE)
datalabel <- barplot(LMH, main = 'FURNITURE', xlab = '', ylab = 'Frequency', col = colours,
                     legend.text = TRUE, beside = TRUE)
text(datalabel,0, LMH, cex = 2, pos = 3)
#barplots - clustered barplots 
#required packages & libraries - ggplot,ggplot2,ggpubr
barplot(table(data$City_name, data$Property_type),main = 'Different types of properties in each city',
        col = colours,beside = TRUE,
        legend.text = TRUE, ylab = 'Frequency', xlab = 'Property type')
------------------------------------------------------------------------------
#SCATTER PLOT
##scatterplot - single variable (in this case price per unit) 
plot(data$Price_per_unit_area)
#scatterplot for multiple variables - (in this case price per unit and total price )
plot(data$Price_per_unit_area,data$Price)
------------------------------------------------------------------------------------
#CORRELATION
cor(data$Price_per_unit_area, data$Price)
------------------------------------------------------------------------------------
#trendline()
#for trendline visual we need package "basictrendline", install & activate it
install.packages('basictrendline')
library(basictrendline)
x <- data$Price
y <- data$Size
trendline(x, y, model = "line2P", plot = TRUE, linecolor = "red",
          lty = 1, lwd = 1, summary = TRUE, ePos = "topleft", eDigit = 5,
          eSize = 1) #only new versions support this 
plot(y, type = "l") 
---------------------------------------------------------------------------------------
#COVARIANCE
x <- data$Price
y <- data$Size
cov(x,y)
---------------------------------------------------------------------------------------
#TREEMAP
#required package- "treemap", install & activate 
install.packages("treemap")
library(treemap)
treemap(data, 
        index=c("City_name","Locality_Name","Sub_urban_name"),
        vSize = "Price",
        type = "index",
        title = 'To make all investments in one place')
----------------------------------------------------------------------------------------
#parameter mf col is used to fit in more than one visualisation on one visual slide
par(mfcol = c(2,2))
#(2,2) means 4 visuals, we can also (1,2) when we have onlu two 
#is plot
barplot(table(data$is_plot), main = 'plots',
        ylab = 'Frequency', xlab = 'plot', col = c('RED', 'GREEN'), legend.text = FALSE) 
#penthouse
barplot(table(data$is_PentaHouse),
        main = 'Penthouse', ylab = 'Frequency', xlab = 'Pent house ', 
        col = c('RED', 'GREEN'), legend.text = FALSE)
#studio
barplot(table(data$is_PentaHouse), main = 'Studio',
        ylab = 'Frequency', xlab = 'Studio', col = c('RED', 'GREEN'), legend.text = FALSE)
#RERA Registered
barplot(table(data$is_RERA_registered), main = 'RERA registered',
        ylab = 'Frequency', xlab = 'RERA registered', col = c('RED', 'GREEN'), legend.text = FALSE)
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------
#boxplots - with outliers
boxplot(summary(data$Size))
#boxplot - without outliers 
boxplot(summary(data$Size), outline = FALSE)
#boxplot - with all the attributes (title, color, varwidth, notch, outline)
boxplot(summary(data$Size), main = 'size', col = 'blue',
        varwidth = TRUE, notch = FALSE, outline = FALSE)
##boxplot with city names
boxplot(data$Price~data$City_name,
        main = 'price-city boxplot',
        xlab = 'City_names',
        ylab = 'Price',
        las = 1,
        names = c('Ahemdabad','Bangalore','Chennai','Delhi','Hyderabad','Kolkata','Lucknow','Mumbai')
)
-------------------------------------------------------------------------------
#REGRESSION
#lm function is used in simple and multiple regression
help(lm)
?lm
#Simple regression
mod <- lm(data$Price ~ data$Size)
summary(mod)
plot(mod)
#multiple regression (Price is dependent and other two are independent)
mulreg <- lm(data$Price ~ data$Size + data$No_of_BHK)
summary(mulreg)
plot(mulreg)