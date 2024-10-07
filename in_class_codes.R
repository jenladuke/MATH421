# In Class Codes, R

## Read in csv file
df = read.csv("C:\Users\student\Documents\GitHub\MATH421\us-states.csv")

## Show the names of the columns
names(df)

## Structure of the data in general 
str(df)

## Fix the type of variable
df$date = as.Date(df$date)

## We can do calculation on Date variables
mean(df)

## Can we create a new variable with three categories using ifelse function?
df$New_deaths2 <- case_when(df$New_deaths<2 ~ 'low_death',
                            df$New_deaths<5 ~ 'mid_death',
                            TRUE~'high_death')

# Assignment 4
## average deaths in RI
df %>% 
  select(state, death) %>% 
  filter(state == "RI") %>% 
  summarise(average_death = mean(death, na.rm = TRUE))

## total deaths in AZ
df %>% 
  select(state, death) %>% 
  filter(state == "AZ") %>% 
  summarise(total_death = sum(death, na.rm = TRUE))

## total deaths in New England in 2021
df %>% 
  select(state, date, death) %>% 
  filter(date >="2021-01-01", date<"2022-01-01") %>% 
  filter(state == "RI" | state == "MA" | state == "CT") %>% 
  group_by(state) %>% 
  summarise(average_death = mean(death, na.rm = TRUE)) %>% 
  arrange(average_death)



