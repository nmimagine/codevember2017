class SquareBeat {
  Square square1 = new Square(-300, -80, -40, true);
  Square square2 = new Square(220, 0, -40, false);
  
  float shakeAmount = 17;
  float[][] shakePattern = new float[12][2];
  
  float rotateSpeed = 0.01;
  float rotation = 0;
  
  ArrayList<Echo> echoes = new ArrayList<Echo>();
  
  boolean shake = true;
  int currentPattern = 0;
  SquareBeat(){
    shakePattern[0][0] = 0;
    shakePattern[0][1] = -shakeAmount;
    
    shakePattern[1][0] = shakeAmount;
    shakePattern[1][1] = -shakeAmount;
    
    shakePattern[2][0] = shakeAmount;
    shakePattern[2][1] = 0;
    
    shakePattern[3][0] = 0;
    shakePattern[3][1] = shakeAmount;
    
    shakePattern[4][0] = -shakeAmount;
    shakePattern[4][1] = 0;
    
    shakePattern[5][0] = shakeAmount;
    shakePattern[5][1] = -shakeAmount;
    
    shakePattern[6][0] = -shakeAmount;
    shakePattern[6][1] = shakeAmount;
    
    shakePattern[7][0] = shakeAmount;
    shakePattern[7][1] = -shakeAmount;
    
    shakePattern[8][0] = -shakeAmount;
    shakePattern[8][1] = shakeAmount;
    
    shakePattern[9][0] = shakeAmount;
    shakePattern[9][1] = -shakeAmount;
    
    shakePattern[10][0] = -shakeAmount;
    shakePattern[10][1] = 0;
    
    shakePattern[11][0] = 0;
    shakePattern[11][1] = 0;
  }
  void cleanEchoes(){
    int removed = 0;
    
    ArrayList<Integer> deadIDs = new ArrayList<Integer>();
    
    for(int i = 0; i < echoes.size(); i++){
      Echo e = echoes.get(i);
      
      if(e.dead){
        deadIDs.add(i); 
      }
    }
    
    for(int j = 0; j < deadIDs.size(); j++){
      echoes.remove(deadIDs.get(j)-removed);
      removed++;
    }
    
  }  
  void onCollide(){
    shake = true;
    echoes.add(new Echo());
  }
  
  void update(){
    rotation += rotateSpeed;
    
    if(rotation == 1)
      rotation = 0;
      
     if(shake){
       currentPattern+=1;
       if(currentPattern == shakePattern.length){
         shake = false;
         currentPattern = 0;
       }
     }
  }
  
  void draw(){
    update();
    
    pushMatrix();
      if(shake)
        translate(width/2+shakePattern[currentPattern][0], height/2+shakePattern[currentPattern][1]);
      else
        translate(width/2, height/2);
        
        
      rotate(rotation);
      
      
      for(Echo echo : echoes){
        echo.draw();  
      }
      square1.draw(this);
      square2.draw(this);
      
      
    popMatrix();
    
    cleanEchoes();
  }
  
  
}