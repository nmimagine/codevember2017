class Type {
  char text;
  
  PVector pos = new PVector(0, 0);
  float rotation = 0;
  float fontSize = 0;
  
  float targetFontSize = 0;
  float targetRotation = 0;
  
  float animDuration = 500;
  
  Animation xAnim = new Animation();
  Animation yAnim = new Animation();
  Animation rotationAnim = new Animation();
  Animation sizeAnim = new Animation();
  Animation colorAnim = new Animation();
  
  float c = 25;
  float pale = 200;
  boolean paled = false;
  
  Type(char txt, float x, float y, float fs){
    pos.set(x, y);
    text = txt;
    
    targetFontSize = fs;
    
    //animDuration = animDuration * 6;
    
    rotationAnim.init(HALF_PI, targetRotation, animDuration, "easeOutExceed");
    sizeAnim.init(0, targetFontSize, animDuration, "easeOutQuart");
    
    
  }
  
  void update(){
    pos.x = xAnim.update(pos.x);
    pos.y = yAnim.update(pos.y);
    rotation = rotationAnim.update(rotation);
    fontSize = sizeAnim.update(fontSize);    
    c = colorAnim.update(c);
  }
  
  void draw(){
    update();
    
    textFont(opensansbold);
    textSize(fontSize);
    
    fill(c);
    noStroke();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(rotation);
      
      text(text, 0, 0);
    popMatrix();
  }
  
  void reset(){
    rotationAnim.init(PI, targetRotation, animDuration, "easeOutExceed");
    sizeAnim.init(0, targetFontSize, animDuration, "easeOutQuart");
  }
  
  void moveX(float x){
    xAnim.init(pos.x, x, animDuration, "easeOutQuart");
  }
  void moveY(float y){
    yAnim.init(pos.y, y, animDuration, "easeOutQuart");  
  }
  void makePale(){
    paled = true;
    colorAnim.init(c, pale, animDuration, "easeOutQuart");
  }
  void notPale(){
    paled = true;
    colorAnim.init(c, 25, animDuration, "easeOutQuart");
  }
}