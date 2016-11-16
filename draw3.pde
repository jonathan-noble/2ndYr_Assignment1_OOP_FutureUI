int num = 70;
int[] x = new int[num];
int[] y = new int[num];
int iPos = 0;
int count = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  background(0);
  stroke( random(mouseX, 50), 100, 200);
   strokeWeight(random(5,7) );
  fill(25, 240, 255);
  // Cycle between 0 and the number of elements
  if (mousePressed)
  {
        mouseMoved(count);
      
      iPos = (iPos + 1) % num;
      for (int i = 0; i < num; i++) {
        // Set the array position to read
        int pos = (iPos + i) % num;
        float radius = (num-i) / 3;
        ellipse(x[pos], y[pos], radius, radius);
      }
 //  if (mouseMoved)
  }

    
  
  
}

void mouseMoved(int c) {
  c = 
 x[iPos] = mouseX;
  y[iPos] = mouseY;
   count += c;
  
}



  
  
  