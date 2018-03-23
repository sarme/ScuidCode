class GiantSquid extends SeaLife
{
  float originalSquidXSpeed;
  float originalSquidYSpeed;

  GiantSquid()
  {
    super();

    this.seaLifeImage = loadImage("Assignment7OOPAquarium/Images/SquidImage.png");
    this.seaLifeTint = color(color(random(100, 255), random(100, 255), random(100, 255), 200));

    this.seaLifeWidthSize = 226 * this.seaLifeSize;
    this.seaLifeHeightSize = 269 * this.seaLifeSize;
    this.createOriginalNumbers();
    this.seaLifeXSpeed = this.originalSquidXSpeed;
    this.seaLifeYSpeed = this.originalSquidYSpeed;
    this.seaLifeFloatRate = 0;
    this.seaLifeColor = color(random(255), random(255), random(255));
  }

  void drawSquid()
  {
    this.moveSquidSporadically();
    super.generalControl();

    pushMatrix();

    tint(this.seaLifeTint);
    translate(this.seaLifeXPos, this.seaLifeYPos);
    super.checkSeaLifeDirection();
    this.flipSquidVertically();
    image(this.seaLifeImage, 0, 0, this.seaLifeWidthSize, this.seaLifeHeightSize);

    popMatrix();
  }

// This will move the squids in bursts randomly
  void moveSquidSporadically()
  {
    if ((abs(this.seaLifeXSpeed) == (abs(this.originalSquidXSpeed))) && (abs(this.seaLifeYSpeed) == abs(this.originalSquidYSpeed)))
    {
      float randomNum = random(0, 5);

      if (randomNum > 4)
      {
        if (this.seaLifeXSpeed >= 0) 
        { 
          this.seaLifeXSpeed += 3;
        } else 
        {
          this.seaLifeXSpeed -= 3;
        }

        if (this.seaLifeYSpeed >= 0) 
        { 
          this.seaLifeYSpeed += 3;
        } else 
        {
          this.seaLifeYSpeed -= 3;
        }
      }
    } else
    {
      if ((this.seaLifeXSpeed > 0) && (abs(this.seaLifeXSpeed) != abs(this.originalSquidXSpeed))) 
      { 
        this.seaLifeXSpeed -= .05;
      } else if ((this.seaLifeXSpeed < 0) && (abs(this.seaLifeXSpeed) != abs(this.originalSquidXSpeed)))
      {
        this.seaLifeXSpeed += .05;
      }

      if ((this.seaLifeYSpeed >= 0) && (abs(this.seaLifeYSpeed) != abs(this.originalSquidYSpeed))) 
      { 
        this.seaLifeYSpeed -= .05;
      } else if ((this.seaLifeYSpeed < 0) && (abs(this.seaLifeYSpeed) != abs(this.originalSquidYSpeed)))
      {
        this.seaLifeYSpeed += .05;
      }
    }

    if (abs(this.seaLifeXSpeed) < abs(this.originalSquidXSpeed))
    {
      if (this.seaLifeXSpeed > 0)
      {
        this.seaLifeXSpeed = abs(this.originalSquidXSpeed);
      } else if (this.seaLifeXSpeed < 0)
      {
        this.seaLifeXSpeed = abs(this.originalSquidXSpeed) * -1;
      }

      if (this.seaLifeYSpeed >= 0)
      {
        this.seaLifeYSpeed = abs(this.originalSquidYSpeed);
      } else if (seaLifeYSpeed < 0)
      {
        this.seaLifeYSpeed = abs(this.originalSquidYSpeed) * -1;
      }
    }
  }

  // Flips the squid image vertically
  void flipSquidVertically()
  {
    //println(seaLifeYSpeed);
    if (seaLifeYSpeed > 0)
    {
      scale(1, -1);
    } else if (seaLifeYSpeed <= 0)
    {
      scale(1, 1);
    }
  }

  // This is needed because the speed can not be < .05 (the slow down interval), else the squid will flip directions nonstop
  void createOriginalNumbers()
  {
    boolean isXPosOrNeg;
    boolean isYPosOrNeg;
    // true = Pos, false = Neg

    int randomXBooleanNum = int(random(0, 3));
    int randomYBooleanNum = int(random(0, 3));

    // Create X value
    if (randomXBooleanNum > 1)
    {
      isXPosOrNeg = true;
    } else
    {
      isXPosOrNeg = false;
    }

    if (isXPosOrNeg)
    {
      originalSquidXSpeed = random(.051, .5);
    } else
    {
      originalSquidXSpeed = random(-.5, -.051);
    }

    // Create Y value
    if (randomYBooleanNum > 1)
    {
      isYPosOrNeg = true;
    } else
    {
      isYPosOrNeg = false;
    }

    if (isYPosOrNeg)
    {
      originalSquidYSpeed = random(.051, .5);
    } else
    {
      originalSquidYSpeed = random(-.5, -.051);
    }
  }
}