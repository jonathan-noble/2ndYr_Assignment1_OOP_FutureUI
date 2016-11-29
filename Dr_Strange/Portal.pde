class Portal {
  PVector loc;
  float radius;
  boolean grow;
  float r;    //r for rotation
  float c;

  //Constructor
  Portal() {
    loc = new PVector(width/2, height/2);
    radius = 0;
    grow = true;
    r = 0;
    c = 30;
  }

  void render() 
  {
    if (grow) {
      radius += 1.5;
      if (radius == 450) {
        grow = false;
      }
    }
  }

  void display()
  {
    stroke(random(20, 45), 255, random(200, 255), c);
    strokeWeight(5);
    fill(0, 0, 0, c);
    c = c + 0.8;

    if (mousePressed) {
      render();
      fill(0, 0, random(5, 15));
      pushMatrix();
      translate(width/2, height/2);
      rotate(r);
      // Particles rotating around this ellipse
      ellipse(0, 0, radius+20, radius+20);
      r = r + 0.009;
      popMatrix();

      ellipse(loc.x, loc.y, radius, radius);

      if (keyPressed)
      {
        return;
      }

      fill(random(mouseX/3, 220), 50, random(240, 255));
      ellipse(loc.x, loc.y, radius+20, radius+20);
      ellipse(loc.x, loc.y, radius, radius);

      pushMatrix();
      rectMode(CENTER);
      translate(width/2, height/2);
      rotate(r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.009;
      popMatrix();

      //Notice the -r and r on both of the shapes that were called so they rotate on separate direction
      pushMatrix();
      translate(width/2, height/2);
      rectMode(CENTER);
      rotate(-r);
      rect(0, 0, radius-150, radius-150);
      r = r + 0.009;
      popMatrix();

      noFill();
      ellipse(loc.x, loc.y, radius-200, radius-200);

      pushMatrix();
      translate(width*0.5, height/2);
      rotate(r);
      star(0, 0, 123, 60, 3);
      r = r + 0.009;
      popMatrix();

      pushMatrix();
      translate(width*0.5, height/2);
      rotate(r);
      star(0, 0, -123, -60, 3);
      r = r + 0.009;
      popMatrix();
    }
  }

  //Star shapes when portal is closed
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