class Nodes
{
  //Starmap_solutions to connect nodes
  //Once all five nodes which surrounds the portal are all connected by
  //pressing the buttons with CreatePortal
  //The portal should then open by passing down the class Portal
  float x, y;
  float radius1, radius2; 
  int npoints;

  Nodes() {
    npoints = 4;
    x = random(width);
    y = random(height);
    radius1 = 20;
    radius2 = 15;
  }


  void display() {
    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;

    noFill();
    beginShape();
    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = x + cos(i) * radius2;
      float sy = y + sin(i) * radius2;
      vertex(sx, sy);
      sx = x + cos(i+halfTheta) * radius1;
      sy = y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}