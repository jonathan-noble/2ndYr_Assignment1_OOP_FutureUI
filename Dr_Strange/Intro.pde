class Intro {
  //the marvel opening intro 
  PFont marvel_logo;

  Intro() {
    marvel_logo = createFont("marvel_logo.otf", 100);
  }

  void display() {
    
    background(350, 92, 68);
    textFont(marvel_logo);
    text("MARVEL", width/3, height/2);
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(width/3.1, height/3, 490, 230);
  }
  
}