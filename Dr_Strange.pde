/*import peasy.*;
 
 PeasyCam cam; 
 */
backGround[] bg = new backGround[600];
Star[] stars = new Star[500];
Portal open_port;
createPortal createPort;
Game_Of_Life[] GoL = new Game_Of_Life[10];


float speed;

void setup() {
  // size(800, 600, P3D);
  size(800, 600);
  colorMode(HSB);

  /*
   cam = new PeasyCam(this, 500);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(500);
   */
  for (int i = 0; i < bg.length; i++) {
    bg[i] = new backGround();
  }


  open_port = new Portal();
  createPort = new createPortal();

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(open_port);
  }

  for (int i = 0; i < GoL.length; i++) {
    GoL[i] = new Game_Of_Life(open_port);
  }
}


void draw() 
{
  speed = map(mouseX, 0, width, 0, 20);
  background(200, 80, 80);
  noFill();

  open_port.display();
  createPort.display();

  translate(width/2, height/2);
  for (backGround backg : bg) {
    backg.update();
    backg.display();
  }
  if (keyPressed)
  {
    if (key == '1')
    {
      for (Star star : stars) {
        star.update();
        star.display();
      }
    }
    if (key == '2')
    {
      for (Game_Of_Life gol : GoL) {
        //   gol.update();
        //  gol.display();
      }
    }
  }
}