class Fish extends SeaLife
{
  boolean bubbleOnCooldown;
  Bubbles bubble;
  
  Fish()
  {
    super();
    this.seaLifeImage = loadImage("Assignment7OOPAquarium/Images/FishImage.png");
    this.seaLifeTint = color(color(random(100, 255), random(100, 255), random(100, 255)));
    
    this.seaLifeWidthSize = 150 * seaLifeSize;
    this.seaLifeHeightSize = 75 * seaLifeSize;
    this.seaLifeXSpeed = random(-5, 5);
    this.seaLifeYSpeed = random(-.5, .5);
    this.seaLifeFloatRate = random(.05, .1);
    this.seaLifeColor = color(random(255), random(255), random(255));
    
    this.bubbleOnCooldown = false;
  }
  
  void drawFish()
  {
    // This specific check will check if the seaLifeYPos + the sin(this.seaLifeFloatNumber) +- the seaLifeHeight is touching the top or bottom of the aquarium area
    this.fishSpecificEdgeCheck();
    
    // This causes the fish to randomly blow bubbles
    this.blowBubbles();
    super.generalControl();
    
    
    // maybe add this to SeaLife?
    pushMatrix();
    
      tint(this.seaLifeTint);
      
      // The sin(this.seaLifeFloatNumber) will cause the fish to float up and down
      translate(this.seaLifeXPos, this.seaLifeYPos + (sin(this.seaLifeFloatNumber) * 8));
      super.checkSeaLifeDirection();
      image(this.seaLifeImage, 0, 0, this.seaLifeWidthSize, this.seaLifeHeightSize);
    
    popMatrix();
  }
  
  // This is needed because the fish float up and down at a specific multiplier of sin(seaLifeFloatNumber), which is currently 8x
  void fishSpecificEdgeCheck()
  {
    if (this.seaLifeYPos - (this.seaLifeHeightSize / 2) + (sin(this.seaLifeFloatNumber) * 8) <= 0)
    {
      this.seaLifeYPos = 0 + (this.seaLifeHeightSize / 2) - (sin(this.seaLifeFloatNumber) * 8);
      this.seaLifeYSpeed = this.seaLifeYSpeed * -1;
    }
    
    if (this.seaLifeYPos + (this.seaLifeHeightSize / 2) + (sin(this.seaLifeFloatNumber) * 8) >= height - aquariumBottomSize)
    {
      this.seaLifeYPos = height - (this.seaLifeHeightSize / 2) - (sin(this.seaLifeFloatNumber) * 8) - aquariumBottomSize;
      this.seaLifeYSpeed = this.seaLifeYSpeed * -1;
    }
  }
  
  void blowBubbles()
  {
    float randomNum = random(0, 10);
    if (!this.bubbleOnCooldown && (randomNum > 9.99))
    {
      this.bubble = new Bubbles(this.seaLifeXPos + (seaLifeWidthSize / 2), this.seaLifeYPos);
      
      this.bubbleOnCooldown = true;
    }
    
    if (this.bubble != null)
    {
      this.bubble.drawBubble();
      
      if (!this.bubble.checkIfShouldExist())
      {
        this.bubbleOnCooldown = false;
        this.bubble = null;
      }
    }
  }
}