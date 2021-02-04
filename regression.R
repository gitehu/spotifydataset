setwd("~/Documents/R scripts and data/spotifydata/spotifydataset")
songs<-read.csv("datacamp-spotify-data.csv")
head(songs)
str(songs)

plot(popularity ~ song_age, data = songs)
# Create the model here
lm_model <- lm(popularity ~ song_age, data = songs)
abline(lm_model,col="blue",lwd=2)

coef(lm_model)
plot(resid(lm_model)~song_age,data=songs)
#need to understand this much better

par(mfrow = c(2, 2))
plot(lm_model)
par(mfrow = c(1, 1))

# Produce the summary
summary(lm_model)

library(broom)
# Print a tidy summary of the coefficients
tidy(lm_model)

library(rstan)
library(rstanarm)

# Create the model here
stan_model <- stan_glm(popularity ~ song_age, data = songs)

# Produce the summary
summary(stan_model)

# Print a tidy summary of the coefficients
tidy(stan_model)
#doesn't do the job!
#install.packages("broom.mixed")
library(broom.mixed)
tidy(stan_model)


#https://ademos.people.uic.edu/Chapter10.html

ggplot(data = songs, aes(x = song_age, y = popularity))+
  geom_point(aes(color=popularity))+
  geom_smooth(color='black')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("years since the song was written")+ylab("popularity rate")

# Show the contour only
ggplot(data = songs, aes(x = song_age, y = popularity)) +
  geom_density_2d()+theme_bw()

# Area + contour
ggplot(data = songs, aes(x = song_age, y = popularity)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")+
  theme_bw()+  
  xlab("years since the song was written")+ylab("popularity rate")

