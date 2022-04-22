########### VASCULAR DIVERSITY VARIATION ALONG SOIL TEMPERATURE AND SITES#############
################################################################################################

#### What if you change your maind? #####
# Imporrt he following datasets from Import dataset in R Studio.

Hondo_VascularCover_1980_2015

Hondo_SoilTemp_1980_2010

#Hondo_VascularCover_2010 <- subset(Hondo_VascularCover_1980_2015,select = c(year)) # Selecting one column
Hondo_VascularCover_2010 <- subset(Hondo_VascularCover_1980_2015,year== "2010" )   # Selecting from one category in rows
View(Hondo_VascularCover_2010)
Hondo_SoilTemp_2010 <- subset(Hondo_SoilTemp_1980_2010,year== "2010" )   # Selecting from one category in rows
View(Hondo_SoilTemp_2010)

#Save 2010 subsets in format csv
write.csv(x=Hondo_VascularCover_2010,file="Hondo_VascularCover_2010.csv", row.names=FALSE) # Export data in csv format
write.csv(x=Hondo_SoilTemp_2010,file="Hondo_SoilTemp_2010.csv", row.names=FALSE) # Export data in csv format

### Organize data in Excel 
# Open in excel and order both datasets by stand and quad, then corroborate the perfect correspondande in order.
Hondo_VascularCover_2010_ordered
Hondo_SoilTemp_2010_ordered

# Generating a new data frame summarizing stand, quadrant, soil temperature and species richness.

SR_SoilTemp <- data.frame(stand=as.factor(Hondo_SoilTemp_2010_ordered$stand),
                          stand2=as.factor(Hondo_VascularCover_2010_ordered$stand),
                          quad=Hondo_SoilTemp_2010_ordered$quad,
                          quad2=Hondo_VascularCover_2010_ordered$quad,
                          SR=Hondo_VascularCover_2010_ordered$SR,
                          temp_C=Hondo_SoilTemp_2010_ordered$temp_C)
#### We can appreciate a propper order
SR_SoilTemp
str(SR_SoilTemp)
# Distribution plot of species frequencies
# Count number of species frequencies in each abundance class
SRichness <- data.frame(SR=Hondo_VascularCover_2010_ordered$SR)
ab <- table(unlist(SRichness))
barplot(ab, las = 1, # make axis labels perpendicular to axis
        xlab = "Abundance class: species richness", ylab = "Frequency", # label axes
        col = grey(5:0/5)) # 5-colour gradient for the bars

STemp <- data.frame(temp_C=Hondo_SoilTemp_2010_ordered$temp_C)
ab <- table(unlist(STemp))
barplot(ab, las = 1, # make axis labels perpendicular to axis
        xlab = "Abundance class: soil temperature", ylab = "Frequency", # label axes
        col = grey(5:0/5)) # 5-colour gradient for the bars


# Model codification

#Linear model with no random effects
str(SR_SoilTemp)
M1 <- lm(SR ~ temp_C,data = SR_SoilTemp) # At first time, we can chosse this time and define that
# less soil temperature means more species richness. But, stand is an important factor to considerer.
coef(M1)
(summ_M1 <- summary(M1))
summ_M1$coefficients
#Visualization
library(ggplot2)
# Create a simplified ggplot theme
fig <- theme_bw() +
  theme(panel.grid.minor=element_blank(),
        panel.grid.major=element_blank(),
        panel.background=element_blank()) +
  theme(strip.background=element_blank(),
        strip.text.y = element_text()) +
  theme(legend.background=element_blank()) +
  theme(legend.key=element_blank()) +
  theme(panel.border = element_rect(colour="black", fill=NA))

plot <- ggplot(aes(temp_C, SR), data = SR_SoilTemp)
Plot_AllData <- plot + geom_point() +
  xlab("Soil temperature (C)") +
  ylab("Species richness") +
  labs(title = "All data") + fig

# Add in regression lines with the intercepts specific to each lake

Plot_AllData +
  geom_abline(intercept = 23.8756410 ,
              slope     = -0.3346154, col = "coral2")

