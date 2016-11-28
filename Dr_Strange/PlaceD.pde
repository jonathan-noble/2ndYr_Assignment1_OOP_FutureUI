class Buddha extends StatueOfLiberty {
  PImage buddha;
  PImage avengers;

  Buddha(Portal port, float _X, float _Y ) {
    super(port, _X, _Y);
    buddha = loadImage("buddha.png");
    avengers = loadImage("hk.png");
  }


  void display() {
    if (this.port.radius != 450)
    {
      return;
    }

    image(buddha, x, y, 300, 300);
    image(avengers, x + 25, y + 70, 250, 250);
  }
}