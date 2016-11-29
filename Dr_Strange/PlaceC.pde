class EiffelTower extends StatueOfLiberty {
  PImage ET;

  //Inheritance is called among the places C and D since they have the same setup
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