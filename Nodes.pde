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
    x = width/4; // random(width); 
    y = height/5; // random(height);
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

    if ( x > edgeX || y > edgeY)
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