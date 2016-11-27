class Nodes
{
  //Once all five nodes which surrounds the portal are all connected by
  //pressing the buttons with CreatePortal
  //The portal should then open by passing down the class Portal
  PVector location; 
  PVector locNodes;
  float x, y;
  float radius1, radius2; 
  int npoints;
  float c;

  Nodes(TableRow row) { 
    location = new PVector(row.getFloat("X"), row.getFloat("Y")); 
    locNodes = new PVector(map(location.x, 0, 1200, 0, width), 
      map(location.y, 0, 700, 0, height));
    x = (row.getFloat("X"));
    y = (row.getFloat("Y"));
    radius1 = 6;
    radius2 = 12;
    npoints = 4;
  }


  void update() {
  }

  void display() {
    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(5);
    smooth();
    fill(0, 0, 0, c);
    c = c + 1;

    pushMatrix();
    float theta = TWO_PI / npoints;
    float halfTheta = theta/2.0;
    noFill();
    beginShape();
    for (float i = 0; i < TWO_PI; i += theta) {
      float sx = locNodes.x + cos(i) * radius2;
      float sy = locNodes.y + sin(i) * radius2;
      vertex(sx, sy);
      sx = locNodes.x +  cos(i+halfTheta) * radius1;
      sy = locNodes.y + sin(i+halfTheta) * radius1;
      vertex(sx, sy);
      ellipse(x, y, radius1, radius1);
    }
    endShape(CLOSE);
    popMatrix();
  }
}