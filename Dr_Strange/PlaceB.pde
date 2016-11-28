class StatueOfLiberty {
  PImage statue;
  Portal port;
  float x, y;
  PVector loc;
  PVector vel;
  float radius; 

  StatueOfLiberty(Portal port, float _X, float _Y) {
    statue = loadImage("statue.png");
    this.port = port;
    x = _X;
    y = _Y;
    loc = new PVector(600, 450);
    vel = new PVector(1, 2);
  }


  void display() {
   if (this.port.radius != 450)
    {
      return;
    }
    
   image(statue, x, y, 110, 300);
   
    //Draw clouds
    stroke(0);
    fill(255);
    ellipse(loc.x, loc.y, 100, 100);
    loc.add(vel);

    if (loc.x > this.port.radius && loc.y > this.port.radius)
    {
      vel.x = 600;
      vel.y = 450;
    }
  }
}