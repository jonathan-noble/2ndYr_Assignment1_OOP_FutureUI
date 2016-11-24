class Nodes
{
  //Starmap_solutions to connect nodes
  //Once all five nodes which surrounds the portal are all connected by
  //pressing the buttons with CreatePortal
  //The portal should then open by passing down the class Portal


  float x, y;
  float size;
  PShape diamond;


  Nodes() {

  }


  void display() 
  {
    fill(255);
    stroke(0);
    beginShape(TRIANGLE_FAN);
    vertex(57.5, 50);
    vertex(57.5, 15); 
    vertex(92, 50); 
    vertex(57.5, 85); 
    vertex(22, 50); 
    vertex(57.5, 15); 
    endShape();
  }
}