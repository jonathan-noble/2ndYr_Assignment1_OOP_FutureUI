//Solar System //**
class SolarSystem {
  SolarSystem[] planets;
  float radius;
  float distance;
  float angle;
  float orbitspeed;

  SolarSystem(float r, float d, float o) {
    radius = r;
    distance = d; 
    angle = TWO_PI;
    orbitspeed = o;
  }

  void orbit() {
    angle += orbitspeed;
    if (planets != null) {
      for (int i = 0; i<planets.length; i++)
      {
        planets[i].orbit();
      }
    }
  }
  
 void spawnMoons(int total, int level) {
    planets = new SolarSystem[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random(50, 150);
      float o = random(-0.1, 0.1);
      //**
      planets[i] = new SolarSystem(r, d/level, o);
      if (level < 3) {
        int num = 3;
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
    

  void display() {
    pushMatrix();
    fill(255, 100);
    rotate(angle);
    translate(distance, 0);
    ellipse(0, 0, radius*2, radius*2);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].display();
      }
    }
    popMatrix();
  }
}