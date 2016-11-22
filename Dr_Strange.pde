/*import peasy.*;
 
 PeasyCam cam; 
 
 
 import ddf.minim.*;
 
 Minim minim;
 AudioPlayer player;
 */


backGround[] bg = new backGround[400];
//Bunny[] bunnies = new Bunny[50];
//Star[] stars = new Star[500];
Portal open_port;

int num = 30;
Ecolor[] ec=new Ecolor[num];
Particles[] part = new Particles[num];
createPortal createPort;
GameOfLife gol;
SolarSystem sun;


void setup() {
  // size(800, 600, P3D);
  size(800, 600);
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

  open_port = new Portal();
  createPort = new createPortal();

  for (int i=0; i<num; i++) {
    part[i]=new Particles();
    ec[i]=new Ecolor(random(25, 40), 255, (255));
  }

  for (int i = 0; i < bg.length; i++) {
    bg[i] = new backGround(open_port, random(-width/2, width/2), random(-height/2, height/2) );
  }

  /*
  for (int i = 0; i < bunnies.length; i++) {
   bunnies[i] = new Bunny(random(1, 1), random(-height/2, height/2) );
   }
   */

  // for (int i = 0; i < stars.length; i++) {
  // stars[i] = new Star(open_port);
  // }

  sun = new SolarSystem(50, 0, 0);
  sun.spawnMoons(1, 1);
  gol = new GameOfLife(open_port);
}


void draw() 
{
  background(random(mouseX/6, 2 * this.open_port.radius % 255), 200, 50);

  open_port.display();
  createPort.display();

  translate(pmouseX/2, pmouseY/2);
  for (backGround backg : bg) {
    backg.update();
    backg.display();
  }

  /*
  for (Bunny bun : bunnies) {
   bun.update();
   bun.display();
   }
   */



  if (keyPressed) 
  {

    if (key == '1')
    {
      sun.display();
      sun.orbit();
      //  for (Star star : stars) {
      //   star.update();
      //  star.display();
      // }
    }
    if (key == '4')
    {
      gol.generate();
      gol.display();
    }
  }

  for (int i=0; i<num; i++) {
    part[i].update();
    part[i].display();
    ec[i].display();
  }
}



PImage numbers[] = new PImage[4];
PImage n1, n2, n3, n4;

void showNumbers() {
  
  for (int i = 0; i < numbers.length; i++)
  {
    numbers[i] = loadImage(i + ".png");
  }
  
  
}
  