# Most effective curve balls based on % of successful PR, at least 75 samples thru 4/27

# Load Data
allCurveBallResults = read.csv("~/R/Curveballs-Before-Apr-27/all_curves.csv")

# Collect unique player names
PlayersWhoThrowCurves <- c()
for (player in unique(allCurveBallResults$player_name)){
  PlayersWhoThrowCurves <- c(PlayersWhoThrowCurves, player)
}

maxPercentageOfSuccessfulCurves <- -0.01
mostEffectivePitcher <- ""

# For each player, calculate percentage of curveballs that were successful
for (player in PlayersWhoThrowCurves) {
  
  playersCurves <- subset(allCurveBallResults, player_name == player)
  curvesThrown <- nrow(playersCurves) 
  
  if (curvesThrown < 75) {
    next
  }
  
  playersSuccessCurves <- subset(playersCurves, events == "strikeout")  
  curveballEffectiveRate <- nrow(playersSuccessCurves)/curvesThrown
  
  if (curveballEffectiveRate > maxPercentageOfSuccessfulCurves) {
    maxPercentageOfSuccessfulCurves = curveballEffectiveRate
    mostEffectivePitcher <- player
  }
}


print(paste(maxPercentageOfSuccessfulCurves, mostEffectivePitcher))
