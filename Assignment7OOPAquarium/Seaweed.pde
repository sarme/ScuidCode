class Seaweed
{
  // It is actually easier to make an entirely different class instead of extending seaLife
  
  //PImage seaweedLifeImage;
 
  float seaweedBlockHeight; 
  float seaweedFirstXPos;
  float seaweedFirstYPos;
  float seaweedWidthSize;
  float seaweedHeightSize;
  float seaweedFloatRate;
  float seaweedFloatNumber;
  color seaweedColor;
  
  Seaweed()
  {
    this.seaweedBlockHeight = random(3, 10);
    
    this.seaweedWidthSize = 10;
    this.seaweedHeightSize = 15;
    
    this.seaweedFirstXPos = random(width);
    this.seaweedFirstYPos = height - (this.seaweedBlockHeight) - aquariumBottomSize;
    
    this.seaweedFloatNumber = int(random(0, TWO_PI));
    this.seaweedFloatRate = random(.04, .08);
    
    this.seaweedColor = color(40, 100, 20);
    
  }
  
  void drawSeaweed()
  {
    for (int i = 0; i < seaweedBlockHeight; i++)
    {
      pushMatrix();
      
        fill(seaweedColor);
        translate(seaweedFirstXPos + (cos(seaweedFloatNumber + (1 * i)) * 4.5), seaweedFirstYPos - (seaweedHeightSize * i) + (i * 4));
        rect(0, 0, seaweedWidthSize, seaweedHeightSize);
          
      popMatrix();
    }
    
    seaweedFloatNumber += seaweedFloatRate;
    
    if (seaweedFloatNumber >= TWO_PI)
    {
      seaweedFloatNumber = 0;
    }
  }
}