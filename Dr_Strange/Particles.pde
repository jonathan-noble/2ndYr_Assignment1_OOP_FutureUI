class Particles {
  float x, y;
  float angle;
  float p_speed;  //speed of the particle
  float p_size;  //size of the particle
  float p_thick;  //thickness of the particles

  Particles() {
    x = width/4;
    y = height/5;
    angle = random(250);
    p_speed = random(0.1, 0.2);
    p_size = random(20);
    p_thick = random(0.1, 1.5);
  }

  void update() {
    angle += p_speed; 
    p_size += p_thick;
    //If p_size gets bigger, then p_thick resets back to 0 == animation of the particles
    if (p_size > 15 || p_size < 0) {
      p_thick = -p_thick;
    }
  }


  void display() {
    rotate(radians(angle));
    ellipse(x, y, p_size, p_size);
  }
}