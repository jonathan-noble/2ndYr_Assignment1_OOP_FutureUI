class EiffelTower extends StatueOfLiberty {
  PImage ET;

  EiffelTower(Portal port, float _X, float _Y ) {
    super(port, _X, _Y);
    ET = loadImage("eiffel.png");
  }


  void display() {
    if (this.port.radius != 450)
    {
      return;
    }

    image(ET, x, y, 200, 300);
  }
}