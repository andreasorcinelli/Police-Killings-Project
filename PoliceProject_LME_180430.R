#setting working directory 
setwd("~/Desktop/")


#loading Data 
Police=read.csv("PoliceKillings_ProcessedData_Yearly_180429.csv",header=TRUE)
summary(Police)

#selecting variables
#Time variable is centered at Time 1 in the model (i.e. 2013) and race is dummy coded though eventually models would use both dummy and effects coding to examine main effects and interactions
Police_vars <- c("Police_Killings", "Race", "Race_Dummy", "Race_Effect","Year", "Time_Centered", "Time_Centered_Sq")
Police_Killings_By_Race <- Police[Police_vars]
summary(Police_Killings_By_Race)

#creating subset of data not including 2018 for models 
Police_Killings_By_Race_Subset <- subset(Police_Killings_By_Race, Year >= 2013 & Year <= 2017)
summary(Police_Killings_By_Race_Subset)

#MODELS
#GLM with fixed effects of race, year, and race*year interaction
Police_Killings_Dummy_glm = glm(Police_Killings ~ Race_Dummy + Time_Centered + Race_Dummy*Time_Centered, data=Police_Killings_By_Race_Subset)
#summary of GLM
summary(Police_Killings_Dummy_glm)
#creating dataframe for coefficients of GLM
results_df <-summary.glm(Police_Killings_Dummy_glm)$coefficients
#saving to csv
write.csv(results_df, "Police_Killings_GLM_180430.csv")

#LME with fixed effects of race, year, and race*year interaction, and random effect of race
#linear effect of time
Police_Killings_Dummy_lme = lmer(Police_Killings ~ Race_Dummy + Time_Centered + Race_Dummy*Time_Centered + (1|Race_Dummy), data=Police_Killings_By_Race_Subset, REML = FALSE, control = lmerControl(optimizer ="Nelder_Mead"))
#outputting summary of model
summary(Police_Killings_Dummy_lme)
#creating dataframe for coefficients
Police_Killings_Dummy_lme_coefs <- data.frame(coef(summary(Police_Killings_Dummy_lme)))
#adding p values to coefficients dataframe 
Police_Killings_Dummy_lme_coefs$p <- 2*(1-pnorm(abs(Police_Killings_Dummy_lme_coefs$t.value)))
#returning coefficients dataframe
Police_Killings_Dummy_lme_coefs
#writing to csv
write.csv(Police_Killings_Dummy_lme_coefs, file="Police_Killings_LME_180430.csv",quote=FALSE,row.names=TRUE,fileEncoding="")


#creating mixed effects model with fixed effects of race, year, and their interaction, and the interaction of qudratic time variable and race, and random effects of race
#quadratic effect of time
Police_Killings_Dummy_qme = lmer(Police_Killings ~ Race_Dummy + Time_Centered + Race_Dummy*Time_Centered + Race_Dummy*Time_Centered_Sq + (1|Race_Dummy), data=Police_Killings_By_Race_Subset, REML = FALSE, control = lmerControl(optimizer ="Nelder_Mead"))
#outputting summary of model
summary(Police_Killings_Dummy_qme)
#creating dataframe for coefficients
Police_Killings_Dummy_qme_coefs <- data.frame(coef(summary(Police_Killings_Dummy_qme)))
#adding p values to coefficients dataframe 
Police_Killings_Dummy_qme_coefs$p <- 2*(1-pnorm(abs(Police_Killings_Dummy_qme_coefs$t.value)))
#returning coefficients dataframe
Police_Killings_Dummy_qme_coefs
#writing to csv
write.csv(Police_Killings_Dummy_qme_coefs, file="Police_Killings_QME_180430.csv",quote=FALSE,row.names=TRUE,fileEncoding="")
