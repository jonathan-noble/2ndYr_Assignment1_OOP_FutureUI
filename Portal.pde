class Portal {
  float x, y;
  float radius;
  float r;
  float c;
  // PVector v;

  //Constructor
  Portal() {
    x = width/2;
    y = height/2;
    radius = 450;
    r = 0;
    c = 30;

    // v = 0;
  }


  void display()
  {
    // PVector offset = PVector.random3D();
    //v.add(offset);

    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(5);
    smooth();
    fill(0, 0, 0, c);

    //xx
    c = c + 0.8 ;
    /*if(c > 0)
     {
     c = 30;
     } */


    if (mousePressed) {

      pushMatrix();
      translate(width/2, height/2);
      rotate(r);
      // Particles rotating around this ellipse
      ellipse(0, 0, radius+20, radius+20);
      r = r + 0.009;
      popMatrix();

      ellipse(x, y, radius, radius);


      if (keyPressed)
      {
        return;
      }

      fill(random(mouseX/3, 220), 50, random(240,255));
      ellipse(x, y, radius+20, radius+20);
      ellipse(x, y, radius, radius);

      pushMatrix();
      rectMode(CENTER);
      translate(width/2, height/2);
      rotate(r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.009;
      popMatrix();

      pushMatrix();
      translate(width/2, height/2);
      rectMode(CENTER);
      rotate(-r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.009;
      popMatrix();

      noFill();
      ellipse(x, y, radius-200, radius-200);


      pushMatrix();
      translate(width*0.5, height/2);
      rotate(r);
      //star(123, 60, 100, 3);
      star(0, 0, 123, 60, 3);
      r = r + 0.009;
      popMatrix();

      pushMatrix();
      translate(width*0.5, height/2);
      rotate(r);
      //star(-123, -60, 100, 3);
      star(0, 0, -123, -60, 3);
      r = r + 0.009;
      popMatrix();
    }
  }

  /*
  void star(float r1, float r2, float theta, int n_spoke)
   {
   beginShape();
   for (int i = 0; i<n_spoke; i++) {
   vertex(x + cos(theta) * r1, y + sin(theta) * r1 );
   theta += TWO_PI/ n_spoke;
   vertex(x + cos(theta) * r2, y + sin(theta) * r2);
   theta += TWO_PI/ n_spoke;
   }
   endShape(CLOSE);
   }
   
   */

  void star(float x, float y, float radius1, float radius2, int npoints) {
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

//-----------------------------------------------