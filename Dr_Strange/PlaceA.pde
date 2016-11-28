//Solar System //**
class SolarSystem {
  ArrayList <SolarSystem> planets = new ArrayList<SolarSystem>();
  float radius;
  float distance;
  float angle;
  float orbitspeed;
  PImage img;

  SolarSystem(float r, float d, float o, String imgPath) {
    radius = r;
    distance = d; 
    angle = TWO_PI;
    orbitspeed = o;
    img = loadImage(imgPath);
  }

  void add(SolarSystem b) {
    planets.add(b);
  }

  void update(float delta) {
    angle += (orbitspeed * delta);


    for (int i = 0; i < planets.size(); i++) {
      planets.get(i).update(delta);
    }
  }

  void display() {
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