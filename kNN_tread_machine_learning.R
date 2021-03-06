library(data.table); library(tidyr)
library(class)
library(dplyr)
library(lubridate)
library(seewave)
#Set directory
setwd("/Users/Pin-Wei/Documents/accelerometer_project/Actigraph/csv")

#===============================  <semicircle = 1> ====================================
semicircle_tread <- read.csv("Wrist_Tread_semi-circle.csv")
#change first column name to N
colnames(semicircle_tread)[1] <- "N"
semicircle_tread <- as.data.table(semicircle_tread)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
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
                            x.max = max(x),
                            y.max = max(y),
                            z.max = max(z),
                            x.min = min(x),
                            y.min = min(y),
                            z.min = min(z)
                            ), by = (seq(from = 1, to = nrow(semicircle_tread)) - 1) %/% n]
#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR
   

#Gerage data
semicircle_free <- read.csv("Wrist_freepush_semi-circle.csv")
#change first column name to N
colnames(semicircle_free)[1] <- "N"
semicircle_free <- as.data.table(semicircle_free)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
sc_feature_free <- semicircle_free[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
  ), by = (seq(from = 1, to = nrow(semicircle_free)) - 1) %/% n]


#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR

    # Filling the training label for each type of propulsion
c <- rep(1, length(sc_feature_tread$x.max))
d <- rep(1, length(sc_feature_free$x.max))
sc_feature_tread$cl <- c
sc_feature_free$cl <- d

rm(semicircle_free)
rm(semicircle_tread)
#===============================  <arc = 2> ====================================

arc_tread <- read.csv("Wrist_Tread_arc.csv")
#change first column name to N
colnames(arc_tread)[1] <- "N"
arc_tread <- as.data.table(arc_tread)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
arc_feature_tread <- arc_tread[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(arc_tread)) - 1) %/% n]
#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR


#Gerage data
arc_free <- read.csv("Wrist_freepush_arc.csv")
#change first column name to N
colnames(arc_free)[1] <- "N"
arc_free <- as.data.table(arc_free)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
arc_feature_free <- arc_free[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(arc_free)) - 1) %/% n]


#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR

# Filling the training label for each type of propulsion
c <- rep(2, length(arc_feature_tread$x.max))
d <- rep(2, length(arc_feature_free$x.max))
arc_feature_tread$cl <- c
arc_feature_free$cl <- d

rm(arc_free)
rm(arc_tread)
#===============================  <double_loop = 3; only 8119> =============================
dl_tread <- read.csv("Wrist_Tread_Double_Loop.csv")
#change first column name to N
colnames(dl_tread)[1] <- "N"
dl_tread <- as.data.table(dl_tread)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
dl_feature_tread <- dl_tread[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(dl_tread)) - 1) %/% n]
#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR


#Gerage data
dl_free <- read.csv("Wrist_freepush_Double-loop.csv")
#change first column name to N
colnames(dl_free)[1] <- "N"
dl_free <- as.data.table(dl_free)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
dl_feature_free <- dl_free[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(dl_free)) - 1) %/% n]


#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR

# Filling the training label for each type of propulsion
c <- rep(3, length(dl_feature_tread$x.max))
d <- rep(3, length(dl_feature_free$x.max))
dl_feature_tread$cl <- c
dl_feature_free$cl <- d

rm(dl_free)
rm(dl_tread)

#=============================== <singe_loop = 4> =============================
sl_tread <- read.csv("Wrist_Tread_Single_Loop.csv")
#change first column name to N
colnames(sl_tread)[1] <- "N"
sl_tread <- as.data.table(sl_tread)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
sl_feature_tread <- sl_tread[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(sl_tread)) - 1) %/% n]
#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR


#Gerage data
sl_free <- read.csv("Wrist_freepush_single_loop.csv")
#change first column name to N
colnames(sl_free)[1] <- "N"
sl_free <- as.data.table(sl_free)

# Function that returns Root Mean Squared Error
rmse <- function(error)
{
  sqrt(mean(error^2))
}

# Calculate features of treadmill data
n = 30
sl_feature_free <- sl_free[,.(
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
  x.max = max(x),
  y.max = max(y),
  z.max = max(z),
  x.min = min(x),
  y.min = min(y),
  z.min = min(z)
), by = (seq(from = 1, to = nrow(sl_free)) - 1) %/% n]


#No MEAN CROSSING RATE, No Energy, No Entrop, No ZCR

# Filling the training label for each type of propulsion
c <- rep(4, length(sl_feature_tread$x.max))
d <- rep(4, length(sl_feature_free$x.max))
sl_feature_tread$cl <- c
sl_feature_free$cl <- d

rm(sl_free)
rm(sl_tread)

#=======< combine all worksheets into training and testing > ==========
training_tread <- Reduce(function(x, y) rbind(x, y), list(
  sc_feature_tread,arc_feature_tread,dl_feature_tread,sl_feature_tread))
cl <- training_tread$cl
training_tread$cl <- NULL

test_free <- Reduce(function(x, y) rbind(x, y), list(
  sc_feature_free,arc_feature_free,dl_feature_free,sl_feature_free))

test_free_nocl <- Reduce(function(x, y) rbind(x, y), list(
  sc_feature_free,arc_feature_free,dl_feature_free,sl_feature_free))
test_free_nocl$cl <- NULL 



rm(sc_feature_tread,arc_feature_tread,dl_feature_tread,sl_feature_tread,
   sc_feature_free,arc_feature_free,dl_feature_free,sl_feature_free)


#machine learning set
library(class)


ml <- knn(train = training_tread, test = test_free_nocl, cl, k = 10)

ml <- as.data.frame(ml)

tr <- as.vector(ml$ml)
tr <- as.numeric(tr)
te <- as.vector(test_free$cl)

ans <- te - tr
plot(ans)
percentage <- sum(ans == 0)/length(ans)

