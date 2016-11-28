class EiffelTower extends StatueOfLiberty {
  PImage ET;
  Portal port;

  EiffelTower(Portal port, float _X, float _Y ) {
    super(port, _X, _Y);
    ET = loadImage("eiffel.png");
  }


  void display() {

    image(ET, x, y, 200, 300);
  }
}