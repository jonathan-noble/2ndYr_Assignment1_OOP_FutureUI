class Portal {

  float x ;
  float y ;
  float radius;
  float r;
  int c;

  //Constructor
  Portal() {
    x = width/2;
    y = height/2;
    radius = 300;
    r = 0;
    c = 30;
  }


  void display()
  {
    stroke(random(0, 100), 255, 255, c);
    strokeWeight(6);
    smooth();
    fill(0, 0, 0, c);
   
    //xx
    c = c + 1;
    /*if(c > 0)
     {
     c = 30;
     } */


    rectMode(CENTER);
    if (mousePressed) {
      ellipse(x, y, radius+20, radius+20);
      ellipse(x, y, radius, radius);


      if (keyPressed)
      {
        return;
      }
     
      fill(50);
      ellipse(x, y, radius+20, radius+20);
      ellipse(x, y, radius, radius);
      
      pushMatrix();
       translate(width/2, height/2);
      rotate(r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.01;
      popMatrix();
    }
  }
}