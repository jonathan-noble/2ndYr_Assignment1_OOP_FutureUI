//PeasyCam cam;

Star[] stars = new Star[500];
Portal port;


float speed;

void setup() {
  size(500, 500);
  colorMode(HSB);
  port = new Portal();

//  cam =new PeasyCam(this, 100);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(port);
 }
  
 // for (int i = 0; i < port.length; i++) {
 //    port[i] = new Portal();
 // }
  
  
}

void draw() {
  speed = map(mouseX, 0, width, 0, 20);
 background(0);
  noFill();
 
 port.display();
 
  
// Draw everything relative to (width, height)
 translate(width/2+12, height/2);
 for (int i = 0; i < stars.length; i++) {
  // scale(0.7, 0.7, 0.7);
    stars[i].update();
    stars[i].show();
    
  }
  
 
}