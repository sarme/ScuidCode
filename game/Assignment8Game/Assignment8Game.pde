// Chris Arme
// Assignment 8
// Canabalt

Player player;
Ground ground;
ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>();
GameControl gameController;
StartScreen startScreen;
GameOverScreen gameOverScreen;
GameScreen gameplayScreen;
AboutScreen aboutScreen;

void setup()
{ 
  smooth();
  textAlign(CENTER);
  frameRate(60);
  noStroke();
  background(100);
  size(800, 500);
  
  ground = new Ground();
  player = new Player();
  
  gameController = new GameControl();
  startScreen = new StartScreen();
  gameOverScreen = new GameOverScreen();
  gameplayScreen = new GameScreen();
  aboutScreen = new AboutScreen();
  
}

void draw()
{
  // gameScreen 0 (default) = menu screen, gameScreen 1 = gameplay screen, gameScreen 2 = game over screen
  
  if (gameController.gameScreen == 1)
  {
    gameplayScreen.drawGameScreen();
  }
  else if (gameController.gameScreen == 2)
  {
    gameOverScreen.drawGameOverScreen();
  }
  else
  {
    startScreen.drawStartScreen();
  }
  
  if (aboutScreen.isActive == true || aboutScreen.isOnTheMove == true)
  {
    aboutScreen.drawAboutScreen();
  }
}

void keyPressed()
{ 
  switch(gameController.gameScreen)
  {
    // Start screen, or something is terribly wrong
    case 0: 
    default:
      if (!aboutScreen.isOnTheMove)
      {
        if (key == ' ' || keyCode == ENTER)
        {
          startScreen.doAppropriateOption();
        }
        
        if (keyCode == LEFT || key == 'a')
        {
          if (startScreen.optionSelected > 0)
          {
            startScreen.optionSelected -= 1;
          }
        }
        else if (keyCode == RIGHT || key == 'd')
        {
          if (startScreen.optionSelected < 2)
          {
            startScreen.optionSelected += 1;
          }
        }
      }
      
      break;
    // Actual gameplay screen
    case 1:
      if ((key == ' '))
      {
        player.isSpacePressed = true;
      }
    
      if (key == 's')
      {
        player.isSPressed = true;
      }
      
      if (keyCode == ESC)
      {
        gameController.gameScreen = 0;
      }
      
      break;

    // Game over screen :(
    case 2: 
      if (key == ' ' || keyCode == ENTER)
      {
        gameOverScreen.doAppropriateOption();
      }
      
      if (keyCode == LEFT || key == 'a')
      {
        gameOverScreen.optionSelected = 0;
      }
      else if (keyCode == RIGHT || key == 'd')
      {
        gameOverScreen.optionSelected = 1;
      }
      
      break;
      
    case 3: 
      if (key == ' ' || keyCode == ENTER)
      {
        aboutScreen.isActive = false;
        aboutScreen.isOnTheMove = true;
      }
  }
}

void keyReleased()
{
    switch(gameController.gameScreen)
  {
    // Start screen, or something is terribly wrong
    case 0: 
    default:
    // do nothing!
      break;
    
    case 1:
      if ((key == ' '))
      {
        player.isSpacePressed = false;
        player.canJump = false;
      }
      
        if (key == 's')
      {
        player.isSPressed = false;
      }
      
      break;
  }
}