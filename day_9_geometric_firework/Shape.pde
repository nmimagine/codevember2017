class Shape {
  String type = "";
  
  PVector pos = new PVector(0, 0);
  float size = 0;
  float rotation;
  
  PVector parentPos = new PVector(0, 0);
  
  float targetX;
  float targetSize;
  float targetRotation;
  
  String mode = "";
  
  float duration = 300;
  float backDuration = 1100;
  
  color c;
  
  Animation xAnim = new Animation();
  Animation yAnim = new Animation();
  Animation sizeAnim = new Animation();
  Animation rotationAnim = new Animation();
  
  boolean activated = false;
  boolean rotated = false;
  boolean dying = false;
  boolean pausing = false;
  boolean dead = false;
  
  Timer time = new Timer();
  int pauseTime = 100;
  
  Shape(String _type, String _mode, PVector _parentPos, float _rotation, float x, float _size, color _c){
    type = _type;
    
    rotation = _rotation;
    targetRotation = rotation + (TWO_PI * 0.16);
    parentPos = _parentPos;
    targetX = x;    
    targetSize = _size;
    mode = _mode;
    c = _c;
    
    // Start position
    pos.x = 0;
    pos.y = -_size/2;
  }
  
  void update(){
    time.update();
    if(!time.paused){
      if(activated){
        pos.x = xAnim.update(pos.x);  
        pos.y = yAnim.update(pos.y);
      
        size = sizeAnim.update(size);
        rotation = rotationAnim.update(rotation);  
        
        
        if(!xAnim.moving){
          if(pausing){
            pausing = false;  
            dying = true;
            rotationAnim.init(rotation, targetRotation, backDuration, "easeOutQuad");
            sizeAnim.init(size, 0, backDuration, "easeOutQuad");
          }
          if(!dying){
            //rotationAnim.init(rotation, targetRotation, backDuration, "easeOutQuad");
            //sizeAnim.init(size, 0, backDuration, "easeOutQuad");
            pausing = true;
            
            time.pause(pauseTime);
            
            
          } else {
            if(!rotationAnim.moving){
              dead = true;  
            }  
          }// END else !dying
        }// END if !xAnim.moving
      }// END if activated
    }
  }
  void draw(){
      update();
      if(mode.equals("stroke")){
        stroke(c);
        strokeWeight(3);
        noFill();
      } else if(mode.equals("fill")){
        fill(c);
        noStroke();
      }
      
      pushMatrix();
        translate(parentPos.x, parentPos.y);
        rotate(rotation);
        
        ellipseMode(CORNER);
        
        if(type == "square")
          rect(pos.x, pos.y, size, size);
        else if(type == "circle")
          ellipse(pos.x, pos.y, size, size);
        else if(type == "hexagon")
          polygon(pos.x, pos.y, size, 6);
        else if(type == "triangle")
          polygon(pos.x, pos.y, size, 3);
      popMatrix();
  }
  
  void activate(){
    xAnim.init(pos.x, targetX, duration, "easeOutQuad");
    sizeAnim.init(size, targetSize, duration, "easeOutQuad");    
    
    activated = true;
  }
  
  // https://processing.org/examples/regularpolygon.html
  // I'm that bad at math
  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}