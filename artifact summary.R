setwd("~/Documents/ERP Analyses/artifacts/data")

a<-read.csv("artifacts.csv")

library(psych)

describe(a)

describeBy(a, group = a$Dx)

library(reshape)

al<-melt(a, id = c("CABIL","Dx"))

describe(al)

describeBy(al, group = al$Dx)

t.test(al[which(al$Dx == "22q"), "value"], al[which(al$Dx == "TD"), "value"])

summary(lm(value~variable, data = al, na.action = na.omit))