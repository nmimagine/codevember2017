Filler filler;
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  
  filler = new Filler(25);
  
  
  // Direct generation
  // You have to disable to animation code tho
  //filler.populate();
}
void draw(){
  background(25);
  
  filler.draw();
 
}

void mouseReleased(){
  filler.refresh();
}