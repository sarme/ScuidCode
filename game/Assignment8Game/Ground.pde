class Ground
{
  float groundXPos;
  float groundYPos;
  float groundHeight;
  color groundColor;
  
  Ground()
  {
    this.groundXPos = 0;
    this.groundHeight = 50;
    this.groundYPos = height - groundHeight;
    this.groundColor = color(200);
  }
  
  void displayGround()
  {
    fill(groundColor);
    rect(groundXPos, groundYPos, width, height - groundYPos);
  }
}