'ggplot(data = songs, aes(x = song_age, y = popularity)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")+
  theme_bw()+  
  xlab("years since the song was written")+ylab("popularity rate")'
<img src="2D density scatterplot.png" alt="Girl in a jacket">
