class Portal {
  float x, y;
  float radius;
  float r;
  int c;
  int n_spoke = 6;
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
    float hu = 0;
    // PVector offset = PVector.random3D();
    //v.add(offset);

    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(3);
    smooth();
    fill(0, 0, 0, c);

    //xx
    c = c + 2;
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
      r = r + 0.02;

      popMatrix();

      ellipse(x, y, radius, radius);


      if (keyPressed)
      {
        return;
      }

      fill(200, 80, 80);
      ellipse(x, y, radius+20, radius+20);
      ellipse(x, y, radius, radius);

      pushMatrix();
      rectMode(CENTER);
      translate(width/2, height/2);
      rotate(r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.02;
      popMatrix();

      pushMatrix();
      translate(width/2, height/2);
      rectMode(CENTER);
      rotate(-r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.02;
      popMatrix();
      noFill();
      ellipse(x, y, radius-200, radius-200);


      pushMatrix();
      star(123, 60, 100);
      popMatrix();

      pushMatrix();
      star(-123, -60, 100);
      popMatrix();
    }
  }

  void star(float r1, float r2, float theta )
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
}

//-----------------------------------------------