# Now, let to compute a model integratin an extra varibale: stand.
M2 <- lm(SR ~ temp_C+stand,data = SR_SoilTemp)

#Model selection
library(MuMIn)
AIC.table  <- MuMIn::model.sel( M1, M2)
(AIC.table <- AIC.table[ , c("df", "logLik", "AICc", "delta")])

# df is the degree of freedom
# logLik is the loglikelihood
# is the AICc difference with the lowes value

# Once the best model is selected.
M2 <- lm(SR ~ temp_C+stand,data = SR_SoilTemp)
# Model validation
# Check the independance of the model residuals with each covariate
plot(resid(M2) ~ fitted(M3),
     xlab = 'Predicted values',
     ylab = 'Normalized residuals')
abline(h = 0, lty = 2)

plot(resid(M2) ~ SR_SoilTemp$temp_C,
     xlab = "Length", ylab = "Normalized residuals")
abline(h = 0, lty = 2)

boxplot(resid(M2) ~ stand, data = SR_SoilTemp,
        xlab = "Stand", ylab = "Normalized residuals")
abline(h = 0, lty = 2)

#Homogeneous dispersion of the residuals around 0  no pattern of residuals depending on the variable, the assumption is respected!
#Check the normality of the model residuals
hist(resid(M2))

#Interpretation
# create a table with the coefs to facilitate their manipulation
coef(M2)
(summ_M2 <- summary(M2))
summ_M2$coefficients
#Visualization
library(ggplot2)
# Create a simplified ggplot theme
fig <- theme_bw() +
  theme(panel.grid.minor=element_blank(),
        panel.grid.major=element_blank(),
        panel.background=element_blank()) +
  theme(strip.background=element_blank(),
        strip.text.y = element_text()) +
  theme(legend.background=element_blank()) +
  theme(legend.key=element_blank()) +
  theme(panel.border = element_rect(colour="black", fill=NA))

plot <- ggplot(aes(temp_C, SR), data = SR_SoilTemp)
Plot_ByStand <- plot +
  geom_point(aes(colour = factor(stand)), size = 2) +
  xlab("Soil Temperature (C)") + ylab("Species richness") +
  labs(title = "By stand") + fig

# Add in regression lines with the intercepts specific to each lake

Plot_ByStand +
  geom_abline(intercept = 14.9866189 ,
              slope     = 0.2059010, col = "coral2")

# Note: another way to do it is using gamslss packge
library(gamlss)
con1 <- gamlss.control(c.crit=0.1, n.cyc = 3000)
mod_SR<-gamlss(formula = SR ~ temp_C+factor(stand), family = NO(), data = SR_SoilTemp,  
               control = con1)
summary(mod_SR)
mod_SR$mu.coefficients

plot(SR_SoilTemp$temp_C, SR_SoilTemp$SR, xlab="Soil temperature (C)", #,ylim = c(0,20)
     ylab="Species richness", # ylab=expression(paste("Seediling number of ", "  ", italic(Acer~negundo))), 
     pch=16, cex=1, col=rgb(4,139,154,150,maxColorValue=255),ylim = c(0,30))

curve((14.9866189+0.2059010*x), # 
      from=range(SR_SoilTemp$temp_C)[1],
      to=range(SR_SoilTemp$temp_C)[2],
      add=T, lwd=2, col="darkgoldenrod")


#### REGRESSION TREE: CONSIDERING THE TERMS FROM BEST GAMLSS PREDICTORS ############################
library(rpart)
library(rpart.plot)
fit <- rpart(M2,method="anova",
             model=TRUE, data=SR_SoilTemp,control = rpart.control(cp = 0))

# We can see that site is a factor more important than soil temperature alone, perhaps other different 
# factors not consider here can better explain species diversity. Stands 5 and 6 are exceptional sites refering to 
# diversity richness.

rpart.plot(fit,
           type=3,
           digits=2,
           tweak=2,
           extra=100,
           under=TRUE,
           fallen.leaves=FALSE, 
           box.palette="RdYlGn",
           main="Regression Tree")
rpart.rules(fit)


















