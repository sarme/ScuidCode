class GameOverScreen
{
  boolean makeGameMusicQuite;
  int optionSelected;
  int numberOfWipe;
  float textSizeNumber;
  
  GameOverScreen()
  {
    this.makeGameMusicQuite = true;
    this.optionSelected = 0;
    this.numberOfWipe = 0;
    this.textSizeNumber = 0;
  }
  
  void drawGameOverScreen()
  {
    if (makeGameMusicQuite)
    {
      makeGameMusicQuite = false;
    }
    
    if (numberOfWipe <= 20)
    {
      screenWipe();
      numberOfWipe++;
    }
    else
    {
      background(50);
      
      displayGameOverText();
      changeTextSizeNumber();
      displayScore();
    }
  }
  
  void doAppropriateOption()
  {
    if (!(numberOfWipe <= 20))
    {
      switch(optionSelected)
      {
        case 0:
          gameController.restartGame();
          break;
        case 1:
        default:
        
          makeGameMusicQuite = true;
          gameController.gameScreen = 0;
      }
    }
  }
  
  void screenWipe()
  {
    fill(50);
    int numberOfSections = 40;
    
    for (int x = 0; x < numberOfSections; x++)
    {
      float xPos = ((width / numberOfSections) * x) + (numberOfWipe * (width / numberOfSections / 20));
        
      rect(xPos, 0, width / numberOfSections / 20, height);
    }
  }
  
  void displayGameOverText()
  {
      fill(255);
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER", width / 2, height / 3);
      
      switch(optionSelected)
      {
        case 0:
        default:
          textSize(60 + (sin(textSizeNumber)) * 5);
          text("RETRY", width / 3, 400 + 5);
          textSize(50);
          text("MENU", width * 2 / 3, 400);
          break;
        case 1:
          textSize(50);
          text("RETRY", width / 3, 400);
          textSize(60 + (sin(textSizeNumber)) * 5);
          text("MENU", width * 2 / 3, 400 + 5);
          break;
      }
  }
  
  void changeTextSizeNumber()
  {
    textSizeNumber = textSizeNumber + .05;
    
    if (textSizeNumber >= TWO_PI)
    {
      textSizeNumber = 0;
    }
  }
  
  void displayScore()
  {    
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Score: " + int(gameController.gameScore), width / 2, (height / 3) + 60);
  }
}