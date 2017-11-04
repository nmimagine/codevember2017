class Square {
  PVector pos = new PVector(0,0);
  float p1 = 0;
  float p2 = 0;
  
  float size = 80;
  
  color col = color(255, 57, 204);
  
  String startDirection = "";
  
  Timer time = new Timer();
  float pauseDuration = 600;
  
  Animation anim = new Animation();
  
  float inSpeed = 80;
  float outSpeed = 16;
  
  boolean dive = true;
  boolean track = false;
  Square(float _p1, float _p2, float y, boolean tracker){
     p1 = _p1;
     p2 = _p2;
     
     track = tracker;
     
     if(p1 < p2)
       startDirection = "right";
     else
       startDirection = "left";
     
     pos.set(p1, y);
  }
  

  
  void update(SquareBeat sb){
    time.update();
    if(!time.paused){
      if(dive){
        if(startDirection == "right"){
            pos.x += inSpeed;
            
            if(pos.x >= p2){
              dive = false;
              time.pause(pauseDuration);
              
              if(track){
                sb.onCollide();
              }// END if track
            }
        } else {
          pos.x -= inSpeed;
            
          if(pos.x <= p2){
            dive = false;
            time.pause(pauseDuration);
            
            if(track){
              sb.onCollide();
            }// END if track
          }
        } // END else startDirection
      } else {
        if(startDirection == "right"){
            pos.x -= outSpeed;
            
            if(pos.x <= p1)
              dive = true;
        } else {
          pos.x += outSpeed;
            
          if(pos.x >= p1)
            dive = true;
        } // END else startDirection
      }// END else dive
    }// END if !time.paused
  }
  
  void draw(SquareBeat sb){
     update(sb); 
     
     fill(col);
     noStroke();
     
         rect(pos.x, pos.y, size, size);
  }
}