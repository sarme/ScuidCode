class StartScreen
{
  int optionSelected;
  float textSizeNumber;
  
  StartScreen()
  {
    this.optionSelected = 0;
    this.textSizeNumber = 0;
  }
  
  void drawStartScreen()
  {
    background(75);
    
    displayStartScreenText();
    
    // This makes it so the chosen text grows and shrinks in size
    changeTextSizeNumber();
  }
  
  // If Start is selected, start the game. If Close is selected, close the game.
  void doAppropriateOption()
  {
    switch(optionSelected)
    {
      case 0:
        gameController.restartGame();
        break;
      case 1:
        aboutScreen.toggleActivateScreen();
        break;
      case 2:
      default:
        exit();
        break;
    }
  }
  
  void displayStartScreenText()
  {
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("NOT CANABALT", width / 2, height / 3);
    
    textSize(20);
    text("Press Space to jump / select option", width / 2, height / 2 + 40);
    text("Press S to slam down", width / 2, height / 2 + 80);
    
    switch(optionSelected)
    {
      case 0:
      default:
        textSize(60 + (sin(textSizeNumber)) * 5);
        text("START", width / 4 - 20, 420 + 5);
        
        textSize(50);
        text("ABOUT", width / 2, 420);
        text("CLOSE", (width * 3 / 4 ) + 20, 420);
        break;
      case 1:
        textSize(50);
        text("START", width / 4 - 20, 420 + 5);
        
        textSize(60 + (sin(textSizeNumber)) * 5);
        text("ABOUT", width / 2, 420);
        
        textSize(50);
        text("CLOSE", (width * 3 / 4 ) + 20, 420);
        break;
      case 2:
        textSize(50);
        text("START", width / 4 - 20, 420 + 5);
        text("ABOUT", width / 2, 420);
        
        textSize(60 + (sin(textSizeNumber)) * 5);
        text("CLOSE", (width * 3 / 4 ) + 20, 420);
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
}