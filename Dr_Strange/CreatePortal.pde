class createPortal 
{
  //It serves like a wizard's powerful wand to create a portal
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

    stroke(random(35, 45), 255, 255);
    strokeWeight(random(7, 10) );
    fill(25, 240, 255);

    if (mousePressed)
    {
      mouseMoved(count);
      //Modulo is used to multiply the incremented index position to the length of the array x
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
    // Cycle between 0 and the number of elements
    x[iPos] = mouseX;
    y[iPos] = mouseY;
    count = c;
  }
}