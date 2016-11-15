class Star {
 // PVector v1;
  Portal port;
  float x;
  float y;
  float z;
  
  float pz;
  
  Star(Portal port) {
   // v1 = new PVector(40,20);
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
    this.port = port;
  }
  
  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    pz = z;
    }
    
  }
  
  void show() {
    
    // if (this is too far from the center)
    
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    
    
    if (this.port.diameter /2.3 < dist(0, 0, sx, sy) )
    {
      return;
    }
    else 
    {
    float r = map(z, 0, width/2, 16, 0);

    fill(255);
    noStroke();
    ellipse(sx, sy, r, r);
    
   

    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    
     pz = z;
     
    stroke(random(mouseX, 255), 255, 255);
    
    line(px, py, sx, sy);
    }
    
    
    
  }
  
}