library(dplyr)
mech_df <- read.csv(file = '../Mod_15/MechaCar_Statistical_Analysis/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
head(mech_df)

reg <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mech_df)
summary(reg)

sus_df <- read.csv(file = '../Mod_15/MechaCar_Statistical_Analysis/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
head(sus_df)

total_summary <- sus_df %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

lot_summary <- sus_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

t.test(sus_df$PSI, mu=1500)

t.test(subset(sus_df,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)

t.test(subset(sus_df,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)

t.test(subset(sus_df,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

