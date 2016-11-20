//**
class backGround {
  Portal port;
  // PVector v1;
  float x;
  float y;
  float z;
  float pz;

  backGround(Portal port) {
    // v1 = new PVector(40,20);
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
    this.port = port;
  }

  void update() {
    z -= speed;
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


    if (mousePressed)
    {
      // if (this is too far from the center)
      if (this.port.radius / 2.3 > dist(0, 0, x, y) )
      {

        return;
      }

      {


        float r = map(z, 0, width/2, 16, 0);
        fill(255);
        noStroke();
        ellipse(sx, sy, r, r);



        float px = map(x / pz, 0, 1, 0, width/2);
        float py = map(y / pz, 0, 1, 0, height/2);

        pz = z;

        stroke(random(mouseX/6, 250), 200, 200);

        line(px, py, sx, sy);
      }
    }
  }
}