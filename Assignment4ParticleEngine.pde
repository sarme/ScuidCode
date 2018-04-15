// Chris Arme
// Assignment 4: Particle Engine
// Due Date: Oct 3


int particleAmount = 50;
boolean start = true;
boolean[] particleShrinking = new boolean[particleAmount];
float magnetism = -2.0;

float[] particleX = new float[particleAmount];
float[] particleY = new float[particleAmount];
float[] particleXSpeed = new float[particleAmount];
float[] particleYSpeed = new float[particleAmount];
float[] particleSize = new float[particleAmount];
float[] particleRadii = new float[particleAmount];
float gravity = -.25;
float dampening = .75;
float friction = .75;
float[] particleDecayRate = new float[particleAmount];

// particleColor[i][0] = R
// particleColor[i][1] = G
// particleColor[i][2] = B
// particleColor[i][3] = A

float colorNumber = 1;
float[][] particleColor = new float[particleAmount][4];
String[] particleHexColor = new String[particleAmount];


void setup() {
  size(800, 500);
  background(125);
  textSize(30);
  noStroke();
}

void draw() 
{
  // Yes, I know the colors can be pretty terrible sometimes, but it is too fun
  changeBackgroundColor();

  for (int i = 0; i < particleAmount; i++)
  {
    drawAndMoveParticle(i);
  }
  start = false;
}

void createNewParticles(int element)
{
  boolean needToCreate = checkParticleDeath(element);
  
  if (needToCreate == true)
  {
    particleX[element] = int(random(50, width - 50));
    particleY[element] = int(random(50, height - 50));
    particleSize[element] = int(random(20, 40));
    particleXSpeed[element] = random(30) - 15;
    particleYSpeed[element] = random(30) - 15;
    particleRadii[element] = random(8);
    particleColor[element][0] = int(random(127));
    particleColor[element][1] = int(random(127));
    particleColor[element][2] = int(random(127));
    particleColor[element][3] = 255;
    
    particleDecayRate[element] = random(1);
    particleShrinking[element] = false;
  }
}

void drawAndMoveParticle(int element)
{
  createNewParticles(element);
  checkParticleMovementAndShrink(element);
  
  //change alpha
  particleColor[element][3] = particleColor[element][3] - particleDecayRate[element];
  
  float x = particleX[element];
  float y = particleY[element];
  float xSpeed = particleXSpeed[element];
  float ySpeed = particleYSpeed[element];
  float radii = particleRadii[element];
  float size = particleSize[element];
  
  //change color
  changeColor(element);
  
  rect(x, y, size, size, radii);
  
  if (particleShrinking[element] == false)
  {
    particleYSpeed[element] = particleYSpeed[element] + gravity;
  }

  particleX[element] = particleX[element] + xSpeed;
  particleY[element] = particleY[element] + ySpeed;
  
  checkEdges(element);
  applyForces(element);
}

void checkEdges(int element)
{
  // added + particleSize[element] for squares
  if ((particleX[element] <= 0) || (particleX[element] + particleSize[element] >= width)) {
    particleXSpeed[element] = particleXSpeed[element] * -1;
    if (particleX[element] <= 0)
    {
      particleX[element] = 0;
    }
    else if (particleX[element] + particleSize[element] >= width)
    {
      particleX[element] = width - particleSize[element];
    }
  }
  if (particleY[element] + particleSize[element] >= height) {
    particleY[element] = height - particleSize[element];
    particleYSpeed[element] = particleYSpeed[element] * -1;
  }
}

void applyForces(int element)
{
  //if (particleY[element] >= (height - (particleSize[element] / 2)))
  if ((particleY[element] <= (0)) && (particleShrinking[element] == false))
  {    
    particleY[element] = 0;
    particleYSpeed[element] = particleYSpeed[element] * -1;
    
    // apply forces from ground
    particleXSpeed[element] = particleXSpeed[element] * friction;
    particleYSpeed[element] = particleYSpeed[element] * dampening;
  }
}

boolean checkParticleDeath(int element)
{
  //if ((((abs(particleYSpeed[element]) <= 1) && (abs(particleXSpeed[element]) <= 1)) && (particleY[element] <= ((particleSize[element])))) || (start == true) || (particleColor[element][3] <= 0)) 
  if (((particleSize[element]) <= 2) || (start == true) || (particleColor[element][3] <= 0)) 
  { 
    return true;
  }
  else
  {
    return false;
  }
}

void checkParticleMovementAndShrink(int element)
{
  if ((((abs(particleYSpeed[element]) <= 1) && (abs(particleXSpeed[element]) <= 1)) && (particleY[element] <= ((10))))) 
  { 
    if(particleY[element] <= 2)
    {
      particleY[element] = 0;
      particleYSpeed[element] = 0;
    }
    else
    {
      particleYSpeed[element] = -1;
      particleShrinking[element] = true;
    }
    
    particleX[element] = particleX[element] + 1;
    particleSize[element] = particleSize[element] - 2;
  }
}

void changeColor(int element)
{
  float R = particleColor[element][0]+((sin((colorNumber*3+0)*1.3)*128) * (particleColor[element][0] / 127));
  float G = particleColor[element][1]+((sin((colorNumber*3+1)*1.3)*128) * (particleColor[element][0] / 127));
  float B = particleColor[element][2]+((sin((colorNumber*3+2)*1.3)*128) * (particleColor[element][0] / 127));
  float A = particleColor[element][3];
  
  fill(R, G, B, A);
  
  colorNumber += .0001;
  
  if (colorNumber >= 24)
  {
    colorNumber = 1;
  }
}

void changeBackgroundColor()
{
  float R = 100+((sin((colorNumber*.8+0)*1.3)*128));
  float G = 100+((sin((colorNumber*.8+1)*1.3)*128));
  float B = 100+((sin((colorNumber*.8+2)*1.3)*128));
  
  background(R, G, B);
}