class Bubbles extends SeaLife
{
  Bubbles(float xPos, float yPos)
  {
    super();
    
    this.seaLifeXPos = xPos;
    this.seaLifeYPos = yPos;
    
    this.seaLifeWidthSize = int(random(2, 20));
    this.seaLifeHeightSize = this.seaLifeWidthSize;
    this.seaLifeXSpeed = 0;
    this.seaLifeYSpeed = random(-3, -1);
    this.seaLifeFloatRate = random(.3, .8);
    this.seaLifeColor = color(255, 100);
  }
  
  void drawBubble()
  {
    super.generalControl();
    pushMatrix();
    
      // The cos(this.seaLifeFloatNumber) will cause the bubbles to float from side to side
      translate(this.seaLifeXPos + cos(this.seaLifeFloatNumber), this.seaLifeYPos);
      ellipse(0, 0, this.seaLifeWidthSize, this.seaLifeHeightSize);
    
    popMatrix();
  }
  
  // If the bubble reaches the top of the screen, it should not exist
  boolean checkIfShouldExist()
  {
    if (this.seaLifeYPos - (this.seaLifeHeightSize / 2) <= 0)
    {
      return false;
    }
    else
    {
      return true;
    }
  }
}