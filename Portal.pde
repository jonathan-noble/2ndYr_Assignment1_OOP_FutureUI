
Lines[] portal = new Lines[100];
void setup()
{
  size(500,500);
  
    for (int i = 0; i < stars.length; i++) {
    portal[i] = new Lines();
}

void draw()
{
  background(0);
  translate(width/2, height/2);
   for (int i = 0; i < stars.length; i++) {
    //portal[i].update();
    portal[i].show();
   }
}