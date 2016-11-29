class Buddha extends StatueOfLiberty {
  PImage buddha;
  PImage hk;

  Buddha(Portal port, float _X, float _Y ) {
    super(port, _X, _Y);
    buddha = loadImage("buddha.png");
    hk = loadImage("hk.png");
  }


  void display() {
    if (this.port.radius != 450)
    {
      return;
    }

    image(buddha, x, y, 300, 300);
    image(hk, x + 25, y + 70, 250, 250);
  }
}