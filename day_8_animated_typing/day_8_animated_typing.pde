ArrayList<Type> types = new ArrayList<Type>();
float typeGap = 0;
PFont opensansbold;

boolean newLine = true;
boolean entered = false;
float maxCharPerLine = 28;
float yGap = 90;
int lastAlpha = 0;

int fontSize = 56;
void setup(){
  size(1000, 1000, P2D);  
 
  
  opensansbold = createFont("data/fonts/OpenSans-Bold.ttf", fontSize);
}
void draw(){
  background(255);
  
  for(Type t : types){
    t.draw();  
  }
  
  //test.draw();
  
  //saveFrame("frames/####.tga");
}

float getAccumulatedWidth(){
  textSize(fontSize);
  float accumulatedWidth = 0;
  for(int i = lastAlpha; i < types.size(); i++){
    Type t = types.get(i);
    accumulatedWidth += textWidth(t.text)+typeGap;  
  }  
  accumulatedWidth -= typeGap;
  return accumulatedWidth;
}

void keyReleased(){
  
  
  float theY = 300;
  if(keyCode == ENTER){
    newLine = true;
    
    
    for(Type t : types){
      t.moveY(t.pos.y + yGap); 
      
      if(!t.paled)
            t.makePale();
    }
  } else if(keyCode == 147){
 
    types.clear();
    newLine = true;
    lastAlpha = 0;
  }else if(keyCode == BACKSPACE){
    if(!newLine){
      if(types.size() > 0){
        if(types.size()-1 == lastAlpha){
          types.remove(types.size()-1);  
          newLine = true;
        }else{
          types.remove(types.size()-1);  
          float accumulatedWidth = getAccumulatedWidth();
          float startX = (width/2) - (accumulatedWidth/2);
          
          float currentX = startX;
          for(int i = lastAlpha; i < types.size(); i++){
            Type t = types.get(i);
            t.moveX(currentX);
            
            currentX += textWidth(t.text) + typeGap;
          }
        } // END else type.size() == lastAlpha      
        
      }// END if types.size() > 0
    }// END if !newLine
  } else {
    // Prevent other keys to intervere (like shift, cmd, etc)
    if(matchAll(str(key), "[a-zA-Z0-9!@#$%^&*()_+-={};\'\"\\,.<>? ]") != null){
      if(newLine){
        newLine = false;
        types.add(new Type(key, width/2, theY, fontSize));
        lastAlpha = types.size()-1;

      }else{
        float accumulatedWidth = getAccumulatedWidth();
        types.add(new Type(key, types.get(lastAlpha).pos.x+accumulatedWidth+typeGap, theY, fontSize));
        
        accumulatedWidth = getAccumulatedWidth();
        float startX = (width/2) - (accumulatedWidth/2);
        
        float currentX = startX;
        for(int i = lastAlpha; i < types.size(); i++){
          Type t = types.get(i);
          t.moveX(currentX);
          
          currentX += textWidth(t.text) + typeGap;
        }
        
        // if reached max characters, create a new line
        int countFromAlpha = 0;
        for(int i = lastAlpha; i < types.size(); i++){
          countFromAlpha++;
        }
                
        if(countFromAlpha % maxCharPerLine == 0){
          for(Type t : types){
            t.moveY(t.pos.y + yGap);  
            
            if(!t.paled)
              t.makePale();
            newLine = true;
          }
        }
      }// END else newLline
    }
  }// END else keyCode
}