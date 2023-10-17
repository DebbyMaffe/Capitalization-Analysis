# load packages
library(readxl)
library(magrittr)
library(dplyr)
library(visdat)
library(naniar)
library(DataExplorer)
library(ggplot2)
library(ggpubr)
library(huxtable)
library(class)
library(factoextra)
library(reshape2)
library(tidyverse)
library(ggridges)

rm(list=ls())

# load dataset
C2_2016 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2016.xlsx", 
                      sheet = "Results")
C2_2017 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2017.xlsx", 
                      sheet = "Results")
C2_2018 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2018.xlsx", 
                      sheet = "Results")
C2_2019 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2019.xlsx", 
                      sheet = "Results")
C2_2020 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2020.xlsx", 
                      sheet = "Results")
C2_2021 <- read_excel("C:/Users/debby/OneDrive/Desktop/UniCatt/1st Y/Banking/1st_Assignment/C2_2021.xlsx", 
                      sheet = "Results")

# column names of the dataset
colnames(C2_2016)


# change the column names
colnames(C2_2016) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")
colnames(C2_2017) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")
colnames(C2_2018) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")
colnames(C2_2019) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")
colnames(C2_2020) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")
colnames(C2_2021) <- c("company", "country", "consolidation_code", "specialisation", "RWAs", "RWAs_over_totAssets", "totEquity_over_RWAs", "totEquity_over_totAssets", "totAssets", "totEquity", "Basel3_leverage_ratio", "Tier1", "Tier1_ratio", "Tier2", "level3assets_over_CET1", "commonEquity_over_coreTier1_ratio", "commonEquity", "retainedEarnings", "otherComprIncome", "RWAs_growth", "CET1_growth", "commonEquity_over_CET1", "totCapRatio")

# list types for each attribute
sapply(C2_2016, class)

# inspect each dataset
glimpse(C2_2016)

data_16 <- C2_2016 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())

data_17 <- C2_2017 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())

data_18 <- C2_2018 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())

data_19 <- C2_2019 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())

data_20 <- C2_2020 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())

data_21 <- C2_2021 %>% 
  # from numeric to double
  mutate_if(is.numeric, as.double) %>%
  dplyr::select(RWAs, RWAs_over_totAssets, totEquity_over_RWAs, totEquity_over_totAssets,
                totAssets, totEquity, Basel3_leverage_ratio, Tier1, Tier1_ratio, Tier2, 
                level3assets_over_CET1, commonEquity_over_coreTier1_ratio, commonEquity, 
                retainedEarnings, otherComprIncome, RWAs_growth, CET1_growth,
                commonEquity_over_CET1, totCapRatio, everything()) %>% 
  # from character to factor
  mutate_if(is.character, as.factor) %>% 
  dplyr::select(company, country, consolidation_code, specialisation, everything())


#----------------
# 2016 y
head(data_16)

# Overview of dataset
plot_intro(data_16, title = "Dataset Information (2016)")
# Missing vs Presence
vis_miss(data_16) +
  labs(y = "Number of observations") + 
  ggtitle("Analysis of Presence and Absence Values (2016)") +
  theme(plot.title = element_text(hjust = 0.5))  #to center
# % of Missing Values
gg_miss_var(data_16, show_pct = TRUE) + 
  ggtitle("% of Missing Values (2016)") +
  theme(plot.title = element_text(hjust = 0.5))  #to center
# Intersection of Missing Values
gg_miss_upset(data_16, nsets = n_var_miss(data_16))

# Bar plot for Specialisation 
ggplot(data_16, aes(x = specialisation, fill = specialisation)) + 
  geom_bar(width = 0.7, position = "dodge") +
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.30) +
  labs(x = "Specialisation", y = "Number of observations") + 
  ggtitle("Analysis of Specialisation (2016)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial Bank", "Investment Bank")) +
  theme(plot.title = element_text(hjust = 0.5))  #to center

