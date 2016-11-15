class Portal {
  
    float x ;
    float y ;
    float diameter;
    
    //Constructor
 Portal() {
     x = width/2;
     y = height/2;
     diameter = 250;
 }
    
  
  void display()
  {
  stroke(random(0, 100), 255, 255);
  strokeWeight(10);
  noFill();
    if(mousePressed) {
        ellipse(x, y, diameter, diameter);
    }
  
  }
}

  