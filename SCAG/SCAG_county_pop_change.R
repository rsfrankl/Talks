#code for looking at 2022-2023 population change in California
library(readxl)         # for reading in Excel data
library(dplyr)          # for data manipulation
library(tidyr)          # for data shaping
library(ggplot2)        # for generating the visualizations
library(hrbrthemes) # for themes


#uses county population by age data in SGAC folder
ca_county_data <- read_excel("~/Documents/GitHub/SCAG/California_age_2022_2023.xlsx", sheet = "County_pop_change")

head(ca_county_data)

#population <- ca_county_data %>%

new_data <- ca_county_data %>%
  mutate(SCAG = as.factor(SCAG))
ggplot(ca_county_data, aes(County, pct_change_22_23, colour = SCAG)) +
  geom_point()+
  coord_flip()

# Plot population change 2022-2023
new_data <- ca_county_data %>%
  mutate(SCAG = as.factor(SCAG))
ggplot(new_data) +
  geom_segment( aes(x=County, xend=County, y=0, yend=pct_change_22_23), color="grey") +
  geom_point( aes(x=County, y=pct_change_22_23, color=SCAG, size=total_2023)) +
  coord_flip() +
  scale_x_discrete(limits=rev) +
  theme_dark() +
  theme(
    legend.position = "none",
  ) +
  theme(axis.line = element_line(color='darkgrey'),
        text = element_text(family = "serif"),
        plot.background = element_rect(fill = "#fcefeb", color = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank())+
  xlab("") +
  ylab("California County Population Change (percent), 2022-2023 (ACS 1-year estimates)")
