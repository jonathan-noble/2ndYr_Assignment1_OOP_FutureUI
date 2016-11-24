/*import peasy.*;
 import ddf.minim.*;
 
 PeasyCam cam; 
 Minim minim;
 AudioPlayer player;
 */

//Declaring Starfield background and the portal
BackGround[] bg = new BackGround[400];
Bunny[] bunnies = new Bunny[3];
Portal open_port;
createPortal createPort;
int randNodes = int(random(4, 7));
Nodes[] nodes = new Nodes[randNodes];

//Declaring the images of the numbers 
PImage numbers[] = new PImage[4];

//Declaring the particles
int num = 30;
Ecolor[] ec=new Ecolor[num];
Particles[] part = new Particles[num];

//Declaring the places inside the Portal
SolarSystem sun;
GameOfLife gol;


void setup() {
  // size(800, 600, P3D);
  size(1000, 700);
  colorMode(HSB);
  //imageMode(CENTER);
  /*
  minim = new Minim(this);
   player = minim.loadFile("music.mp3");
   
   cam = new PeasyCam(this, 500);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(500);
   
   player.play();
   */

  //Initializing the portal and it's magic wand
  open_port = new Portal();
  createPort = new createPortal();

  //Initializing the images the of the numbers
  for (int i = 0; i < numbers.length; i++)
  {
    numbers[i] = loadImage("num" + i + ".png");
  }

  //Initializing the Particles and it's color around the portal
  for (int i=0; i<num; i++) {
    part[i]=new Particles();
    ec[i]=new Ecolor(random(25, 40), 255, (255));
  }

  //Initializing the starfield background
  for (int i = 0; i < bg.length; i++) {
    bg[i] = new BackGround(open_port, 
    random(-width/2, width/2), random(-height/2, height/2), random(width/2));
  }

  //Initializing the bunnies flying around the starfield
  for (int i = 0; i < bunnies.length; i++) {
    bunnies[i] = new Bunny(open_port, 
    random(1, 1), random(-height/2, height/2), random(width/2) );
  }

  //Initializing the diamond nodes
  for (int i = 0; i < nodes.length; i++)
  {
    nodes[i] = new Nodes();
  } 


  //Places inside the Portal initialized here
  sun = new SolarSystem(50, 0, 0);
  sun.spawnMoons(1, 1);
  gol = new GameOfLife(open_port);
}


void draw() 
{
  background(random(mouseX/6, 2 * this.open_port.radius % 255), 200, 50);

  open_port.display();
  createPort.display();
  
   for (int i = 0; i < nodes.length; i++)
  {
    nodes[i].update();
    nodes[i].display();
  }
  

 translate(width/2, height/2); // try calling translate locally
  for (BackGround backg : bg) {
    backg.update();
    backg.display();
  }
  for (Bunny bun : bunnies) {
    bun.update();
    bun.display();
  }


  if (mousePressed == true)
  {

    if (keyPressed) 
    {
      if (key == '1')
      {
        sun.display();
        sun.orbit();
        showNumbers();
      }

      if (key == '2')
      {

        showNumbers();
      }
      if (key == '3')
      {

        showNumbers();
      }

      if (key == '4')
      {
        gol.generate();
        gol.display();

        showNumbers();
      }
    }


    for (int i=0; i<num; i++) {
      part[i].update();
      part[i].display();
      ec[i].display();
    }
  } // end mousePressed = true

  /*      ONLY USE THIS ONCE YOU'RE FINISHED WITH NODES 
   THE BACKGROUND ROTATES AROUND THE PORTAL
   for (BackGround backg : bg) {
   backg.update();
   backg.display();
   }
   for (Bunny bun : bunnies) {
   bun.update();
   bun.display();
   }
   */
} // end draw function

void showNumbers() {
  float imgPosX = -width/2.05;
  float imgPosY = -height/2.2;
  float imgSizeX = 175;
  float imgSizeY = 300;

  //Lerp the image's color to fade from solid to transparent

  if (keyPressed)
  { 
    if (key == '1')
      image(numbers[0], imgPosX, imgPosY, imgSizeX, imgSizeY);

    if (key == '2')
      image(numbers[1], imgPosX, imgPosY, imgSizeX, imgSizeY);

    if (key == '3')
      image(numbers[2], imgPosX, imgPosY, imgSizeX, imgSizeY);

    if (key == '4')
      image(numbers[3], imgPosX, imgPosY, imgSizeX, imgSizeY);
  }
} // end showNumbers function