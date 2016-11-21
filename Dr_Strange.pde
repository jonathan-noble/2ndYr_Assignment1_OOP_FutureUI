/*import peasy.*;
 
 PeasyCam cam; 
 */

import ddf.minim.*;

Minim minim;
AudioPlayer player;

int num = 40;
backGround[] bg = new backGround[800];
//Star[] stars = new Star[500];
Portal open_port;
Ecolor[] ec=new Ecolor[num];
Particles[] part = new Particles[num];
createPortal createPort;
GameOfLife gol;


void setup() {
  // size(800, 600, P3D);
  size(800, 600);
  colorMode(HSB);

  minim = new Minim(this);
  player = minim.loadFile("music.mp3");
  /*
   cam = new PeasyCam(this, 500);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(500);
   */

  open_port = new Portal();

  for (int i=0; i<num; i++) {
    part[i]=new Particles();
    ec[i]=new Ecolor(random(25, 40), 255, (255));
  }

  createPort = new createPortal();
  for (int i = 0; i < bg.length; i++) {
    bg[i] = new backGround(open_port);
  }

  // for (int i = 0; i < stars.length; i++) {
  // stars[i] = new Star(open_port);
  // }

  gol = new GameOfLife(open_port);

  player.play();
}


void draw() 
{
  background(220, 100, 120);


  open_port.display();
  createPort.display();

  translate(width/2, height/2);
  for (backGround backg : bg) {
    backg.update();
    backg.display();
  }

  for (int i=0; i<num; i++) {
    part[i].update();
    part[i].display();
    ec[i].display();
  }


  if (keyPressed) 
  {

    if (key == '1')
    {
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
}