# Analysis of Specialisation across Country
ggplot(data_16, aes(x = country, fill = specialisation)) + 
  geom_bar(position = position_dodge()) +
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.4, hjust = 0.7, size = 2.5) +
  labs(x = "Country", y = "Number of observations") + 
  ggtitle("Analysis of Specialization (2016)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center

# Analysis of TotEquity across Country
te_16 <- ggplot(data_16, aes(x = country, y = totEquity, color = specialisation, size = totEquity)) +
  geom_point(alpha=0.7) + 
  labs(x = 'Country', y = 'Total Equity') + 
  ggtitle("Analysis of Total Equity (2016)") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center
# Analysis of TotAssets across Country
ta_16 <- ggplot(data_16, aes(x = country, y = totAssets, color = specialisation, size = totAssets)) +
  geom_point(alpha=0.7) + 
  labs(x = 'Country', y = 'Total Assets') + 
  ggtitle("Analysis of Total Assets (2016)") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center
# Analysis of Retained Earnings across Country
re_16 <- ggplot(data_16, aes(x = country, y = retainedEarnings, color = specialisation, size = retainedEarnings)) +
  geom_point(alpha=0.7) + 
  labs(x = 'Country', y = 'Retained Earnings') + 
  ggtitle("Analysis of Retained Earnings (2016)") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center
# Analysis of Other Comprehensive Income across Country
ci_16 <- ggplot(data_16, aes(x = country, y = otherComprIncome, color = specialisation, size = otherComprIncome)) +
  geom_point(alpha=0.7) + 
  labs(x = 'Country', y = 'Other Comprehensive Income') + 
  ggtitle("Analysis of Other Comprehensive Income (2016)") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center

ggarrange(te_16, ta_16, re_16, ci_16, ncol = 2, nrow = 2)

# Associations between CommonEquity and Specialisation (DENSITY)
ggplot(data_16, aes(x = commonEquity, fill = specialisation)) + 
  geom_density(adjust = 1.5) + 
  facet_wrap(~ specialisation) + 
  labs(title = "Common Equity vs Specialisation (2016)", x = "Common Equity", y = "Density") +
  theme(plot.title = element_text(hjust = 0.5), legend.position="none")  #to center

# Associations between totEquity and Specialisation (DENSITY)
ggplot(data_16, aes(x = totEquity, fill = specialisation)) + 
  geom_density(adjust = 1.5) + 
  facet_wrap(~ specialisation) + 
  labs(title = "Total Equity vs Specialisation (2016)", x = "Total Equity", y = "Density") +
  theme(plot.title = element_text(hjust = 0.5), legend.position="none")  #to center

# Distribution of Total Equity wrt Country
ggplot(data_16, aes(x = country, y = totEquity))+
  geom_boxplot(fill = "bisque")+
  labs(x = 'Country', y = 'Total Equity') + 
  ggtitle("Distribution of Total Equity (2016)") +
  facet_grid(~ specialisation) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center

# Distribution of Total Assets wrt Specialisation
ggplot(data_16, aes(x = specialisation, y = totAssets))+
  geom_boxplot(fill = "bisque")+
  labs(x = 'Specialisation', y = 'Total Assets') + 
  ggtitle("Distribution of Total Assets (2016)") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center

#------------------------
# INTERSECTION
datacommon <- intersect(data_16$company, data_17$company)
datacommon <- intersect(datacommon, data_18$company)
datacommon <- intersect(datacommon, data_19$company)
datacommon <- intersect(datacommon, data_20$company)
datacommon <- intersect(datacommon, data_21$company)

data_16_new <- data_16[data_16$company %in% datacommon, ]
data_17_new <- data_17[data_17$company %in% datacommon, ]
data_18_new <- data_18[data_18$company %in% datacommon, ]
data_19_new <- data_19[data_19$company %in% datacommon, ]
data_20_new <- data_20[data_20$company %in% datacommon, ]
data_21_new <- data_21[data_21$company %in% datacommon, ]

data_16_Comm <- data_16_new %>% filter(specialisation == "Commercial bank")
data_16_Inv <- data_16_new %>% filter(specialisation == "Investment bank")
data_17_Comm <- data_17_new %>% filter(specialisation == "Commercial bank")
data_17_Inv <- data_17_new %>% filter(specialisation == "Investment bank")
data_18_Comm <- data_18_new %>% filter(specialisation == "Commercial bank")
data_18_Inv <- data_18_new %>% filter(specialisation == "Investment bank")
data_19_Comm <- data_19_new %>% filter(specialisation == "Commercial bank")
data_19_Inv <- data_19_new %>% filter(specialisation == "Investment bank")
data_20_Comm <- data_20_new %>% filter(specialisation == "Commercial bank")
data_20_Inv <- data_20_new %>% filter(specialisation == "Investment bank")
data_21_Comm <- data_21_new %>% filter(specialisation == "Commercial bank")
data_21_Inv <- data_21_new %>% filter(specialisation == "Investment bank")


# Bar plot for Specialisation
ggplot(data_16_new, aes(x = specialisation, fill = specialisation)) + 
  geom_bar(width = 0.8, position = "dodge") +
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.30) +
  labs(x = "Specialisation", y = "Number of observations") + 
  ggtitle("Analysis of Specialisation (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial Bank", "Investment Bank")) +
  theme(plot.title = element_text(hjust = 0.5))  #to center

huxtable(Tot_Banks = nrow(data_16_new), Commercial_Banks = sum(data_16_new$specialisation == 'Commercial bank'), 
         Investment_Banks = sum(data_16_new$specialisation == 'Investment bank'))

