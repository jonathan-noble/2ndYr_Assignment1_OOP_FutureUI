void setup()
{
  size(500,500);
}

void draw() {
  background(50);
  fill(150);
  stroke(255);
  rectMode(CENTER);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
}