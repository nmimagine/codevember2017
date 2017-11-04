class Echo {
  float maxSize = 1450;
  float minSize = 1;
  float size = 1;
  
  boolean dying = false;
  boolean dead = false;
  float op = 255;
  
  Animation anim = new Animation();
  Animation fader = new Animation();
  
  float duration = 4000;
  
  Echo(){
   anim.init(minSize, maxSize, duration, "easeOutQuad");
  }
  
  void draw(){
    if(!dying){
      size = anim.update(size);
      if(!anim.moving){
        dead = true;
        fader.init(255, 0, duration, "easeOutQuad");
      }
    }
    
    
    
    stroke(44, 255, 247, op);
    strokeWeight(14);
    noFill();
    ellipse(0, 0, size, size);
  }
}