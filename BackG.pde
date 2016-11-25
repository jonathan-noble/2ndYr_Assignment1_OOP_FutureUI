class BackGround {
  // Try using PVectors
  Portal port;
  float x, y, z;
  float pz;
  float speed;

  BackGround(Portal port, float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    pz = z;
    speed = 0;
    this.port = port;
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

    speed = map(mouseX, 0, width, 0, 20);

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);


    if (mousePressed == true)
    {
      // if the port is executed then the background will not execute under the portal's radius 
      if (this.port.radius /2 > dist(0, 0, sx, sy) )
      {
        return;
      }
    }
    pushMatrix();
    translate(width/2, height/2); 
    float r = map(z, 0, width/2, 16, 0);
    fill(random(mouseX/6, 255), 255, 255);
    noStroke();
    ellipse(sx, sy, r, r);


    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    if (this.port.radius /2 < dist(0, 0, px, py) )
    {
      pz = z;

      stroke(random(mouseX/6, 255), 255, 255);
      line(px, py, sx, sy);
    }
    popMatrix();
  }
} // end class BackGround

class BG_Objects extends BackGround {
  PImage bunny;
  PImage clock;

  BG_Objects(Portal port, float _x, float _y, float _z) {
    super(port, _x, _y, _z);
    bunny = loadImage("bunny2.png");
    clock = loadImage("grandclock.png");
  }

  void update()
  {
    super.update();
  }


  void display() { 
    super.display();
    speed = map(mouseX, 0, width, 0, 10);
    pushMatrix();
    translate(width/2, height/2);
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);

    image(bunny, sx, sy, random(55, 70), random(55, 70) );
    image(clock, sx/3, sy/4, (pmouseX/4), (pmouseY/3) );
    popMatrix();
  }
} // end class BG_Objects