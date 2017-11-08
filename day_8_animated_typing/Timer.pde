class Timer{
  float startT = 0;
  float nextT = 0;
  boolean paused = false;
  
  boolean endCycle = false;
  float storedMils;
  
  void interval(float mils){
    nextT = millis() + mils;
    
    endCycle = false;
    storedMils = mils;
  }
  void pause(float mils){
    startT = millis();
    nextT = startT + mils;
    paused = true;
  }
  
  void update(){
    if(paused){
      if(millis() >= nextT)
        paused = false;
    }
  }
}