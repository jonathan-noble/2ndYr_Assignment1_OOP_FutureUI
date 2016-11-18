//**
class backGround {
  // PVector v1;
  float x;
  float y;
  float z;

  float pz;

  backGround() {
    // v1 = new PVector(40,20);
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void display()
  {

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);


    float r = map(z, 0, width/2, 16, 0);
    fill(255);
    noStroke();
    ellipse(sx, sy, r, r);



    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(random(mouseX, 255), 255, 255);

    line(px, py, sx, sy);
  
  }
}