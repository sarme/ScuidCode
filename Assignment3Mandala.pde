int x, y;

// true = Big, false = small
boolean isSizeBigOrSmall = false;

// radii
int radius1 = 110;
int radius1p5 = 75;
int radius2 = 25;
int fatStarRad2p5 = 125;
int fatStarRad3 = 175;
int crclRingRad1 = 150;
int crclRingRadBG;
int petalLayerRad1 = 100;
int petalLayerRad1p25 = 160;
int petalLayerRad1p75 = 220;
int petalLayerRad2 = 280;
int crclRingRad2 = 250;
int diamondRing1Rad1 = 190;
int diamondRing1Rad1p5 = 205;
int diamondRing1Rad2 = 220;
int starRad1 = 15;
int starRad2 = 35;

// angles / positions
float ang1 = 0;
float ang2 = 0;
float fatStarAng2 = 30;
float crclPos1 = 0;
float crclPosBG = 15;
float crclPos2 = 15;
float petalLayerPos = 0;
float diamondRingPos = 0;
float starPos1 = 0;

// speeds
float rotSpdFatStar1 = 1;
float rotSpdStar1 = -2;
float rotSpdCircles1 = -2.5;
float bgRotSpd = .1;
float crclRotSpd2 = 1.2;
float rotSpdFatStar2 = 1;
float diamondRingRotSpd = 3;
float petalLayerRotSpd = -1;
float starRotSpd = 2;

// random silly color
int colorRed1 = 200;
int colorGreen1 = 100;
int colorBlue1 = 200;
color fatStarColor2;

// random silly color 2
int colorRed2 = 100;
int colorGreen2 = 150;
int colorBlue2 = 200;
color crclLayerColor2;

// other colors
color smallStarColor = color(random(0, 255), random(0, 255), random(0, 255));

void setup()
{
  size(800, 800);
  // test fps
  //frameRate(2);
  
  x = width/2;
  y = height/2;
  
  crclRingRadBG = (int(x * .8));
  crclRingRad1 = (int(x * .7));
}

