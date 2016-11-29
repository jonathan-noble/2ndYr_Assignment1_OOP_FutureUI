class Nodes
{
  //Once all five nodes which surrounds the portal are all connected by
  //pressing/hovering the buttons with CreatePortal
  //The portal should then open by passing down the class Portal
  String abilityName;
  PVector location; 
  PVector locNodes;
  float radius1, radius2; 
  int npoints;
  float c;

  Nodes(TableRow row) { 
    abilityName = row.getString("Ability Name");
    location = new PVector(row.getFloat("X"), row.getFloat("Y")); 
    locNodes = new PVector(map(location.x, 0, 1200, 0, width),  
      map(location.y, 0, 700, 0, height));  // value of location from table is being mapped to the screen's size
    radius1 = 6;
    radius2 = 12;
    npoints = 4;
  }

  void display() {
    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(5);
    fill(0, 0, 0, c);
    //shade of color is being incremented
    c = c + 1;
    
    // Draw a star/diamond shape as nodes
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
    }
    endShape(CLOSE);
    popMatrix();
  }
  
   String toString()
   {
     return abilityName;
   }
     
}