class Rotator{
  float rotation = 0;
  float rotationStep = 0;
  int rotationTotal = 0;
  
  PVector pos = new PVector(0, 0);
  PVector centerPos = new PVector(0, 0);
  PVector startPos = new PVector(0, 0);
  
  float animSpeed = 500;
  String ease = "easeOutQuart";
  Animation rotateAnim = new Animation();
  Timer time = new Timer();
  
  PImage image;
  
  float size = 0;  
  int level = 0;
  
  int interval;
  
  String direction = "";
  
  
  Rotator(PImage img, float siz, int lvl, int intrvl, int rTotal, boolean directStart, String dir){
    image = img;
    size = siz;
    level = lvl;
    
    intrvl = intrvl * 2;
    animSpeed = animSpeed * 2;
    
    interval = intrvl * level;
    rotationTotal = rTotal;
    
    direction = dir;
    
    rotationStep = TWO_PI / rotationTotal;
    
    pos.x = -size/2;
    pos.y = -size/2;
    
    centerPos.x = -size/2;
    centerPos.y = -size/2;
    if(directStart)
      rotateAnim.init(0, rotationStep, animSpeed, ease);
    else
      time.pause(intrvl);
  }
  
  void update(){
    boolean paused = time.paused;
    time.update();
    boolean pausedNow = time.paused;
    if(paused){
      if(!pausedNow){
       // if(rotation >= TWO_PI)
          //rotateAnim.init(0, rotationStep, animSpeed, ease);
        //else
          rotateAnim.init(rotation, rotation+rotationStep, animSpeed, ease);
      }
 
    }
    
    if(!time.paused){      
      
      rotation = rotateAnim.update(rotation);
      
      if(!rotateAnim.moving)
        time.pause(interval);
    }
    
  }
  
  void draw(){
    update();
    pushMatrix();
      if(direction == "left")
        rotate(-rotation);
      else if(direction == "right")
        rotate(rotation);
      image(image, pos.x, pos.y, size, size);
    popMatrix();
  }
}