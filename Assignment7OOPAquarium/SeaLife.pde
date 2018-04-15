class SeaLife
{
  // This is the superclass over Bubbles, Crab, Fish and GiantSquid
  
  PImage seaLifeImage;
  color seaLifeTint;
  
  float seaLifeXPos;
  float seaLifeYPos;
  float seaLifeWidthSize;
  float seaLifeHeightSize;
  float seaLifeXSpeed;
  float seaLifeYSpeed;
  float seaLifeFloatRate;
  float seaLifeFloatNumber;
  float seaLifeSize;
  color seaLifeColor;
  
  SeaLife()
  {
    seaLifeSize = random(.3, 1.2);
    seaLifeWidthSize = random(50) * seaLifeSize;
    seaLifeHeightSize = random(50) * seaLifeSize;
    seaLifeXPos = random(seaLifeWidthSize / 2, width - (seaLifeWidthSize / 2));
    seaLifeYPos = random(seaLifeHeightSize / 2, height - (seaLifeHeightSize / 2) - aquariumBottomSize);
    seaLifeXSpeed = random(5);
    seaLifeYSpeed = random(5);
    seaLifeFloatNumber = random(0, TWO_PI);
    seaLifeFloatRate = random(.05, .1);
    seaLifeColor = color(random(255), random(255), random(255));
  }
  
  void generalControl()
  {
    fill(seaLifeColor);

    moveseaLife();
    checkEdgesAndBounce();
    changeFloatNumber();
  }
  
  void moveseaLife()
  {
    seaLifeXPos = seaLifeXPos + seaLifeXSpeed;
    seaLifeYPos = seaLifeYPos + seaLifeYSpeed;
  }
  
  // Pretty self-explanatory
  void checkEdgesAndBounce()
  {
    if (seaLifeXPos - (seaLifeWidthSize / 2) <= 0)
    {
      seaLifeXPos = 0 + (seaLifeWidthSize / 2);
      seaLifeXSpeed = seaLifeXSpeed * -1;
    }
    
    if (seaLifeXPos + (seaLifeWidthSize / 2) >= width)
    {
      seaLifeXPos = width - (seaLifeWidthSize / 2);
      seaLifeXSpeed = seaLifeXSpeed * -1;
    }
    
    if (seaLifeYPos - (seaLifeHeightSize / 2) <= 0)
    {
      seaLifeYPos = 0 + (seaLifeHeightSize / 2);
      seaLifeYSpeed = seaLifeYSpeed * -1;
    }
    
    if (seaLifeYPos + (seaLifeHeightSize / 2) >= height - aquariumBottomSize)
    {
      seaLifeYPos = height - (seaLifeHeightSize / 2) - aquariumBottomSize;
      seaLifeYSpeed = seaLifeYSpeed * -1;
    }
  }
  
  void changeFloatNumber()
  {
    seaLifeFloatNumber = seaLifeFloatNumber + seaLifeFloatRate;
    
    if (seaLifeFloatNumber >= TWO_PI)
    {
      seaLifeFloatNumber = 0;
    }
  }
  
  // Changes which way the seaLife is faceing horizontally
  void checkSeaLifeDirection()
  {
    if (seaLifeXSpeed > 0)
    {
      scale(-1, 1);
    }
    else if (seaLifeXSpeed < 0)
    {
      scale(1, 1);
    }
  }
  
}