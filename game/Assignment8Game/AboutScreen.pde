class AboutScreen
{
  boolean isActive;
  boolean isOnTheMove;
  int moveCounter;
  
  AboutScreen()
  {
    this.isActive = false;
    this.isOnTheMove = false;
    this.moveCounter = 0;
  }
  
  void drawAboutScreen()
  {
    if (isActive)
    {
      if (isOnTheMove)
      {
        pushMatrix();
          translate(0, -height + ((height / 50) * moveCounter));
          fill(200);
          rect(50, 50, width - 100, height - 100, 20);
          displayAboutScreenText();
        popMatrix();
        if (moveCounter < 50)
        {
          moveCounter++;
        }
        else if (moveCounter >= 50)
        {
          isOnTheMove = false;
          gameController.gameScreen = 3;
        }
      }
      else if (!isOnTheMove)
      {
        fill(200);
        rect(50, 50, width - 100, height - 100, 20);
        displayAboutScreenText();
      }
    }
    else if (!isActive)
    {
      if (isOnTheMove)
      {
        pushMatrix();
          translate(0, -height + ((height / 50) * moveCounter));
          fill(200);
          rect(50, 50, width - 100, height - 100, 20);
          displayAboutScreenText();
        popMatrix();
        if (moveCounter > 0)
        {
          moveCounter--;
        }
        else if (moveCounter <= 0)
        {
          isOnTheMove = false;
          gameController.gameScreen = 0;
        }
      }
    }
  }
  
  void toggleActivateScreen()
  {
    if (!isActive && !isOnTheMove)
    {
      isActive = true;
      isOnTheMove = true;
    }
    else if (isActive && !isOnTheMove)
    {
      isActive = false;
      isOnTheMove = true;
    }
  }
  
  void displayAboutScreenText()
  {
    fill(0);
    textSize(20);
    
    text("NOT CANABALT", width / 2, 90);
    text("by Chris Arme", width / 2, 120);
    
    textSize(15);
    text("The objective of this game is to jump over as many obstacles as possible.", width / 2, 200);
    text("Getting pushed off screen will cause a GAME OVER.", width / 2, 240);
    text("Try to get the highest score possible!", width / 2, 280);
    
    text("Press Space to return to the Menu", width / 2, 360);
    
    textSize(10);
    text("Based off of CANABALT by Finji", width / 2, 430);
  }
}