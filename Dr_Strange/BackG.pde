class BackGround {
  //Portal is being called along the other classes so when portal is called, it is not interfered
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
    //the star is being decremented to move out of the screen
    z = z - speed;
    //once z is out of the screen, the star goes back to the centre of the screen
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
    
    // the position of the star is made sure it's coming from the centre of the screen
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
  PImage car;
  PImage thor;
  
  
  //super gets the value from the parent class
  BG_Objects(Portal port, float _x, float _y, float _z) {
    super(port, _x, _y, _z);
    bunny = loadImage("bunny.png");
    clock = loadImage("grandclock.png");
    car = loadImage("dmc.png");
    thor = loadImage("thor.png");
  }

  void update()
  {
    //parent function is being called
    super.update();
  }


  void display() { 
    super.display();
    speed = map(mouseX, 0, width, 0, 10);
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    pz = z;

    pushMatrix();
    translate(width/2, height/2);


    //The images are intentionally constant at changing the size and position since these objects tend to be visually "warped"
    image(bunny, sy - 200, sx - 100, px/4, py/2 );
    image(clock, sx/3, sy/6, px/3, py/2); 
    image(car, sx/10, sy - 200, px/3, py/2); 
    image(thor, sy - 100, sx - 150, px/2, py/1.5 );
    popMatrix();
  }
} // end class BG_Objects