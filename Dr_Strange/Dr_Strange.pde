/*import peasy.*;
 import ddf.minim.*;
 
 PeasyCam cam; 
 Minim minim;
 AudioPlayer player;
 */

// I am declaring everything in order of sequence and priority

//Declaring Starfield background and the portal
BackGround[] bg = new BackGround[400];
BG_Objects[] bgObjects = new BG_Objects[1];

//Declaring the Portal and the nodes
Portal open_port;
createPortal createPort;
Nodes[] nodes = new Nodes[5];

//Declaring the images of the numbers 
PImage numbers[] = new PImage[4];

//Declaring the particles
int num = 30;
Ecolor[] ec =new Ecolor[num];
Particles[] part = new Particles[num];

//Declaring the places inside the Portal
SolarSystem sun;
GameOfLife gol;


void setup() {
  // size(800, 600, P3D);
  size(1000, 700);
  colorMode(HSB);
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

  //Initializing the diamond nodes
  for (int i = 0; i < nodes.length; i++)
  {
    nodes[i] = new Nodes();//open_port);
  } 


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
      random(-width/2, width/2), random(-height/2, height/2), random(width/2) );
  }

  //Initializing the bgObjects flying around the starfield
  for (int i = 0; i < bgObjects.length; i++) {
    bgObjects[i] = new BG_Objects(open_port, 
      random(width/2, width/2), random(height/2, height/2), random(width/2));
  }


  //Places inside the Portal initialized here
  sun = new SolarSystem(50, 0, 0);
  sun.spawnMoons(1, 1);
  gol = new GameOfLife(open_port);
}


void draw() 
{
  background(random(mouseX/6, 2 * this.open_port.radius % 255), 200, 50);

  for (Nodes node : nodes) {
    node.update();
    node.display();
  }

  for (BackGround backg : bg) {
    backg.update();
    backg.display();
  }
  for (BG_Objects bgObj : bgObjects) {
    bgObj.update();
    bgObj.display();
  }


  if (mousePressed == true) // if all nodes are Connected == true
  {
    open_port.display();
    createPort.display();

    translate(width/2, height/2);
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
   for (BG_Objects bgObj : bgObjects) {
   bgObj.update();
   bgObj.display();
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
