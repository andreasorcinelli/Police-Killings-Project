#Setting working directory 
setwd("~/Desktop/")
#Loading Data 
Police=read.csv("PoliceKillings_ProcessedData_Yearly_180429.csv",header=TRUE)
summary(Police)

Police_vars <- c("Police_Killings", "Race", "Year")
Police_Killings_By_Race <- Police[Police_vars]
summary(Police_Killings_By_Race)

#Creating subset of data not including 2018
Police_Killings_By_Race_Subset <- subset(Police_Killings_By_Race, Year >= 2013 & Year <= 2017)
summary(Police_Killings_By_Race_Subset)

#Time course plot graphing total deaths per year by race
Police_Killings_By_Race_Subset_2017 <- ggplot(Police_Killings_By_Race_Subset, aes(Year, Police_Killings, linetype=Race)) + stat_summary(fun.y=mean, geom="line") + stat_summary(fun.data=mean_se, geom="ribbon", color=NA, alpha=.3) + theme_bw(base_size = 20) + xlab("Year") + ylab("Police Killings") + theme( legend.background=element_rect(color="black", fill="white"), legend.position = "top") + scale_linetype_manual(values=c("solid", "dashed", "dotted", "dotdash")) + scale_x_continuous(breaks=c(2013,2014,2015,2016,2017,2018)) + expand_limits(x=c(2013,2018)) + scale_y_continuous(breaks=c(400,500,600,700,800)) + expand_limits(y=c(350,800))

#Returning graph
Police_Killings_By_Race_Subset_2017 

#Saving graph as pdf
ggsave("Police_Killings_Over_Time_2017.pdf", Police_Killings_By_Race_Subset_2017, width = 7, height = 5, dpi = 300)

