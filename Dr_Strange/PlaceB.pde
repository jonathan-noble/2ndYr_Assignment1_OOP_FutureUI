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
    if (this.port.radius /2 < dist(0, 0, x, y)) 
    {
      return;
    }      
    image(statue, x, y, 110, 300);
    
   
  }
}