void draw()
{
  //println(crclRingRadBG);
  background(150, 150, 150);
  translate(x, y);
  
  fill(100);
  
  if (crclRingRadBG >= 400)
  {
    isSizeBigOrSmall = true; 
  }
  else if (crclRingRadBG <= 290)
  {
    isSizeBigOrSmall = false;
  }

  if (isSizeBigOrSmall == true)
  {
    crclRingRadBG -= 1;
  }
  else if (isSizeBigOrSmall == false)
  {
    crclRingRadBG += 1;
  }
  
  circleRingBG();
  
  // random silly color
  colorRed2 = colorRed2 - int(random(-10, 10));
  colorGreen2 = colorGreen2 - int(random(-10, 10));
  colorBlue2 = colorBlue2 - int(random(-10, 10));
  
  crclLayerColor2 = color(colorRed2, colorGreen2, colorBlue2);
  
  fill(crclLayerColor2);
  circleLayer2();
  
  fill(190, 235, 0);
  petalLayer1();
  
  fill(232, 2, 221);
  circleLayer1();
  
  // random silly color
  colorRed1 = colorRed1 - int(random(-10, 10));
  colorGreen1 = colorGreen1 - int(random(-10, 10));
  colorBlue1 = colorBlue1 - int(random(-10, 10));
  
  fatStarColor2 = color(colorRed1, colorGreen1, colorBlue1);
  
  fill(fatStarColor2);
  drawFatStarShape2();
  
  fill(240, 22, 22);
  drawFatStarShape1();
  
  fill(32, 91, 214);
  drawStarShape1();
  
  pushMatrix();
  fill(50, 200, 0);
  drawCircleRing1();
  popMatrix();
  
  // colored in func
  diamondRing1();
  
  if (frameCount % 10 == 0)
  {
    smallStarColor = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  fill(smallStarColor);
  starShape1();
  

  // updateAngles();
  ang1 = ang1 + rotSpdFatStar1;
  ang2 = ang2 + rotSpdStar1;
  crclPos1 = crclPos1 + rotSpdCircles1;
  crclPosBG = crclPosBG + bgRotSpd;
  fatStarAng2 = fatStarAng2 + rotSpdFatStar2;
  petalLayerPos = petalLayerPos + petalLayerRotSpd;
  diamondRingPos = diamondRingPos + diamondRingRotSpd;
  starPos1 = starPos1 + starRotSpd;
  crclPos2 = crclPos2 + crclRotSpd2;
}

void drawFatStarShape1()
{
  beginShape();
  for (int i = 0; i < 12; i++)
  {
    if (i % 2 == 0)
    {
      vertex(cos(radians(ang1 + (30 * i))) * radius2, sin(radians(ang1 + (30 * i))) * radius2);
    }
    else
    {
        vertex(cos(radians(ang1 + (30 * (i - .75)))) * radius1p5, sin(radians(ang1 + (30 * (i - .75)))) * radius1p5);
        vertex(cos(radians(ang1 + (30 * i))) * radius1, sin(radians(ang1 + (30 * i))) * radius1);
        vertex(cos(radians(ang1 + (30 * (i + .75)))) * radius1p5, sin(radians(ang1 + (30 * (i + .75)))) * radius1p5);
    }
  }
  endShape(CLOSE);  
}

void drawFatStarShape2()
{
  beginShape();
  for (int i = 0; i < 12; i++)
  {
    if (i % 2 == 0)
    {
      vertex(cos(radians(fatStarAng2 + (30 * i))) * radius2, sin(radians(fatStarAng2 + (30 * i))) * radius2);
    }
    else
    {
        vertex(cos(radians(fatStarAng2 + (30 * (i - .5)))) * fatStarRad2p5, sin(radians(fatStarAng2 + (30 * (i - .5)))) * fatStarRad2p5);
        vertex(cos(radians(fatStarAng2 + (30 * i))) * fatStarRad3, sin(radians(fatStarAng2 + (30 * i))) * fatStarRad3);
        vertex(cos(radians(fatStarAng2 + (30 * (i + .5)))) * fatStarRad2p5, sin(radians(fatStarAng2 + (30 * (i + .5)))) * fatStarRad2p5);
    }
  }
  endShape(CLOSE);  
}

void drawStarShape1()
{
   beginShape();
  for (int i = 0; i < 20; i++)
  {
    if (i % 2 == 0)
    {
      vertex(cos(radians(ang2 + (18 * i))) * radius2 * .6, sin(radians(ang2 + (18 * i))) * radius2 * .6);
    }
    else
    {
        vertex(cos(radians(ang2 + (18 * i))) * radius1 * .6, sin(radians(ang2 + (18 * i))) * radius1 * .6);
    }
  }
  endShape(CLOSE); 
}

void drawCircleRing1()
{
  for (int i = 0; i < 6; i++)
  {
    ellipse(cos(radians(crclPos1 + (60 * i))) * crclRingRad1, sin(radians(crclPos1 + (60 * i))) * crclRingRad1, 60, 60);
  }
}

void circleRingBG()
{
  for (int i = 0; i < 21; i++)
  {
     ellipse(cos(radians(crclPosBG + (18 * i))) * crclRingRadBG, sin(radians(crclPosBG + (18 * i))) * crclRingRadBG, 95, 95);
  }
  fill(200, 142, 6);
  ellipse(0, 0, crclRingRadBG * 2.075, crclRingRadBG * 2.075);
}

void circleLayer1()
{
  for (int i = 0; i < 6; i++)
  {
       ellipse(cos(radians(fatStarAng2 + (60 * i))) * radius1, sin(radians(fatStarAng2 + (60 * i))) * radius1, 150, 150);
  }
}

void petalLayer1()
{
  for (int i = 0; i < 38; i++)
  {
  beginShape();
  
    float petalX, petalY;
  
    petalX = cos(radians(petalLayerPos + (10 * i))) * petalLayerRad1;
    petalY = sin(radians(petalLayerPos + (10 * i))) * petalLayerRad1;
  
    vertex(petalX, petalY);
    bezierVertex(cos(radians(petalLayerPos + (10 * i + 10))) * petalLayerRad1p25, sin(radians(petalLayerPos + (10 * i + 10))) * petalLayerRad1p25,
      cos(radians(petalLayerPos + (10 * i + 10))) * petalLayerRad1p75, sin(radians(petalLayerPos + (10 * i + 10))) * petalLayerRad1p75,
      cos(radians(petalLayerPos + (10 * i))) * petalLayerRad2, sin(radians(petalLayerPos + (10 * i))) * petalLayerRad2);
  
    vertex(cos(radians(petalLayerPos + (10 * i))) * petalLayerRad2, sin(radians(petalLayerPos + (10 * i))) * petalLayerRad2);
    bezierVertex(cos(radians(petalLayerPos + (10 * i - 10))) * petalLayerRad1p75, sin(radians(petalLayerPos + (10 * i - 10))) * petalLayerRad1p75,
      cos(radians(petalLayerPos + (10 * i - 10))) * petalLayerRad1p25, sin(radians(petalLayerPos + (10 * i - 10))) * petalLayerRad1p25,
      cos(radians(petalLayerPos + (10 * i))) * petalLayerRad1, sin(radians(petalLayerPos + (10 * i))) * petalLayerRad1);
    
  endShape(CLOSE);
  
  }
}

void diamondRing1()
{
  for (int i = 0; i < 12; i++)
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
    beginShape();
      
    vertex(cos(radians(diamondRingPos + (30 * i))) * diamondRing1Rad1, sin(radians(diamondRingPos + (30 * i))) * diamondRing1Rad1);
    vertex(cos(radians(diamondRingPos + (30 * i + 1))) * diamondRing1Rad1p5, sin(radians(diamondRingPos + (30 * i + 1))) * diamondRing1Rad1p5);
    vertex(cos(radians(diamondRingPos + (30 * i))) * diamondRing1Rad2, sin(radians(diamondRingPos + (30 * i))) * diamondRing1Rad2);
    vertex(cos(radians(diamondRingPos + (30 * i - 1))) * diamondRing1Rad1p5, sin(radians(diamondRingPos + (30 * i - 1))) * diamondRing1Rad1p5);
       
    endShape(CLOSE);
  }
}

void starShape1()
{
  beginShape();
  
  for (int i = 0; i < 10; i++)
  {
   if (i % 2 == 0)
   {
     vertex(cos(radians(starPos1 + (36 * i))) * starRad2, sin(radians(starPos1 + (36 * i))) * starRad2);
   }
   else
   {
     vertex(cos(radians(starPos1 + (36 * i))) * starRad1, sin(radians(starPos1 + (36 * i))) * starRad1);
   }
  }
  
  endShape(CLOSE);
}

void circleLayer2()
{
  for (int i = 0; i < 24; i++)
  {
    ellipse(cos(radians(crclPos2 + (15 * i))) * crclRingRad2, sin(radians(crclPos2 + (15 * i))) * crclRingRad2, 120, 120);
  }
}