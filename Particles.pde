class Particles {
  float x, y, z;
  float pz;
  float angle;
  float p_speed;  //speed of the particle
  float p_size;  //size of the particle
  float p_thick;  //thickness of the particles

  Particles() {
    x = width/4;
    y = height/5;
    z = width/2;
    pz = z;
    angle = random(250);
    p_speed = random(0.1, 0.2);
    p_size = random(10);
    p_thick = random(0.1, 1.5);
  }

  void update() {
    angle += angle - p_speed; 
    z = angle;
    p_size += p_thick;
    //If p_size gets bigger, then p_thick resets back to 0
    if (p_size > 30 || p_size <0) {
      p_thick = -p_thick;
      pz = z;
    }
  }


  void display() {
    angle = map(mouseX, 0, width, 0, 20);
    rotate(radians(angle));
    float sx = map(x / z, 0, 1, 0, p_size);
    float sy = map(y / z, 0, 1, 0, p_size);
    ellipse(x, y, p_size, p_size);


    float px = map(x / pz, 0, 1, 0, p_size);
    float py = map(y / pz, 0, 1, 0, p_size);
    pz = z;
  //  line(px, py, sx, sy);

    //line on PVector that sparks out on each of the particles
  }
}


class Ecolor {
  float R, G, B;
  Ecolor(float nR, float nG, float nB) {
    R=nR;
    G=nG;
    B=nB;
  }

  void display() {
    fill(R, G, B);
  }
}