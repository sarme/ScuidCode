class Player
{
  boolean touchingGround;
  boolean isSpacePressed;
  boolean isSPressed;
  boolean atMaxSpeed;
  boolean canJump;
  float playerOrigXPos;
  float playerXPos;
  float playerYPos;
  float playerYSpeed;
  float playerMaxYSpeed;
  float playerWidth;
  float playerHeight;
  color playerColor;
  
  float gravity;
  float timeSincePlayerJumped;
  
  Player()
  {
    this.playerWidth = 50;
    this.playerHeight = 75;
    this.playerOrigXPos = 200 - (playerWidth / 2);
    this.playerXPos = playerOrigXPos;
    this.playerYPos = ground.groundYPos - (playerHeight / 2);
    this.playerYSpeed = 0;
    this.playerMaxYSpeed = 10;
    this.playerColor = color(255);
    
    this.gravity = -.6;
    this.timeSincePlayerJumped = 0;
  }
  
  void displayPlayer()
  {
    movePlayer();
    slamDown();
    applyGravity();

    
    pushMatrix();
    
      translate(playerXPos, playerYPos);
      fill(playerColor);
      ellipse(0, 0, playerWidth, playerHeight);
    
    popMatrix();
  }
  
  void movePlayer()
  {
    jump();
    playerYPos -= playerYSpeed;
    
    if (playerXPos < playerOrigXPos)
    {
      playerXPos += .25;
    }
    else if (playerXPos > playerOrigXPos)
    {
      playerXPos = playerOrigXPos;
    }
  }
  
  void applyGravity()
  {
    checkIfTouchingGround();
    if (!touchingGround && ((timeSincePlayerJumped >= 20) || !isSpacePressed))
    {
      playerYSpeed += gravity;
    }
  }
  
  void checkIfTouchingGround()
  {
    if ((playerYPos + (playerHeight / 2)) >= ground.groundYPos)
    {
      touchingGround = true;
      playerYSpeed = 0;
      playerYPos = ground.groundYPos - (playerHeight / 2);
      
      if (timeSincePlayerJumped > 0)
      {
      }
      
      canJump = true;
      timeSincePlayerJumped = 0;
    }
    else
    {
      touchingGround = false;
      timeSincePlayerJumped += 1;
    }  
  }
  
  void jump()
  {
    if (playerYSpeed >= playerMaxYSpeed)
    {
      playerYSpeed = playerMaxYSpeed;
      atMaxSpeed = true;
    }
    
    if ((playerYSpeed == 0) && (touchingGround))
    {
      atMaxSpeed = false;
    }
    
    // jump
    if (isSpacePressed && (!atMaxSpeed) && canJump)
    {
      touchingGround = false;
      playerYSpeed += 1.5;
    }
  } 
  
  void slamDown()
  {
    if (!touchingGround && isSPressed)
    {
      playerYSpeed = -35;
      //playerYPos = ground.groundYPos - (playerHeight / 2);
    }
  }
  
  boolean isPlayerJumping()
  {
    if (isSpacePressed)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}