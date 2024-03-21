managers_data <-read.csv("managers.csv", na="")
View(managers_data)
str(managers_data)


managers_data$Date
converted_date <- as.Date(managers_data$Date,
                          format =c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))
converted_date


managers_data$Date <- converted_date
managers_data$Date

str(managers_data)

startdate<-as.Date("2018-10-15")
enddate<-as.Date("2018-11-01")

startdate
enddate



class(startdate)
class(enddate)

new_data <- managers_data[managers_data$Date >= startdate & 
                            managers_data$Date <= enddate,]

new_data

#method1 to retrive only two columns
include_list1 <-managers_data[,8:9]
include_list2 <-managers_data[,c('Q3','Q4')]
include_list1

names(managers_data)

#method2 to retrive only two columns
include_list <- names(managers_data) %in% c("Q3","Q4")
include_list

View(managers_data)

#dropping the q3,q4 columns
new_data <-subset(managers_data, select= -Q3)
new_data

View(managers_data)

attach(managers_data)
new_data <-subset(managers_data, Age >=35 | Age < 24, select =c(Q1,Q2,Q3,Q4))
new_data

detach(managers_data)

new_managers_data <-subset(managers_data, Gender =="M" & Age > 25, select= 4:9)
new_managers_data

my_sample <- managers_data[sample(2:nrow(managers_data), 10, replace = TRUE),]
my_sample


write.csv(my_sample, file="random sample.csv")


attach(managers_data)
new_data <- managers_data[order(Age),]
new_data

new_data <- managers_data[order(Gender, Age),]
new_data
detach(managers_data)