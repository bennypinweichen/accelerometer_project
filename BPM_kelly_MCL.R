library(data.table); library(tidyr)
setwd("/Users/Pin-Wei/Documents/dropbox/BPMpro data/Kelly's data")

#==== Wrist_Arching======
BPM_wrist <- read.csv("wrist_1.txt")
colnames(BPM_wrist)[1] <- "filtered_accx"
colnames(BPM_wrist)[2] <- "filtered_accy"
colnames(BPM_wrist)[3] <- "filtered_accz"
colnames(BPM_wrist)[4] <- "pressure"
colnames(BPM_wrist)[5] <- "raw_accx"
colnames(BPM_wrist)[6] <- "raw_accy"
colnames(BPM_wrist)[7] <- "raw_accz"
colnames(BPM_wrist)[8] <- "Q-w"
colnames(BPM_wrist)[9] <- "Q-x"
colnames(BPM_wrist)[10] <- "Q-y"
colnames(BPM_wrist)[11] <- "Q-z"
colnames(BPM_wrist)[12] <- "Peak_G"
colnames(BPM_wrist)[13] <- "Peak deg_s"
colnames(BPM_wrist)[14] <- "Height"
colnames(BPM_wrist)[15] <- "Power"
colnames(BPM_wrist)[16] <- "Rep numb"
colnames(BPM_wrist)[17] <- "Orientation_x"
colnames(BPM_wrist)[18] <- "Orientation_y"
colnames(BPM_wrist)[19] <- "Orientation_z"
colnames(BPM_wrist)[20] <- "spdofrot_x"
colnames(BPM_wrist)[21] <- "spdofrot_y"
colnames(BPM_wrist)[22] <- "spdofrot_z"
colnames(BPM_wrist)[23] <- "euler_x"
colnames(BPM_wrist)[24] <- "euler_y"
colnames(BPM_wrist)[25] <- "euler_z"
colnames(BPM_wrist)[26] <- "time_ms"
colnames(BPM_wrist)[27] <- "vertical_1"
colnames(BPM_wrist)[28] <- "vertical_2"
colnames(BPM_wrist)[29] <- "vertical_3"
colnames(BPM_wrist)[30] <- "rotation_delta"
colnames(BPM_wrist)[31] <- "adj_vert_1"
colnames(BPM_wrist)[32] <- "time"

BPM_wrist_arching <- BPM_Wrist
rm(BPM_wrist)
#================== BPM_Elbow_arching =======


BPM_wrist <- read.csv("arm 1_2016-12-05_02-12-58-PM.txt")
colnames(BPM_wrist)[1] <- "filtered_accx"
colnames(BPM_wrist)[2] <- "filtered_accy"
colnames(BPM_wrist)[3] <- "filtered_accz"
colnames(BPM_wrist)[4] <- "pressure"
colnames(BPM_wrist)[5] <- "raw_accx"
colnames(BPM_wrist)[6] <- "raw_accy"
colnames(BPM_wrist)[7] <- "raw_accz"
colnames(BPM_wrist)[8] <- "Q-w"
colnames(BPM_wrist)[9] <- "Q-x"
colnames(BPM_wrist)[10] <- "Q-y"
colnames(BPM_wrist)[11] <- "Q-z"
colnames(BPM_wrist)[12] <- "Peak_G"
colnames(BPM_wrist)[13] <- "Peak deg_s"
colnames(BPM_wrist)[14] <- "Height"
colnames(BPM_wrist)[15] <- "Power"
colnames(BPM_wrist)[16] <- "Rep numb"
colnames(BPM_wrist)[17] <- "Orientation_x"
colnames(BPM_wrist)[18] <- "Orientation_y"
colnames(BPM_wrist)[19] <- "Orientation_z"
colnames(BPM_wrist)[20] <- "spdofrot_x"
colnames(BPM_wrist)[21] <- "spdofrot_y"
colnames(BPM_wrist)[22] <- "spdofrot_z"
colnames(BPM_wrist)[23] <- "euler_x"
colnames(BPM_wrist)[24] <- "euler_y"
colnames(BPM_wrist)[25] <- "euler_z"
colnames(BPM_wrist)[26] <- "time_ms"
colnames(BPM_wrist)[27] <- "vertical_1"
colnames(BPM_wrist)[28] <- "vertical_2"
colnames(BPM_wrist)[29] <- "vertical_3"
colnames(BPM_wrist)[30] <- "rotation_delta"
colnames(BPM_wrist)[31] <- "adj_vert_1"
colnames(BPM_wrist)[32] <- "time"

BPM_arm_arching <- BPM_wrist
rm(BPM_wrist)
