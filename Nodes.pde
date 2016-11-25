class Nodes
{
  //Starmap_solutions to connect nodes
  //Once all five nodes which surrounds the portal are all connected by
  //pressing the buttons with CreatePortal
  //The portal should then open by passing down the class Portal

  //Try using PVectors
  float x, y;
  int xDir, yDir;
  float radius1, radius2; 
  int npoints;
  float c;
  float edgeX;
  float edgeY;


  Nodes() { //Portal port) {
    npoints = 4;
    x = random(width); // width/4; 
    y = random(height);//height/5; 
    radius1 = 6;
    radius2 = 12;
    xDir = 3;
    yDir = 3;
    // this.port = port;
    edgeX = width;
    edgeY = height;
  }

  void update() {
    x = x + random(-1, 1.2);//(width/2 * TWO_PI * radius1 );
    y = y + random(-1, 1.2);//(height/2 * TWO_PI * radius2);

    if ( x > edgeX * width/2 || y > edgeY * height/2)
    {
      x = random(width);
      y = random(height);
    }
  }

  void display() {
    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(5);
    smooth();
    fill(0, 0, 0, c);

    //xx
    c = c + 0.8;

    pushMatrix();
    // rotate();

    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;
    noFill();
    beginShape();
    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      rotate(radians(theta));
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * radius1;
      sy = y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    // theta = theta + 0.01;
    popMatrix();
  }
}


/*
class Nodes {
 float x, y;
 float angle;
 float p_speed;  //speed of the particle
 float p_size;  //size of the particle
 float p_thick;  //thickness of the particles
 float radius1, radius2;
 int npoints;
 float c;
 
 Nodes() {
 x = width/4;
 y = height/5;
 angle = random(250);
 p_speed = random(0.1, 0.2);
 p_size = random(10);
 p_thick = random(0.1, 1.5);
 radius1 = 6;
 radius2 = 12;
 npoints = 4;
 }
 
 void update() {
 angle += p_speed;      
 p_size += p_thick;
 //If p_size gets bigger, then p_thick resets back to 0
 if (p_size > 30 || p_size <0) {
 p_thick = -p_thick;
 }
 }
 
 
 void display() {
 stroke(random(20, 45), 255, random(200, 255), c);
 strokeWeight(5);
 smooth();
 fill(0, 0, 0, c);
 
 //xx
 c = c + 0.8;
 
 pushMatrix();
 translate(width/2, height/2);
 rotate(radians(angle));
 angle = TWO_PI / npoints;
 float halfTheta = angle/2.0;
 
 noFill();
 beginShape();
 for (float i = 0; i < TWO_PI; i += angle) {
 float sx = x + cos(i) * p_size;
 float sy = y + sin(i) * p_size;
 rotate(radians(angle));
 vertex(sx, sy);
 sx = x + cos(i+halfTheta) * p_size;
 sy = y + sin(i+halfTheta) * p_size;
 vertex(sx, sy);
 }
 endShape(CLOSE);
 // theta = theta + 0.01;
 popMatrix();
 }
 }
 
 */

/* Attempt to Inheritance 
 class Nodes extends Particles
 {
 //Starmap_solutions to connect nodes
 //Once all five nodes which surrounds the portal are all connected by
 //pressing the buttons with CreatePortal
 //The portal should then open by passing down the class Portal
 
 //Try using PVector
 
 
 Nodes(Portal port) { //Portal port) {
 
 }
 
 void update() {
 super.update();
 }
 
 void display() {
 stroke(random(20, 45), 255, random(200, 255), c);
 strokeWeight(5);
 smooth();
 fill(0, 0, 0, c);
 
 //xx
 c = c + 0.8;
 
 pushMatrix();
 // rotate();
 
 float theta = TWO_PI / npoints;
 float halfTheta = theta/2.0;
 noFill();
 beginShape();
 for (float i = 0; i < TWO_PI; i += theta) {
 float sx = x + cos(i) * radius2;
 float sy = y + sin(i) * radius2;
 rotate(radians(theta));
 vertex(sx, sy);
 sx = x + cos(i+halfTheta) * radius1;
 sy = y + sin(i+halfTheta) * radius1;
 vertex(sx, sy);
 }
 endShape(CLOSE);
 // theta = theta + 0.01;
 popMatrix();
 }
 }
 */