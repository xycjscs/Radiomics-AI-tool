
library(rms)
library(glmnet)
library(survival)
library(tidyverse)
library(caret)
library(survival)
library(rms)
library(hdnom)
library(Publish)
library(ggpubr)
library(survminer)
library(survcomp)
library(Formula)
library(Hmisc)
library(lattice)
library(SparseM)
library(base)


rm(list=ls())


data1 <- read.csv("./survival_train4.csv")

dd <- datadist(data1)
options(datadist="dd")
f<-cph(Surv(time,event==1)~clinical.stage + Necrosis + 
         Tumor.size + Grade + Treatment  +DLR_score,data = data1,x=T,y=T,surv = T,u=60)
surv<-Survival(f)
nom <- nomogram(f, fun=list(function(x) surv(1*12, x), function(x) surv(2*12, x), function(x) surv(3*12, x),
                            function(x) surv(5*12, x)), lp=F,
                funlabel=c("1-year survival", "2-year survival",  "3-year survival", 
                           "5-year survival"),
                maxscale=100, fun.at=c(0.95, 0.8, 0.7,0.6,0.5, 0.4,0.3,0.2,0.1))
nom



#######

data2 <- read.csv("./survival_newDATA.csv")



dim(data2) 

head(data2)


library(nomogramFormula)

f2 <- cph(formula(Surv(time,event==0)~clinical.stage + Necrosis + 
                    Tumor.size + Grade + Treatment +DLR_score),data=data2,
         x=TRUE,y=TRUE,surv=TRUE,time.inc=3)
surv <- Survival(f2)
nomo <- nomogram(f2,
                 lp=TRUE,
                 fun=list(function(x) surv(12,x),
                          function(x) surv(12*3,x),
                          function(x) surv(12*5,x)),
                 funlabel=c("1-Year Survival Prob",
                            "3-Year Survival Prob",
                            "5-Year Survival Prob"))

results<-formula_lp(nomogram=nomo,power = 1)

points<-points_cal(formula = results$formula,lp = f$linear.predictors)
head(points)

prob6<-prob_cal(reg = f2,times = c(12,36,60))
head(prob6)


nomo
