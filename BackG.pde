class BackGround {
  // PVector v1;
  Portal port;
  float x;
  float y;
  float z;
  float speed;
  float pz;

  BackGround(Portal port, float _x, float _y) {
    x = _x;
    y = _y;
    z = random(width/2);
    pz = z;
    speed = 0;
    this.port = port;
  }

  // z = _z;
  // speed = _speed;
  // pz = _pz;


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
  }
}

//TRY CALLING SX AND SY INSTEAD OF X AND Y
class Bunny extends BackGround {
  PImage bunny;

  Bunny(Portal port, float _x, float _y) {
    super(port, _x, _y);
    bunny = loadImage("bunny2.png");
  }



  void display() {
   // image(bunny, x, y);
  }
}