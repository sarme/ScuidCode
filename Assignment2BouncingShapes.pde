int squareXPos = 100;
int squareYPos = 200;
int squareXSpeed = int(random(1, 5));
int squareYSpeed = int(random(1, 5));
float squareRotation = 0;
color squareColor = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));

int circleXPos = 300;
int circleYPos = 150;
int circleXSpeed = int(random(1, 5));
int circleYSpeed = int(random(1, 5));
color circleColor = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));

int triangleXPos = 400;
int triangleYPos = 300;
int triangleXSpeed = int(random(-5, -1));
int triangleYSpeed = int(random(-5, -1));
float triangleRotation = 0;
color triangleColor = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));

int pieXPos = 200;
int pieYPos = 400;
int pieXSpeed = int(random(-5, -1));
int pieYSpeed = int(random(-5, -1));
float pieRotation = 0;
color pieColor = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));


void setup()
{
  //surface.setResizable(true);
  size(700, 700);
  background(100, 100, 100);
  strokeWeight(.25);
}

void draw()
{ 
  // Fun frameSize change (every second)
  //if (frameCount % 60 == 0){
  //surface.setSize(int(random(500, 700)), int(random(500, 700)));
  //}
  
  pushMatrix();
  fill(squareColor);
  translate(squareXPos, squareYPos);
  rotate(squareRotation);
  rectMode(CENTER);
  rect(0, 0, 50, 50);
  popMatrix();
  
  fill(circleColor);
  ellipse(circleXPos, circleYPos, 100, 100);
  
  pushMatrix();
  fill(triangleColor);
  translate(triangleXPos, triangleYPos);
  rotate(triangleRotation);
  triangle(0, -25, -25, 25, 25, 25);
  popMatrix();
  
  pushMatrix();
  fill(pieColor);
  translate(pieXPos, pieYPos);
  rotate(pieRotation);
  arc(0, 0, 80, 80, 0, PI + HALF_PI * 1.25, PIE);
  popMatrix();
  
  
  if (squareXPos + 25 >= width || squareXPos - 25 <= 0)
  {
    squareXSpeed = squareXSpeed * -1;  
  }
  
  if (squareYPos + 25 >= height || squareYPos - 25 <= 0)
  {
    squareYSpeed = squareYSpeed * -1;
  }
  
  if (circleXPos + 50 >= width || circleXPos - 50 <= 0)
  {
    circleXSpeed = circleXSpeed * -1;  
  }
  
  if (circleYPos + 50 >= height || circleYPos - 50 <= 0)
  {
    circleYSpeed = circleYSpeed * -1;
  }
  
  if (triangleXPos + 25 >= width || triangleXPos - 25 <= 0)
  {
    triangleXSpeed = triangleXSpeed * -1;  
  }
  
  if (triangleYPos + 25 >= height || triangleYPos - 25 <= 0)
  {
    triangleYSpeed = triangleYSpeed * -1;
  }
  
  if (pieXPos + 40 >= width || pieXPos - 40 <= 0)
  {
    pieXSpeed = pieXSpeed * -1;  
  }
  
  if (pieYPos + 40 >= height || pieYPos - 40 <= 0)
  {
    pieYSpeed = pieYSpeed * -1;
  }
  
  // Check for intersection
  // circle and square
  if (dist(squareXPos, squareYPos, circleXPos, circleYPos) <= 75)
  {
    /*println(squareYPos - circleYPos);
    if (((squareYPos - circleYPos) > 50) || ((circleYPos - squareYPos) > 50))
    {
      circleYPos = circleYPos * -1;
      
      squareYPos = squareYPos * -1;
    }*/
    
    //if (((squareXPos - circleXPos) > 50) || ((circleXPos - squareXPos) > 50))
    //{
      circleXSpeed = circleXSpeed * -1;
    
      squareXSpeed = squareXSpeed * -1;
    //}
  }
  
  // circle and pie
  if (dist(pieXPos, pieYPos, circleXPos, circleYPos) <= 75)
  {
    /*if (((pieYPos - circleYPos) > 50) || ((circleYPos - pieYPos) > 50))
    {
      circleYPos = circleYPos * -1;
      
      pieYPos = pieYPos * -1;
    }
    else
    {*/
      circleXSpeed = circleXSpeed * -1;
    
      pieXSpeed = pieXSpeed * -1;
    //}
  }
  
  // pie and square
  if (dist(squareXPos, squareYPos, pieXPos, pieYPos) <= 75)
  {
    pieXSpeed = pieXSpeed * -1;
    
    squareXSpeed = squareXSpeed * -1;
  }
  
  squareXPos += squareXSpeed;
  squareYPos += squareYSpeed;
  squareRotation += .2;
  
  circleXPos += circleXSpeed;
  circleYPos += circleYSpeed;
  
  triangleXPos += triangleXSpeed;
  triangleYPos += triangleYSpeed;
  triangleRotation += .1;
  
  pieXPos += pieXSpeed;
  pieYPos += pieYSpeed;
  pieRotation += .05;
  
}

void keyPressed()
{
  // switch positions with each other
  
  int switchNumber = int(random(0));
  int tempXPos;
  int tempYPos;
  
  switch (switchNumber)
  {
    case(0): 
    {
      //trianglePos old
      tempXPos = triangleXPos;
      tempYPos = triangleYPos;
      
      //new trianglePos
      triangleXPos = circleXPos;
      triangleYPos = circleXPos;
      
      //new circlePos
      circleXPos = squareXPos;
      circleYPos = squareYPos;
      
      //new squarePos
      squareXPos = pieXPos;
      squareYPos = pieXPos;
      
      //new piePos
      pieXPos = tempXPos;
      pieYPos = tempYPos;
    }
  }
}