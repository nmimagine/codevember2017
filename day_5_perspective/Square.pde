class Square {
  PVector pos = new PVector(0, 0);
  PVector startPos = new PVector(0, 0); // for dragging 
  PVector initPos = new PVector(0, 0);
  
  float[] initSize = {0, 0};
  float[] activeSize = {0, 0};
  float[] size = {0, 0};
  
  float animSpeed = 800;
  
  boolean active = false;
  boolean deactivating = false;
  
  float c = 255;
  
  Animation wAnim = new Animation();
  Animation hAnim = new Animation();
  Animation xAnim = new Animation();
  Animation yAnim = new Animation();
  
  float level = 0;
  
  Square(float x, float y, float initW, float initH, float activeW, float activeH, float lvl){
    initPos.set(x, y);
    pos = initPos.copy();
    
    initSize[0] = initW;
    initSize[1] = initH;
    
    activeSize[0] = activeW;
    activeSize[1] = activeH;
    
    size[0] = initSize[0];
    size[1] = initSize[1];
    
    level = lvl * 0.1;
    
    c = (11-lvl)/10*c; // Color based on level of depth
  }
  
  void activate(){
    wAnim.init(size[0], activeSize[0], animSpeed, "easeOutQuart");
    hAnim.init(size[1], activeSize[1], animSpeed, "easeOutQuart");
    active = true;
  }
  void deactivate(){
    wAnim.init(size[0], initSize[0], animSpeed, "easeOutQuart");
    hAnim.init(size[1], initSize[1], animSpeed, "easeOutQuart");
    
    xAnim.init(pos.x, initPos.x, animSpeed, "easeOutQuart");
    yAnim.init(pos.y, initPos.y, animSpeed, "easeOutQuart");
    
    deactivating = true;    
  }
  
  void update(){
    if(active){
      size[0] = wAnim.update(size[0]);
      size[1] = hAnim.update(size[1]);
      
      
      if(deactivating){
        pos.x = xAnim.update(pos.x);
        pos.y = yAnim.update(pos.y);
        if(!wAnim.moving || !hAnim.moving){     
          active = false;  
          deactivating = false;
        }
      }
    }
  }
  void draw(){
      update();
      
      stroke(c,c,c);
      strokeWeight(3);
      noFill();
      rectMode(CENTER);
      
      rect(pos.x, pos.y, size[0], size[1]);
  }
}