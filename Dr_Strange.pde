//PeasyCam cam;

Star[] stars = new Star[500];
Portal open_port;
createPortal createPort;
Game_Of_Life[] GoL = new Game_Of_Life[10];


float speed;

void setup() {
  size(800, 600);
  colorMode(HSB);
  open_port = new Portal();
  createPort = new createPortal();

  //  cam =new PeasyCam(this, 100);
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


  // Draw everything relative to (width, height)
  translate(width/2, height/2);
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