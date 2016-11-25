class createPortal 
{
  int[] x;
  int[] y;
  int iPos;
  int count;

  createPortal()
  {
    x = new int[50];
    y = new int[50];
    iPos = 0;
    count = 0;
  }


  void display()
  {

    stroke(random(45), 255, 255);
    strokeWeight(random(5, 7) );
    fill(25, 240, 255);
    // Cycle between 0 and the number of elements
    if (mousePressed)
    {
      mouseMoved(count);
      //**
      iPos = (iPos + 1) % x.length;
      for (int i = 0; i < x.length; i++) {
        // Set the array position to read
        int pos = (iPos + i) % x.length;
        float radius = (y.length-i) / 3;
        ellipse(x[pos], y[pos], radius, radius);
      }
    }
  }

  void mouseMoved(int c) {
    x[iPos] = mouseX;
    y[iPos] = mouseY;
    count = c;
  }

  //xx
  void mouseReleased()
  {
    clear();
  }
}
