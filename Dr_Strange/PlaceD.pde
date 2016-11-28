class Buddha extends StatueOfLiberty {
  PImage buddha;
  PImage avengers;
  Portal port;

  Buddha(Portal port, float _X, float _Y ) {
    super(port, _X, _Y);
    buddha = loadImage("buddha.png");
    avengers = loadImage("avengers.png");
  }


  void display() {

    image(buddha, x, y, 200, 200);
  }
}