# Analysis of Specialisation across Country
ggplot(data_16_new, aes(x = country, fill = specialisation)) + 
  geom_bar(position = position_dodge()) +
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.4, hjust = 0.7, size = 2.5) +
  labs(x = "Country", y = "Number of observations") + 
  ggtitle("Analysis of Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  #to center


# EQUITY COMPARISON
year <- c(2016, 2017, 2018, 2019, 2020, 2021)
totEquity <- c(mean(data_16_new$totEquity), mean(data_17_new$totEquity), 
               mean(data_18_new$totEquity), mean(data_19_new$totEquity), 
               mean(data_20_new$totEquity), mean(data_21_new$totEquity))
newequity <- data.frame(year, totEquity)
newequity$year <- factor(newequity$year,levels = newequity$year)
# Average of Total Equity (2016-2021)
te <- ggplot(mapping = aes(x = newequity$year)) +
  geom_bar(aes(y = after_stat(totEquity), fill = newequity$year), 
           width = 0.6, show.legend = FALSE, color = "orange", fill = "bisque") +
  labs(title = "Average of Total Equity (2016-2021)", x = "Year", y = "Average Total Equity" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newequity) 

totEquity_Comm <- c(mean(data_16_Comm$totEquity), mean(data_17_Comm$totEquity), 
                    mean(data_18_Comm$totEquity), mean(data_19_Comm$totEquity), 
                    mean(data_20_Comm$totEquity), mean(data_21_Comm$totEquity))
totEquity_Inv <- c(mean(data_16_Inv$totEquity), mean(data_17_Inv$totEquity), 
                    mean(data_18_Inv$totEquity), mean(data_19_Inv$totEquity), 
                    mean(data_20_Inv$totEquity), mean(data_21_Inv$totEquity))
tabE <- data.frame(year, totEquity_Comm, totEquity_Inv)
tabE$year <- factor(tabE$year,levels = tabE$year)
aggE <- melt(tabE, id = 'year')
# Average of Total Equity wrt Specialisation (2016-2021)
te2 <- ggplot(aggE, aes(x = year, y = value, fill = variable)) + 
  geom_col(width = 0.8, position = 'dodge') +
  labs(x = "Year", y = "Average of Total Equity") + 
  ggtitle("Average of Total Equity vs Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))  #to center


# TOT.ASSETS COMPARISON
totAssets <- c(mean(data_16_new$totAssets), mean(data_17_new$totAssets), 
               mean(data_18_new$totAssets), mean(data_19_new$totAssets), 
               mean(data_20_new$totAssets), mean(data_21_new$totAssets))
newassets <- data.frame(year, totAssets)
newassets$year <- factor(newassets$year,levels = newassets$year)
# Average of Total Assets (2016-2021)
ta <- ggplot(mapping = aes(x = newassets$year)) +
  geom_bar(aes(y = after_stat(totAssets), fill = newassets$year), 
           width = 0.6, show.legend = FALSE, color = "deepskyblue3", fill = "darkslategray2") +
  labs(title = "Average of Total Assets (2016-2021)", x = "Year", y = "Average Total Assets" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newassets) 

totAssets_Comm <- c(mean(data_16_Comm$totAssets), mean(data_17_Comm$totAssets), 
                    mean(data_18_Comm$totAssets), mean(data_19_Comm$totAssets), 
                    mean(data_20_Comm$totAssets), mean(data_21_Comm$totAssets))
totAssets_Inv <- c(mean(data_16_Inv$totAssets), mean(data_17_Inv$totAssets), 
                   mean(data_18_Inv$totAssets), mean(data_19_Inv$totAssets), 
                   mean(data_20_Inv$totAssets), mean(data_21_Inv$totAssets))
tabA <- data.frame(year, totAssets_Comm, totAssets_Inv)
tabA$year <- factor(tabA$year,levels = tabA$year)
aggA <- melt(tabA, id = 'year')
# Average of Total Assets wrt Specialisation (2016-2021)
ta2 <- ggplot(aggA, aes(x = year, y = value, fill = variable)) + 
  geom_col(width = 0.8, position = 'dodge') +
  scale_y_continuous(labels = scales::comma) +
  labs(x = "Year", y = "Average of Total Assets") + 
  ggtitle("Average of Total Assets vs Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))  #to center


# RETAINED EARNINGS COMPARISON
RetEarnings <- c(mean(data_16_new[!is.na(data_16_new$retainedEarnings),]$retainedEarnings), 
                 mean(data_17_new[!is.na(data_17_new$retainedEarnings),]$retainedEarnings), 
               mean(data_18_new[!is.na(data_18_new$retainedEarnings),]$retainedEarnings), 
               mean(data_19_new[!is.na(data_19_new$retainedEarnings),]$retainedEarnings), 
               mean(data_20_new[!is.na(data_20_new$retainedEarnings),]$retainedEarnings), 
               mean(data_21_new[!is.na(data_21_new$retainedEarnings),]$retainedEarnings))
newretEarn <- data.frame(year, RetEarnings)
newretEarn$year <- factor(newretEarn$year,levels = newretEarn$year)

sum(is.na(na.omit(newretEarn)) == TRUE)
# Average of Retained Earnings (2016-2021)
re <- ggplot(mapping = aes(x = newretEarn$year)) +
  geom_bar(aes(y = after_stat(RetEarnings), fill = newretEarn$year), 
           width = 0.6, show.legend = FALSE, color = "forestgreen", fill = "lightgreen") +
  labs(title = "Average of Retained Earnings (2016-2021)", x = "Year", y = "Average Retained Earnings" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newretEarn) 

retEarn_Comm <- c(mean(data_16_Comm[!is.na(data_16_Comm$retainedEarnings),]$retainedEarnings), 
                  mean(data_17_Comm[!is.na(data_17_Comm$retainedEarnings),]$retainedEarnings), 
                    mean(data_18_Comm[!is.na(data_18_Comm$retainedEarnings),]$retainedEarnings), 
                  mean(data_19_Comm[!is.na(data_19_Comm$retainedEarnings),]$retainedEarnings), 
                    mean(data_20_Comm[!is.na(data_20_Comm$retainedEarnings),]$retainedEarnings), 
                  mean(data_21_Comm[!is.na(data_21_Comm$retainedEarnings),]$retainedEarnings))
retEarn_Inv <- c(mean(data_16_Inv$retainedEarnings), mean(data_17_Inv$retainedEarnings), 
                   mean(data_18_Inv$retainedEarnings), mean(data_19_Inv$retainedEarnings), 
                   mean(data_20_Inv$retainedEarnings), mean(data_21_Inv$retainedEarnings))
tabRE <- data.frame(year, retEarn_Comm, retEarn_Inv)
tabRE$year <- factor(tabRE$year,levels = tabRE$year)
aggRE <- melt(tabRE, id = 'year')
# Average of Retained Earnings wrt Specialisation (2016-2021)
re2 <- ggplot(aggRE, aes(x = year, y = value, fill = variable)) + 
  geom_col(width = 0.8, position = 'dodge') +
  scale_y_continuous(labels = scales::comma) +
  labs(x = "Year", y = "Average of Retained Earnings") + 
  ggtitle("Average of Retained Earnings vs Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))  #to center


# OTHER COMPREHENSIVE INCOME COMPARISON
otherCompInc <- c(mean(data_16_new[!is.na(data_16_new$otherComprIncome),]$otherComprIncome), 
                  mean(data_17_new[!is.na(data_17_new$otherComprIncome),]$otherComprIncome), 
                  mean(data_18_new[!is.na(data_18_new$otherComprIncome),]$otherComprIncome), 
                  mean(data_19_new[!is.na(data_19_new$otherComprIncome),]$otherComprIncome), 
                  mean(data_20_new[!is.na(data_20_new$otherComprIncome),]$otherComprIncome), 
                  mean(data_21_new[!is.na(data_21_new$otherComprIncome),]$otherComprIncome))
newCompInc <- data.frame(year, otherCompInc)
newCompInc$year <- factor(newCompInc$year,levels = newCompInc$year)
# Average of Other Comprehensive Income (2016-2021)
ci <- ggplot(mapping = aes(x = newCompInc$year)) +
  geom_bar(aes(y = after_stat(otherCompInc), fill = newCompInc$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Other Comprehnsive Income (2016-2021)", x = "Year", y = "Average Other Comprehensive Income" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newCompInc) 

compInc_Comm <- c(mean(data_16_Comm[!is.na(data_16_Comm$otherComprIncome),]$otherComprIncome), 
                  mean(data_17_Comm[!is.na(data_17_Comm$otherComprIncome),]$otherComprIncome), 
                  mean(data_18_Comm[!is.na(data_18_Comm$otherComprIncome),]$otherComprIncome), 
                  mean(data_19_Comm[!is.na(data_19_Comm$otherComprIncome),]$otherComprIncome), 
                  mean(data_20_Comm[!is.na(data_20_Comm$otherComprIncome),]$otherComprIncome), 
                  mean(data_21_Comm[!is.na(data_21_Comm$otherComprIncome),]$otherComprIncome))
compInc_Inv <- c(mean(data_16_Inv[!is.na(data_16_Inv$otherComprIncome),]$otherComprIncome), 
                 mean(data_17_Inv[!is.na(data_17_Inv$otherComprIncome),]$otherComprIncome), 
                 mean(data_18_Inv[!is.na(data_18_Inv$otherComprIncome),]$otherComprIncome), 
                 mean(data_19_Inv[!is.na(data_19_Inv$otherComprIncome),]$otherComprIncome), 
                 mean(data_20_Inv[!is.na(data_20_Inv$otherComprIncome),]$otherComprIncome), 
                 mean(data_21_Inv[!is.na(data_21_Inv$otherComprIncome),]$otherComprIncome))
tabCI <- data.frame(year, compInc_Comm, compInc_Inv)
tabCI$year <- factor(tabCI$year,levels = tabCI$year)
aggCI <- melt(tabCI, id = 'year')
# Average of Other Comprehensive Income wrt Specialisation (2016-2021)
ci2 <- ggplot(aggCI, aes(x = year, y = value, fill = variable)) + 
  geom_col(width = 0.8, position = 'dodge') +
  scale_y_continuous(labels = scales::comma) +
  labs(x = "Year", y = "Average of Other Comprehensive Income") + 
  ggtitle("Average of Other Comprehensive Income vs Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))  #to center

# comparison of TE, TA, RE, OCI
ggarrange(te, ta, re, ci, ncol = 2, nrow = 2)
ggarrange(te2, ta2, re2, ci2, ncol = 2, nrow = 2)


# CAPITALISATION COMPARISON
year <- c(2016, 2017, 2018, 2019, 2020, 2021)
totCap <- c(mean(data_16_new[!is.na(data_16_new$totEquity_over_RWAs),]$totEquity_over_RWAs), 
            mean(data_17_new[!is.na(data_17_new$totEquity_over_RWAs),]$totEquity_over_RWAs), 
            mean(data_18_new[!is.na(data_18_new$totEquity_over_RWAs),]$totEquity_over_RWAs), 
            mean(data_19_new[!is.na(data_19_new$totEquity_over_RWAs),]$totEquity_over_RWAs), 
            mean(data_20_new[!is.na(data_20_new$totEquity_over_RWAs),]$totEquity_over_RWAs), 
            mean(data_21_new[!is.na(data_21_new$totEquity_over_RWAs),]$totEquity_over_RWAs))

newCapital <- data.frame(year, totCap)
newCapital$year <- factor(newCapital$year,levels = newCapital$year)
# Analysis of Capitalisation (2016-2021)
ggplot(mapping = aes(x = newCapital$year)) +
  geom_bar(aes(y = after_stat(totCap), fill = newCapital$year), 
           width = 0.6, show.legend = FALSE, color = "plum4", fill = "lavender") +
  labs(title = "Analysis of Capitalisation (2016-2021)", x = "Year", y = "Capitalisation" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newCapital) 

totCap_Comm <- c(mean(data_16_Comm[!is.na(data_16_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs), 
                mean(data_17_Comm[!is.na(data_17_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs), 
                mean(data_18_Comm[!is.na(data_18_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs), 
                mean(data_19_Comm[!is.na(data_19_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs), 
                mean(data_20_Comm[!is.na(data_20_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs), 
                mean(data_21_Comm[!is.na(data_21_Comm$totEquity_over_RWAs),]$totEquity_over_RWAs))
totCap_Inv <- c(mean(data_16_Inv[!is.na(data_16_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs), 
               mean(data_17_Inv[!is.na(data_17_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs), 
               mean(data_18_Inv[!is.na(data_18_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs), 
               mean(data_19_Inv[!is.na(data_19_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs), 
               mean(data_20_Inv[!is.na(data_20_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs), 
               mean(data_21_Inv[!is.na(data_21_Inv$totEquity_over_RWAs),]$totEquity_over_RWAs))
tabCAP <- data.frame(year, totCap_Comm, totCap_Inv)
tabCAP$year <- factor(tabCAP$year,levels = tabCAP$year)
aggCAP <- melt(tabCAP, id = 'year')
# Average of Capitalisation wrt Specialisation (2016-2021)
ggplot(aggCAP, aes(x = year, y = value, fill = variable)) + 
  geom_col(width = 0.8, position = 'dodge') +
  labs(x = "Year", y = "Average of Capitalisation") + 
  ggtitle("Average of Capitalisation vs Specialization (2016-2021)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial bank", "Investment bank")) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))  #to center


# WELL- CAPITALISED
# LEVERAGE RATIO (Tier1/Tot Assets >= 3%)

data_16_comp <- data_16_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
data_17_comp <- data_17_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
data_18_comp <- data_18_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
data_19_comp <- data_19_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
data_20_comp <- data_20_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
data_21_comp <- data_21_new %>% mutate(Basel3_leverageRatio_comp = Tier1/totAssets*100)
sum(is.na(data_21_comp$Basel3_leverageRatio_comp) == TRUE)
sum(is.na(data_21_new$Basel3_leverage_ratio) == TRUE)
#lr <- data.frame(data_21_comp$Basel3_leverageRatio_comp, data_21_comp$Basel3_leverage_ratio)  

# if data is NOT na in original but na in computed, save original one
for(i in 1:183){
  if((is.na(data_16_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_16_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_16_comp[i,]$Basel3_leverageRatio_comp <- data_16_comp[i,]$Basel3_leverage_ratio 
  }
  if((is.na(data_17_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_17_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_17_comp[i,]$Basel3_leverageRatio_comp <- data_17_comp[i,]$Basel3_leverage_ratio
  }
  if((is.na(data_18_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_18_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_18_comp[i,]$Basel3_leverageRatio_comp <- data_18_comp[i,]$Basel3_leverage_ratio
  }
  if((is.na(data_19_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_19_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_19_comp[i,]$Basel3_leverageRatio_comp <- data_19_comp[i,]$Basel3_leverage_ratio
  }
  if((is.na(data_20_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_20_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_20_comp[i,]$Basel3_leverageRatio_comp <- data_20_comp[i,]$Basel3_leverage_ratio
  }
  if((is.na(data_21_comp[i,]$Basel3_leverage_ratio) == FALSE) & (is.na(data_21_comp[i,]$Basel3_leverageRatio_comp) == TRUE)){
    data_21_comp[i,]$Basel3_leverageRatio_comp <- data_21_comp[i,]$Basel3_leverage_ratio
  }
}

sum(data_16_comp[!is.na(data_16_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_16 <- subset(data_16_comp, Basel3_leverageRatio_comp >= 3) 
sum(data_17_comp[!is.na(data_17_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_17 <- subset(data_17_comp, Basel3_leverageRatio_comp >= 3) 
sum(data_18_comp[!is.na(data_18_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_18 <- subset(data_18_comp, Basel3_leverageRatio_comp >= 3) 
sum(data_19_comp[!is.na(data_19_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_19 <- subset(data_19_comp, Basel3_leverageRatio_comp >= 3) 
sum(data_20_comp[!is.na(data_20_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_20 <- subset(data_20_comp, Basel3_leverageRatio_comp >= 3) 
sum(data_21_comp[!is.na(data_21_comp$Basel3_leverageRatio_comp),]$Basel3_leverageRatio_comp >= 3)
T1LR_21 <- subset(data_21_comp, Basel3_leverageRatio_comp >= 3) 

commonT1 <- intersect(T1LR_16$company, T1LR_17$company)
commonT1 <- intersect(commonT1, T1LR_18$company)
commonT1 <- intersect(commonT1, T1LR_19$company)
commonT1 <- intersect(commonT1, T1LR_20$company)
commonT1 <- intersect(commonT1, T1LR_21$company)

data_16_T1 <- data_16_new[data_16_new$company %in% commonT1, ]
data_17_T1 <- data_17_new[data_17_new$company %in% commonT1, ]
data_18_T1 <- data_18_new[data_18_new$company %in% commonT1, ]
data_19_T1 <- data_19_new[data_19_new$company %in% commonT1, ]
data_20_T1 <- data_20_new[data_20_new$company %in% commonT1, ]
data_21_T1 <- data_21_new[data_21_new$company %in% commonT1, ]

#GENERAL
basel3g <- c(mean(data_16_comp[!is.na(data_16_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp), 
             mean(data_17_comp[!is.na(data_17_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp), 
             mean(data_18_comp[!is.na(data_18_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp), 
             mean(data_19_comp[!is.na(data_19_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp), 
             mean(data_20_comp[!is.na(data_20_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp), 
             mean(data_21_comp[!is.na(data_21_comp$Basel3_leverage_ratio),]$Basel3_leverageRatio_comp))
newbas <- data.frame(year, basel3g)
newbas$year <- factor(newbas$year, levels = newbas$year)
# Average of Basel 3 Leverage Ratio (2016-2021)
ggplot(mapping = aes(x = newbas$year)) +
  geom_bar(aes(y = after_stat(basel3g), fill = newbas$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Basel 3 Leverage Ratio (2016-2021)", x = "Year", y = "Average Basel 3 Leverage Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newbas) 

#FOR WELL CAP BANKS
basel3 <- c(mean(data_16_T1$Basel3_leverageRatio_comp), 
            mean(data_17_T1$Basel3_leverageRatio_comp), 
            mean(data_18_T1$Basel3_leverageRatio_comp), 
            mean(data_19_T1$Basel3_leverageRatio_comp), 
            mean(data_20_T1$Basel3_leverageRatio_comp), 
            mean(data_21_T1$Basel3_leverageRatio_comp))
newbas <- data.frame(year, basel3)
newbas$year <- factor(newbas$year,levels = newbas$year)
# Average of Basel 3 Leverage Ratio (2016-2021) WELL-CAP Banks
ggplot(mapping = aes(x = newbas$year)) +
  geom_bar(aes(y = after_stat(basel3), fill = newbas$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Basel 3 Leverage Ratio (2016-2021) for well capitalised banks", x = "Year", y = "Average Basel 3 Leverage Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newbas) 

# TIER1 RATIO (Tier1 / RWAs >= 6%)
sum(data_16_new[!is.na(data_16_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_16 <- subset(data_16_new, Tier1_ratio >= 6)
sum(data_17_new[!is.na(data_17_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_17 <- subset(data_17_new, Tier1_ratio >= 6)
sum(data_18_new[!is.na(data_18_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_18 <- subset(data_18_new, Tier1_ratio >= 6)
sum(data_19_new[!is.na(data_19_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_19 <- subset(data_19_new, Tier1_ratio >= 6)
sum(data_20_new[!is.na(data_20_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_20 <- subset(data_20_new, Tier1_ratio >= 6)
sum(data_21_new[!is.na(data_21_new$Tier1_ratio),]$Tier1_ratio >= 6)
T1R_21 <- subset(data_21_new, Tier1_ratio >= 6)

commonT1R <- intersect(T1R_16$company, T1R_17$company)
commonT1R <- intersect(commonT1R, T1R_18$company)
commonT1R <- intersect(commonT1R, T1R_19$company)
commonT1R <- intersect(commonT1R, T1R_20$company)
commonT1R <- intersect(commonT1R, T1R_21$company)

data_16_T1R <- data_16_new[data_16_new$company %in% commonT1R, ]
data_17_T1R <- data_17_new[data_17_new$company %in% commonT1R, ]
data_18_T1R <- data_18_new[data_18_new$company %in% commonT1R, ]
data_19_T1R <- data_19_new[data_19_new$company %in% commonT1R, ]
data_20_T1R <- data_20_new[data_20_new$company %in% commonT1R, ]
data_21_T1R <- data_21_new[data_21_new$company %in% commonT1R, ]

#GENERAL
t1ratiog <- c(mean(data_16_new[!is.na(data_16_new$Tier1_ratio),]$Tier1_ratio), 
              mean(data_17_new[!is.na(data_17_new$Tier1_ratio),]$Tier1_ratio), 
              mean(data_18_new[!is.na(data_18_new$Tier1_ratio),]$Tier1_ratio), 
              mean(data_19_new[!is.na(data_19_new$Tier1_ratio),]$Tier1_ratio), 
              mean(data_20_new[!is.na(data_20_new$Tier1_ratio),]$Tier1_ratio), 
              mean(data_21_new[!is.na(data_21_new$Tier1_ratio),]$Tier1_ratio))
newt1g <- data.frame(year, t1ratiog)
newt1g$year <- factor(newt1g$year,levels = newt1g$year)
# Average of Tier 1 Ratio (2016-2021)
ggplot(mapping = aes(x = newt1g$year)) +
  geom_bar(aes(y = after_stat(t1ratiog), fill = newt1g$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Tier 1 Ratio (2016-2021)", x = "Year", y = "Average Tier 1 Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newt1g) 

#FOR WELL CAP BANKS
t1ratio <- c(mean(data_16_T1R[!is.na(data_16_T1R$Tier1_ratio),]$Tier1_ratio), 
             mean(data_17_T1R[!is.na(data_17_T1R$Tier1_ratio),]$Tier1_ratio), 
             mean(data_18_T1R[!is.na(data_18_T1R$Tier1_ratio),]$Tier1_ratio), 
             mean(data_19_T1R[!is.na(data_19_T1R$Tier1_ratio),]$Tier1_ratio), 
             mean(data_20_T1R[!is.na(data_20_T1R$Tier1_ratio),]$Tier1_ratio), 
             mean(data_21_T1R[!is.na(data_21_T1R$Tier1_ratio),]$Tier1_ratio))
newt1 <- data.frame(year, t1ratio)
newt1$year <- factor(newt1$year,levels = newt1$year)
# Average of Tier 1 Ratio (2016-2021) WELL-CAP Banks
ggplot(mapping = aes(x = newt1$year)) +
  geom_bar(aes(y = after_stat(t1ratio), fill = newt1$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Tier 1 Ratio (2016-2021) for well cap banks", x = "Year", y = "Average Tier 1 Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newt1) 

# TOTAL CAPITAL RATIO (Total Capital / RWAs >= 10%)
sum(data_16_new[!is.na(data_16_new$totCapRatio),]$totCapRatio >= 10)
TCR_16 <- subset(data_16_new, totCapRatio >= 10)
sum(data_17_new[!is.na(data_17_new$totCapRatio),]$totCapRatio >= 10)
TCR_17 <- subset(data_17_new, totCapRatio >= 10)
sum(data_18_new[!is.na(data_18_new$totCapRatio),]$totCapRatio >= 10)
TCR_18 <- subset(data_18_new, totCapRatio >= 10)
sum(data_19_new[!is.na(data_19_new$totCapRatio),]$totCapRatio >= 10)
TCR_19 <- subset(data_19_new, totCapRatio >= 10)
sum(data_20_new[!is.na(data_20_new$totCapRatio),]$totCapRatio >= 10)
TCR_20 <- subset(data_20_new, totCapRatio >= 10)
sum(data_21_new[!is.na(data_21_new$totCapRatio),]$totCapRatio >= 10)
TCR_21 <- subset(data_21_new, totCapRatio >= 10)

commonTCR <- intersect(TCR_16$company, TCR_17$company)
commonTCR <- intersect(commonTCR, TCR_18$company)
commonTCR <- intersect(commonTCR, TCR_19$company)
commonTCR <- intersect(commonTCR, TCR_20$company)
commonTCR <- intersect(commonTCR, TCR_21$company)

data_16_TCR <- data_16_new[data_16_new$company %in% commonTCR, ]
data_17_TCR <- data_17_new[data_17_new$company %in% commonTCR, ]
data_18_TCR <- data_18_new[data_18_new$company %in% commonTCR, ]
data_19_TCR <- data_19_new[data_19_new$company %in% commonTCR, ]
data_20_TCR <- data_20_new[data_20_new$company %in% commonTCR, ]
data_21_TCR <- data_21_new[data_21_new$company %in% commonTCR, ]

#GENERAL
capratiog <- c(mean(data_16_new[!is.na(data_16_new$totCapRatio),]$totCapRatio), 
               mean(data_17_new[!is.na(data_17_new$totCapRatio),]$totCapRatio), 
               mean(data_18_new[!is.na(data_18_new$totCapRatio),]$totCapRatio), 
               mean(data_19_new[!is.na(data_19_new$totCapRatio),]$totCapRatio), 
               mean(data_20_new[!is.na(data_20_new$totCapRatio),]$totCapRatio), 
               mean(data_21_new[!is.na(data_21_new$totCapRatio),]$totCapRatio))
newcapg <- data.frame(year, capratiog)
newcapg$year <- factor(newcapg$year,levels = newcapg$year)
# Average of Total Capital Ratio (2016-2021)
ggplot(mapping = aes(x = newcapg$year)) +
  geom_bar(aes(y = after_stat(capratiog), fill = newcapg$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Total Capital Ratio (2016-2021)", x = "Year", y = "Average Tot Capital Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newcapg)

#FOR WELL CAP BANKS
capratio <- c(mean(data_16_T1R[!is.na(data_16_T1R$totCapRatio),]$totCapRatio), 
              mean(data_17_T1R[!is.na(data_17_T1R$totCapRatio),]$totCapRatio), 
              mean(data_18_T1R[!is.na(data_18_T1R$totCapRatio),]$totCapRatio), 
              mean(data_19_T1R[!is.na(data_19_T1R$totCapRatio),]$totCapRatio), 
              mean(data_20_T1R[!is.na(data_20_T1R$totCapRatio),]$totCapRatio), 
              mean(data_21_T1R[!is.na(data_21_T1R$totCapRatio),]$totCapRatio))
newcap <- data.frame(year, capratio)
newcap$year <- factor(newcap$year,levels = newcap$year)
# Average of Total Capital Ratio (2016-2021) WELL-CAP Banks
ggplot(mapping = aes(x = newcap$year)) +
  geom_bar(aes(y = after_stat(capratio), fill = newcap$year), 
           width = 0.6, show.legend = FALSE, color = "pink3", fill = "rosybrown1") +
  labs(title = "Average of Total Capital Ratio for well cap banks (2016-2021)", x = "Year", y = "Average Total Capital Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 
# to be more precise in terms of numbers
as_huxtable(newcap) 


# INTERSECTION - WELL CAPITALISED
common <- intersect(commonT1, commonT1R)
common <- intersect(common, commonTCR)

data_16_WC <- data_16_new[data_16_new$company %in% common, ]
data_17_WC <- data_17_new[data_17_new$company %in% common, ]
data_18_WC <- data_18_new[data_18_new$company %in% common, ]
data_19_WC <- data_19_new[data_19_new$company %in% common, ]
data_20_WC <- data_20_new[data_20_new$company %in% common, ]
data_21_WC <- data_21_new[data_21_new$company %in% common, ]



# QUARTILE - SIZE COMPARISON
data_16_new$Quartile <- cut(data_16_new$totAssets, quantile(data_16_new$totAssets),
                              include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))
ggplot(data_16_new, aes(x = Quartile, y = totAssets, fill = specialisation)) + 
  geom_boxplot(width = 0.6) +
  facet_wrap(~ Quartile, scale = "free") +
  labs(x = "Quartile", y = "Total Assets") + 
  ggtitle("Analysis of Size vs Total Assets (2016)") +
  scale_fill_discrete(name = "Specialisation", labels = c("Commercial Bank", "Investment Bank")) +
  theme(plot.title = element_text(hjust = 0.5))  #to center

data_17_new$Quartile <- cut(data_17_new$totAssets, quantile(data_17_new$totAssets),
                            include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))
data_18_new$Quartile <- cut(data_18_new$totAssets, quantile(data_18_new$totAssets),
                            include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))
data_19_new$Quartile <- cut(data_19_new$totAssets, quantile(data_19_new$totAssets),
                            include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))
data_20_new$Quartile <- cut(data_20_new$totAssets, quantile(data_20_new$totAssets),
                            include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))
data_21_new$Quartile <- cut(data_21_new$totAssets, quantile(data_21_new$totAssets),
                            include.lowest = TRUE, labels=c("Very small","Small","Medium", "Large"))

#sum(data_16_new$Quartile == "Very small")
VS_16 <- subset(data_16_new, Quartile == "Very small")
VS_17 <- subset(data_17_new, Quartile == "Very small")
VS_18 <- subset(data_18_new, Quartile == "Very small")
VS_19 <- subset(data_19_new, Quartile == "Very small")
VS_20 <- subset(data_20_new, Quartile == "Very small")
VS_21 <- subset(data_21_new, Quartile == "Very small")

commonVS <- intersect(VS_16$company, VS_17$company)
commonVS <- intersect(commonVS, VS_18$company)
commonVS <- intersect(commonVS, VS_19$company)
commonVS <- intersect(commonVS, VS_20$company)
commonVS <- intersect(commonVS, VS_21$company)

data_16_VS <- data_16_new[data_16_new$company %in% commonVS, ]
data_17_VS <- data_17_new[data_17_new$company %in% commonVS, ]
data_18_VS <- data_18_new[data_18_new$company %in% commonVS, ]
data_19_VS <- data_19_new[data_19_new$company %in% commonVS, ]
data_20_VS <- data_20_new[data_20_new$company %in% commonVS, ]
data_21_VS <- data_21_new[data_21_new$company %in% commonVS, ]

#sum(data_16_new$Quartile == "Small")
SM_16 <- subset(data_16_new, Quartile == "Small")
SM_17 <- subset(data_17_new, Quartile == "Small")
SM_18 <- subset(data_18_new, Quartile == "Small")
SM_19 <- subset(data_19_new, Quartile == "Small")
SM_20 <- subset(data_20_new, Quartile == "Small")
SM_21 <- subset(data_21_new, Quartile == "Small")

commonSM <- intersect(SM_16$company, SM_17$company)
commonSM <- intersect(commonSM, SM_18$company)
commonSM <- intersect(commonSM, SM_19$company)
commonSM <- intersect(commonSM, SM_20$company)
commonSM <- intersect(commonSM, SM_21$company)

data_16_SM <- data_16_new[data_16_new$company %in% commonSM, ]
data_17_SM <- data_17_new[data_17_new$company %in% commonSM, ]
data_18_SM <- data_18_new[data_18_new$company %in% commonSM, ]
data_19_SM <- data_19_new[data_19_new$company %in% commonSM, ]
data_20_SM <- data_20_new[data_20_new$company %in% commonSM, ]
data_21_SM <- data_21_new[data_21_new$company %in% commonSM, ]

#sum(data_16_new$Quartile == "Medium")
ME_16 <- subset(data_16_new, Quartile == "Medium")
ME_17 <- subset(data_17_new, Quartile == "Medium")
ME_18 <- subset(data_18_new, Quartile == "Medium")
ME_19 <- subset(data_19_new, Quartile == "Medium")
ME_20 <- subset(data_20_new, Quartile == "Medium")
ME_21 <- subset(data_21_new, Quartile == "Medium")

commonME <- intersect(ME_16$company, ME_17$company)
commonME <- intersect(commonME, ME_18$company)
commonME <- intersect(commonME, ME_19$company)
commonME <- intersect(commonME, ME_20$company)
commonME <- intersect(commonME, ME_21$company)

data_16_ME <- data_16_new[data_16_new$company %in% commonME, ]
data_17_ME <- data_17_new[data_17_new$company %in% commonME, ]
data_18_ME <- data_18_new[data_18_new$company %in% commonME, ]
data_19_ME <- data_19_new[data_19_new$company %in% commonME, ]
data_20_ME <- data_20_new[data_20_new$company %in% commonME, ]
data_21_ME <- data_21_new[data_21_new$company %in% commonME, ]

#sum(data_16_new$Quartile == "Large")
LA_16 <- subset(data_16_new, Quartile == "Large")
LA_17 <- subset(data_17_new, Quartile == "Large")
LA_18 <- subset(data_18_new, Quartile == "Large")
LA_19 <- subset(data_19_new, Quartile == "Large")
LA_20 <- subset(data_20_new, Quartile == "Large")
LA_21 <- subset(data_21_new, Quartile == "Large")

commonLA <- intersect(LA_16$company, LA_17$company)
commonLA <- intersect(commonLA, LA_18$company)
commonLA <- intersect(commonLA, LA_19$company)
commonLA <- intersect(commonLA, LA_20$company)
commonLA <- intersect(commonLA, LA_21$company)

data_16_LA <- data_16_new[data_16_new$company %in% commonLA, ]
data_17_LA <- data_17_new[data_17_new$company %in% commonLA, ]
data_18_LA <- data_18_new[data_18_new$company %in% commonLA, ]
data_19_LA <- data_19_new[data_19_new$company %in% commonLA, ]
data_20_LA <- data_20_new[data_20_new$company %in% commonLA, ]
data_21_LA <- data_21_new[data_21_new$company %in% commonLA, ]


# GRAPH - COMPARISON
#created the dataset which contain all years
data_16_with_year <- data_16[data_16$company %in% datacommon, ]
data_17_with_year <- data_17[data_17$company %in% datacommon, ]
data_18_with_year <- data_18[data_18$company %in% datacommon, ]
data_19_with_year <- data_19[data_19$company %in% datacommon, ]
data_20_with_year <- data_20[data_20$company %in% datacommon, ]
data_21_with_year <- data_21[data_21$company %in% datacommon, ]

data_16_with_year$year <- '2016'
data_17_with_year$year <- '2017'
data_18_with_year$year <- '2018'
data_19_with_year$year <- '2019'
data_20_with_year$year <- '2020'
data_21_with_year$year <- '2021'

data_with_years <- rbind(data_16_with_year, data_17_with_year, 
                         data_18_with_year, data_19_with_year, 
                         data_20_with_year, data_21_with_year)

#density over years and specialisation
ggplot(data_with_years, aes(x = totEquity, y = year, fill = specialisation)) +
  geom_density_ridges(alpha=0.4) +
  facet_grid(specialisation ~ .)+
  theme_ridges() + 
  theme(legend.position = "none")

#other density graph with years
ggplot(data=data_with_years, aes(x=totEquity, group=year, fill=year)) +
  geom_density(alpha=0.4) +
  theme_ipsum()

#average Basel3 considering specialisation
data_all_year_group_specialization = data_with_years %>% group_by(year, specialisation)
data_all_year_group_specialization
#data_all_year_group_specialization %>% summarise(Basel3_leverage_ratio = mean(!is.na(Basel3_leverage_ratio)))

ggplot(data_all_year_group_specialization %>% 
         summarise(Basel3_leverage_ratio = mean(!is.na(Basel3_leverage_ratio))), 
       aes(fill=specialisation, y=Basel3_leverage_ratio, x=year)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(title = "Average of Basel 3 Leverage Ratio (2016-2021)", 
       x = "Year", y = "Average Basel 3 Leverage Ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 

#average tier 1 considering specialisation
ggplot(data_all_year_group_specialization %>% 
         summarise(Tier1 = mean(!is.na(Tier1))), aes(fill=specialisation, y=Tier1, x=year)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(title = "Average of Tier 1 (2016-2021)", x = "Year", y = "Average Tier 1" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 

#average totcap ratio considering specialisation
ggplot(data_all_year_group_specialization %>% 
         summarise(totCapRatio = mean(!is.na(totCapRatio))), aes(fill=specialisation, y=totCapRatio, x=year)) + 
  geom_bar(position="dodge", stat="identity") +
  labs(title = "Average of total capital ratio (2016-2021)", x = "Year", y = "Average total capital ratio" ) + 
  theme(plot.title = element_text(hjust = 0.5)) 

#INTERESCTION SET BUT CONSIDERING ONLY 2016
#BY GROUPS
#SPECIALISATION
equity_spec <- data_16_new %>% group_by(specialisation) %>% 
  summarise_at(vars(totEquity), list(group = mean))
aver_spec <- equity_spec$group

ggplot(mapping = aes(x = equity_spec$specialisation)) +
  geom_bar(aes(y = after_stat(aver_spec), fill = equity_spec$specialisation), 
           width = 0.8, show.legend = FALSE) +
  labs(title = "Comparison of Average Tot. Equity", x = "Specialisation", y = "Average Tot. Equity" ) +
  theme(plot.title = element_text(hjust = 0.5))


#COUNTRY
equity_country <- data_16_new %>% group_by(country) %>% summarise_at(vars(totEquity), list(group = mean))
aver_country <- equity_country$group

ggplot(mapping = aes(x = equity_country$country)) +
  geom_bar(aes(y = after_stat(aver_country), fill = equity_country$country), 
           width = 0.8, show.legend = FALSE) +
  labs(title = "Comparison of Average Tot. Equity", x = "Country", y = "Average Tot. Equity" ) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

#CLUSTER
#considering tot Equity and tot Assets
data_16_std <- scale(data_16_new[!is.na(data_16_new$RWAs), c(1,6)])

fviz_nbclust(data_16_std, FUNcluster = kmeans, method = "silhouette")
# --> optimal number of clusters = 2

km <- kmeans(data_16_std, centers = 2, nstart = 1)
fviz_cluster(km, data = data_16_std)
assets_16 <- aggregate(data_16_new[!is.na(data_16_new$RWAs), c(1,6)], by = list(cluster = km$cluster), FUN = mean)

equ <- assets_16$totEquity
ggplot(mapping = aes(x = as.factor(assets_16$RWAs))) +
  geom_bar(aes(y = after_stat(equ), fill = assets_16$RWAs), 
           width = 0.8, show.legend = FALSE) +
  labs(title = "Clusters comparison", x = " Average tot. Assets", y = "Average Tot. Equity" ) +
  theme(plot.title = element_text(hjust = 0.5))

