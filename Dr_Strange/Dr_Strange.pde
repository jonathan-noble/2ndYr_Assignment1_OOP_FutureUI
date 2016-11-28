/*
 Author:   Jonathan Noble - C15487922
 Year:     DT282/2
 Program:  Assignment1_OOP (Doctor Strange Portal UI)
 Due Date: 29/11/2016
 */

/*
import ddf.minim.*;
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
ArrayList<Nodes> nodes = new ArrayList<Nodes>();
boolean exec = false;
float nodeX;
float nodeY;
float nodeSize;

//Declaring the images of the numbers 
PImage numbers[] = new PImage[4];

//Declaring the particles
Particles[] part = new Particles[30];

//Declaring the places inside the Portal
ArrayList<SolarSystem> system = new ArrayList <SolarSystem>();
int lastTime = 0;
StatueOfLiberty sol;
EiffelTower eiffel;
Buddha bud;
GameOfLife gol;



void setup() {
  size(1200, 700);
  colorMode(HSB);

  /*
  minim = new Minim(this);
   player = minim.loadFile("music.mp3");   
   player.play();
   
   */
  //Initializing the portal and it's magic wand
  open_port = new Portal();
  createPort = new createPortal();


  //Initializing the diamond nodes and the table
  Table table = loadTable("skills.csv", "header");
  for (TableRow row : table.rows())
  {
    Nodes node = new Nodes(row);//open_port);
    nodes.add(node);
  } 

  //XXXX
  /*  nodeX = this.nodes.x;
   nodeY = this.nodes.y;
   nodeSize = this.nodes.radius1;
   
   */
  //Initializing the images the of the numbers
  for (int i = 0; i < numbers.length; i++)
  {
    numbers[i] = loadImage("num" + i + ".png");
  }

  //Initializing the Particles and it's color around the portal
  for (int i=0; i<part.length; i++) {
    part[i]=new Particles();
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
  SolarSystem sun = new SolarSystem(0, 0.01, 0, "sun.png");
  SolarSystem earth = new SolarSystem( 310, 1/2, 0.05, "earth.png");
  SolarSystem moon = new SolarSystem( 120, 200, 0.65, "moon.png");
  system.add(sun);
  sun.add(earth);
  earth.add(moon);
  lastTime = millis();


  sol = new StatueOfLiberty(open_port, -50, -80);
  eiffel = new EiffelTower(open_port, -103, -90);
  bud = new Buddha(open_port, -150, -130);
  gol = new GameOfLife(open_port);


  //Display the skills unlocked
  for (Nodes node : nodes)
  {
    println(node);
  }
}


void draw() 
{
  background(random(mouseX/6, 2 * this.open_port.radius % 255), 200, 50);
  int count = 0;
  float delta = (millis() - lastTime) / 1000.0f;

  for (Nodes node : nodes) {
    float x = node.location.x;
    float y = node.location.y;
    node.update();
    node.display();

    if (mouseX >= x && mouseX <= x + width/2 && 
      mouseY >= y && mouseY <= y + height/2) {
      textAlign(LEFT, CENTER);
      fill(255);
      text(node.abilityName, x + 10, y - 2);
    }
  }


  for (BackGround backg : bg) {
    backg.update();
    backg.display();
  }
  for (BG_Objects bgObj : bgObjects) {
    bgObj.update();
    bgObj.display();
  }

  createPort.display();
  connectNodes(mouseX, mouseY);

  if (mousePressed == true) // if (exec) // if all nodes are Connected == true
  {
    open_port.display();

    translate(width/2, height/2);
    if (keyPressed) 
    {
      if (key == '1')
      {
        pushMatrix();
        for (SolarSystem solarS : system) {
          solarS.display();
          solarS.update(delta);
        }
        popMatrix();
        lastTime = millis();
        showNumbers();
      }

      if (key == '2')
      {
        sol.display();
        showNumbers();
      }
      if (key == '3')
      {
        eiffel.display();
        showNumbers();
      }

      if (key == '4')
      {
        bud.display();
      }

      if (key == '5')
      {
        gol.generate();
        gol.display();
        showNumbers();
      }

      if (key == '6')
      {
        gol.generate();
        gol.display();
        showNumbers();
      }
    }

    for (Particles par : part) {
      par.update();
      par.display();
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
}// end draw function

void connectNodes(int x, int y) {

  if ( overNodes(nodeX, nodeY, nodeSize)  ) {
    exec = true;
  } else {
    exec = false;
  }
}


boolean overNodes(float x, float y, float radius) 
{

  //for (int i = 0; i < nodes.size(); i++) {
  //  Nodes node = nodes.get(i);

  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < radius/2 ) {
    return true;
  } else {
    return false;
  }
}


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