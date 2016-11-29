class StatueOfLiberty {
  PImage statue;
  Portal port;
  float x, y;

  StatueOfLiberty(Portal port, float _X, float _Y) {
    statue = loadImage("statue.png");
    this.port = port;
    x = _X;
    y = _Y;
  }

  void display() {
   // This ensures that if radius is not on the max range yet, then the place will not be executed
    if (this.port.radius != 450)
    {
      return;
    }

    image(statue, x, y, 110, 300);
  }
}
//}