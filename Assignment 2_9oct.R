setwd("C:/Users/ADMIN")
getwd()
#df=choose.files() ###can Also use read.csv but to hid the location of file i am using choose.files
df=read.csv("EurostatCrime2017.csv",stringsAsFactors = FALSE,row.names = 1)
df

summary(df)
str(df)
library(dplyr)
glimpse(df)
nrow(df)
ncol(df)
dim(df)

Ncol=c("Burglary", "Theft", "Theft_of_a_motorized_land_vehicle", "Burglary_of_private_residential_premises")
df$Burglary[is.na(df$Burglary)] <- 0
df$Burglary_of_private_residential_premises[is.na(df$Burglary_of_private_residential_premises)]<- 0
df$Theft<-0
df$Theft_of_a_motorized_land_vehicle<-0

df$Alltheft<-rowSums(df[ ,Ncol])



df2<- subset(df, select = -c(Burglary,Theft,Theft_of_a_motorized_land_vehicle,Burglary_of_private_residential_premises))
#df2 <- df[c(1:7,12,13)]
#df2

#colnames(df2)[colnames(df2)=="??..Country"] <- "Countryname"
#df2$Countryname <- as.factor(df2$Countryname)
#colnames(df2)

#rownames(df3)<-(which(!complete.cases(df2)))




country<-list()
for(i in 1:nrow(df2)) 
  { 
 if(any(is.na(df2[i,])))
 {
  country<- c(country,rownames(df2[i,]))
   
 }
}
print(country)
df2<-na.omit(df2)
dim(df2)

ireland_df<-subset(df2,rownames(df2)=="Ireland")
top_crime


df2$offence<-apply(df2,1,sum)
H_offence<- rownames(df2[which.max(df2$offence),])
H_offence
barplot(df2$Sexual.violence)
plot(df2~Sexual.violence)
table(df2$Sexual.violence)
X<-rownames(df2)
X
Y<-df2[ ,25]
Y

library(ggplot2)
crimes <- c(df2$Intentional_homicide, df2$Attempted_intentional_homicide)
countries <- rownames(df2)
types <- c(rep("Intentional Homicide", length(df2$Intentional_homicide)), 
           rep("Attempted Homicide", length(df2$Attempted_intentional_homicide)))
plot_data <- data.frame(countries, crimes, types)
plt <- ggplot(plot_data, aes(countries, crimes))
plt + geom_bar(stat = 'identity', aes(fill = types)) +
  xlab("Countries") + ylab("Crime Count") + theme_bw()