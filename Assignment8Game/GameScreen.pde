class GameScreen
{
  
  GameScreen()
  {
    
  }
  
  // REDUCE THIS
  void drawGameScreen()
  { 
    background(100);
    ground.displayGround();
    
    for (int i = obstacles.size() - 1; i > -1; i--)
    {
      obstacles.get(i).displayObstacle(gameController.timerSinceLastCollision);
      if (obstacles.get(i).isObstacleOffScreen())
      {
        obstacles.remove(i);
      }
    }
    
    if (gameController.canObstacleSpawn)
    {
      if (int(random(0, 100)) >= 98)
      {
        obstacles.add(new Obstacles((gameController.timerSinceLastCollision)));
        gameController.timerSinceLastObstacleSpawn = 0;
        gameController.canObstacleSpawn = false;
      }
    }
    
    player.displayPlayer();
    
    gameController.masterGameControls();
    
    if (!gameController.canObstacleSpawn)
    {
      gameController.updateTimeSinceLastObstaclesSpawn();
      gameController.checkIfObstacleCanSpawn();
    }
    
    displayScore();
  }
  
  void displayScore()
  {
    gameController.updateGameScore();
    
    fill(255);
    textSize(25);
    textAlign(LEFT);
    text("Score: " + int(gameController.gameScore), 10, 30);
  }
}