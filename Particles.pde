class Particles {
  float X, Y;
  float angle;
  float p_speed;  //speed of the particle
  float p_size;  //size of the particle
  float p_thick;  //thickness of the particles
  float H, S, B;


  Particles() {
    X = width/4;
    Y = height/5;
    angle = random(250);
    p_speed = random(0.1, 0.2);
    p_size = random(10);
    p_thick = random(0.1, 1.5);
    H = random(20, 40);
    S  = 255;
    B = random(155, 255);
  }

  void update() {
   // angle = angle - speed;      
    p_size += p_thick;
    //If p_size gets bigger, then p_thick resets back to 0
    if (p_size > 15 || p_size <0) {
      p_thick = 0;
    }
  }


  void display() {
    if(mousePressed)  {
    fill(H, S, B);
    rotate(radians(angle));
    ellipse(X, Y, p_size, p_size);
    }
  }

  void fadeToWhite() {
    fill(255, 5);
    noStroke();
    rect(0, 0, width, height);
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