class SolarSystem {
  // Self explanatory place
  ArrayList <SolarSystem> planets = new ArrayList<SolarSystem>();
  Portal port;
  float radius;
  float distance;
  float angle;
  float orbitspeed;
  PImage img;

  SolarSystem(Portal port, float r, float d, float o, String imgPath) {
    this.port = port;
    radius = r;
    distance = d; 
    angle = TWO_PI;
    orbitspeed = o;
    //String is used since we are calling multiple images from the parameter
    img = loadImage(imgPath);
  }

  //This function adds the planets to the main page
  void add(SolarSystem b) {
    planets.add(b);
  }

  //The parameter delta is passed down to ensure the times of revolution is relative to time itself
  void update(float delta) {
    angle += (orbitspeed * delta);
    //The value of delta is then passed down to every planets
    for (int i = 0; i < planets.size(); i++) {
      planets.get(i).update(delta);
    }
  }

  void display() {

    if (this.port.radius != 450)
    {
      return;
    }
    pushMatrix();
    rotate(angle);
    translate(-60, -70);

    image(img, 0, 0);

    for (int i = 0; i < planets.size(); i++) {
      planets.get(i).display();
    }

    popMatrix();
  }
}