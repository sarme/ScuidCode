// Chris Arme
// Assignment 7
// An "Aquarium" with Crabs, GiantSquids, Fish and Bubbles which the fish blow, all of which are subclasses of the SeaLife superclass. There is also Seaweed, but it is its own class.



float aquariumBottomSize = 25;
float aquariumBottomStart;
int numberOfFish = int(random(5, 50));
int numberOfCrabs = int(random(3, 10));
int numberOfSquids = int(random(1, 5));
int numberOfSeaweed = int(random(40, 60));
Fish[] fish = new Fish[numberOfFish];
Crab[] crabs = new Crab[numberOfCrabs];
GiantSquid[] squids = new GiantSquid[numberOfSquids];
Seaweed[] seaweed = new Seaweed[numberOfSeaweed];

void setup()
{ 
  noStroke();
  imageMode(CENTER);
  background(#0077be);
  size(1000, 600);
  
  aquariumBottomStart = height - aquariumBottomSize;
  
  // This is the fish bubble sound!
  
  // This creates the original versions of the objects
  createAllObjects();
}

void draw()
{ 
  background(#0077be);
  
  // These draw the aquarium bottom and all the objects inside the aquarium
  drawAllObjects();
  drawAquariumBottom();
}

void createAllObjects()
{
  for (int i = 0; i < numberOfFish - 1; i++)
  {
    fish[i] = new Fish();
  }
  
  for (int i = 0; i < numberOfCrabs; i++)
  {
    crabs[i] = new Crab();
  }
  
  for (int i = 0; i < numberOfSquids; i++)
  {
    squids[i] = new GiantSquid();
  }
  
  for (int i = 0; i < numberOfSeaweed; i++)
  {
    seaweed[i] = new Seaweed();
  }
}

void drawAllObjects()
{
  for (int i = 0; i < numberOfSquids; i++)
  {
    squids[i].drawSquid();
  }
  
  for (int i = 0; i < numberOfFish - 1; i++)
  {
    fish[i].drawFish();
  }
  
  for (int i = 0; i < numberOfCrabs; i++)
  {
    crabs[i].drawCrab();
  }
  
  for (int i = 0; i < numberOfSeaweed; i++)
  {
    seaweed[i].drawSeaweed();
  }
}

void drawAquariumBottom()
{
  fill(25, 75, 25);
  rect(0, aquariumBottomStart, width, aquariumBottomSize);
}