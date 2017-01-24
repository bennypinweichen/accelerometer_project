library(data.table); library(tidyr)
library(class)
library(dplyr)
library(lubridate)
library(seewave)
#Set directory
setwd("/Users/Pin-Wei/Documents/accelerometer_project/Actigraph/csv")
semicircle_tread <- read.csv("Wrist_Tread_semi-circle.csv")
#change first column name to N
colnames(semicircle_tread)[1] <- "N"
semicircle_tread <- as.data.table(semicircle)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features by every 
n = 30
sc_feature_tread <- semicircle_tread[,.(
                            x.mean = mean(x),
                            y.mean = mean(y),
                            z.mean = mean(z),
                            x.sd = sd(x),
                            y.sd = sd(y),
                            z.sd = sd(z),
                            x.rmse = rmse(x),
                            y.rmse = rmse(y),
                            z.rmse = rmse(z),
                            x.mad = mad(x),
                            y.mad = mad(y),
                            z.mad = mad(z),
                            #x.zcr = zcr(x, f = 30),
                            #y.zcr = zcr(y, f = 30),
                            #z.zcr = zcr(z, f = 30),
                            x.range = range(x),
                            y.range = range(y),
                            z.range = range(z)
                            ), by = (seq(nrow(semicircle_tread)))%/% n]

#No MEAN CROSSING RATE, No Energy, No Entropy

oneswinmean <- colMeans(matrix(wb$Mag.Right, nrow=30))
oneswinsd <- colSds(matrix(wb$Mag.Right, nrow=30))


wb_1 <- wb[!myvar]
dp_train <- wb_1[7655:7806,]
dp_test <- wb_1[7806:7957,]


library(class)
dp_test_pred <- knn(train = dp_train, test = dp_test, cl = "double loop", k = 10)
