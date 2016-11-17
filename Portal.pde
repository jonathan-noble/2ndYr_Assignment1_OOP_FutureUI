class Portal {

  float x ;
  float y ;
  float radius;
  float r;
  int c;
  int n_spoke = 6;
  float theta = 100;


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

      pushMatrix();
      translate(width/2, height/2);
      rotate(-r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.01;
      popMatrix();
      noFill();
      ellipse(x, y, radius-200, radius-200);
      
      float r = 45;
      float r2 = 30;
      pushMatrix();
      beginShape();
      for (int i = 0; i<n_spoke; i++) {
        vertex(x + r * cos(theta), y + r * sin(theta));
        theta += PI/ n_spoke;
        vertex(x + r2* cos(theta), y + r2 * sin(theta));
        theta += PI/ n_spoke;
      }
      endShape(CLOSE);
      popMatrix();
      
    }
  }
}