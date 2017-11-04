class Timer{
  float startT = 0;
  float nextT = 0;
  boolean paused = false;
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