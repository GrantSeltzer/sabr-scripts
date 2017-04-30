game_pitch_data = read.csv("~/Programs/R/sabr-scripts/data/tanaka-pitch-by-pitch-apr-27-2017.csv")



for (pitch_id in game_pitch_data$id) {
  zone_location <- subset(game_pitch_data, id == pitch_id)$zone_location
  balls <- subset(game_pitch_data, id == pitch_id)$balls
  strikes <- subset(game_pitch_data, id == pitch_id)$strikes
  result <- subset(game_pitch_data, id == pitch_id)$type  # X (out), S (strike), W (walk)
  
}
