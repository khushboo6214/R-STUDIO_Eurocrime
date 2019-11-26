setwd("C:/Users/ADMIN")
getwd()
df=choose.files() ###can Also use read.csv but to hid the location of file i am using choose.files
df=read.csv("EurostatCrime2017.csv",stringsAsFactors = FALSE)
df

summary(df)
str(df)
library(dplyr)
glimpse(df)
nrow(df)
ncol(df)

#ndf(df)<-c('Burglary',$Burglary_of_private_residential_premisesm,)
#apply(df,2,sum,na.rm=TRUE)
#rowSums(df$Burglary,df$Burglary_of_private_residential_premises,df$Theft,df$Theft_of_a_motorized_land_vehicle,na.rm=TRUE)

#df$Allthieft <- c(sum(df$Theft),sum(df$Theft_of_a_motorized_land_vehicle))
#df$tf1 <- as.numeric(df$Theft)
#df$tf2<- as.numeric(df$Theft_of_a_motorized_land_vehicle)
#df$b1<-as.numeric(df$Burglary)
#df$b2<-as.numeric(df$Burglary_of_private_residential_premises)
df
#df$Alltheift <- df$tf1+df$tf2+df$b1+df$b2
#glimpse(df)
#
#glimpse(df)
#select(df,-tf1,-tf2,-b1,-b2)


# the Column are addes and the new column is added and removing the old column 
library(tidyverse)
Ncol=c("Burglary", "Theft", "Theft_of_a_motorized_land_vehicle", "Burglary_of_private_residential_premises")
df$Alltheft<-rowSums(df[ ,Ncol])
glimpse(df)
df[is.na(df)] <- 0# The NA will be replace with 0
glimpse(df)


#----------------------------------------------------------------------------------
#or To remove the NA all observation will be deleted 
#df1 <- na.omit(df1)
#glimpse(newdf1)
#or
#mtcars$NewCol <- as.numeric(apply(mtcars[,1:5], 1, sum))
#head(mtcars)

#or 
#mtcars %>% transmute(new_col = mpg + cyl + disp + hp + drat)

#or
#average_missing <- apply(df_Alltheft[,colnames(df_Alltheft) %in% list_na],2,mean,na.rm =  TRUE)
#average_missing
#--------------------------------------------------------------------------------------------
#colnames(df1)
#my_data %>% 
 # rename(
#    sepal_length = Sepal.Length,
  #  sepal_width = Sepal.Width
#  )
is.na(df)
dim(df)
df2 <- df[c(1:7,12,13)]
df2
library(ggplot2)




colnames(df2)[colnames(df2)=="ï..Country"] <- "Countryname"
colnames(df2)
df3 <-df2[7,]

df3$Countryname <- as.factor(df3$Countryname)

