class Circle {
  PVector pos = new PVector(0, 0);
  
  float size = 0;
  //float destinationSize = 0;
  
  Animation sizeAnim = new Animation();
  
  float duration = 1200;//6000
  
  boolean moving = false;
  
  color c = color(255);
  String type = "";
  float[] colorRng = {150, 250};
  String[] types = {"fill", "fill", "stroke", "stroke"};
  
  Circle(float x, float y, float destination){
    //destinationSize = destination;
    
    pos.set(x, y);
    
    sizeAnim.init(0, destination, duration, "easeOutBounce");
    
    float randomC = random(colorRng[0], colorRng[1]);
    c = color(randomC, int(random(100, 200)), int(random(200, 255)));
    type = types[int(random(0,3))];
    
    moving = true;
  }
  
  void update(){
    if(moving){
      size = sizeAnim.update(size);
      
      if(!sizeAnim.moving){
        moving = false;  
      }
    }
  } // END update
  
  void draw(){
    update();
    
    //if(type == "fill"){
      fill(c);
      noStroke();
    /*} else if (type == "stroke") {
      stroke(c);
      strokeWeight(5);
      noFill();
    }*/
    
    rectMode(CENTER);
    //stroke(25);
    //strokeWeight(5);
    
    // Change to rect for rectangle
    ellipse(pos.x, pos.y, size, size);
    
    
  }
}