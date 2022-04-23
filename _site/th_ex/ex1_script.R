
# start up

packages = c('tidyverse')

for (p in packages){
  if(!require(p, character.only = T)){
    install.package(p)
  }
  library(p, character.only = T)
}

# import data

participants = read_csv('th_ex/data/Participants.csv')
str(participants)
# analysis on columns

max(participants$joviality)
min(participants$joviality)
mean(participants$joviality)


ggplot(data = participants, aes(x = educationLevel, fill= interestGroup))+
  geom_bar()

ggplot(data = participants, aes(x = educationLevel, y = joviality))+
  geom_boxplot()+
  geom_point(position = "jitter", size = 0.5)

ggplot(data = participants, aes(x = joviality))+
  geom_density()

ggplot(data = participants, aes(x = educationLevel, y = joviality, fill = haveKids))+
  geom_violin()+
  geom_boxplot()+
  geom_point(stat = "summary",
             fun.y = "mean",
             size = 3)
