class Filler {
  Grid grids;
  
  float tilesize;
  
  float maxSize = 10;
  
  ArrayList<Circle> circles = new ArrayList<Circle>();
  ArrayList<ArrayList<PVector>> queue = new ArrayList<ArrayList<PVector>>();
  
  float totalGrid;
  boolean can = true;
  
  Timer time = new Timer();
  
  Filler(float _tilesize){
      tilesize = _tilesize;
      
      grids = new Grid(tilesize);
      
      totalGrid = grids.xCount * grids.yCount;
  }
  
  
  
  void refresh(){
    grids.populate();
    circles.clear();
    
    
    totalGrid = grids.xCount * grids.yCount;
    can = true;
    
    // Uncomment for direct generation
    //populate();
  }
  
  ArrayList<PVector> getAvailableTiles(){
    ArrayList<PVector> available = new ArrayList<PVector>();
    for(int y = 0; y < grids.yCount; y++){
      for(int x = 0; x < grids.xCount; x++){
        if(!grids.tiles.get(y).get(x).occupied){
          available.add(new PVector(x, y));
        }
      }
    }
    
    return available;
  }
  
  //Adapted from https://love2d.org/wiki/BoundingBox.lua
  boolean collided(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    return x1 < x2+w2 && x2 < x1+w1 && y1 < y2+h2 && y2 < y1+h1;
  }
  
  boolean checkedMyPlace(float x, float y, float size){
    boolean yes = true;
    x -= size/2;
    y -= size/2;
    for(Circle circle : circles){
      float cx = circle.pos.x - circle.size/2;
      float cy = circle.pos.y - circle.size/2;
      
      if(collided(cx, cy, circle.size, circle.size, x, y, size, size)){
        yes = false;
        //print("YEA!\n");
        break;
      }
    }
    
    return yes;
  }
  void fillStep(){
    // 1.1. Pick random point
    ArrayList<PVector> availables = getAvailableTiles();
    
    PVector randomCoord = availables.get(int(random(0, availables.size()-1)));
    float randX = randomCoord.x;
    float randY = randomCoord.y;
  
      
    // 1.2. Pick random size
    float randSize = random(1, maxSize);
    
    float approvedSize = 1;
    
    // 2. Survey the area
    // (could minus the i value by 1 instead of keep using -1 but it's easier for me to think this way lol)
    for(int i = 2; i <= randSize; i++){
    
      boolean pass = true;
      float vLength = i;
      float hLength = (1 + (2 * (i-1))) - vLength;
      
      float startX = randX + (i-1);
      float startY = randY + (i-1);
      
      for(int j = 0; j <= vLength - 1; j++){
        if(!isAvailable(startX, randY + j)){
          pass = false;
          break;
        }
      }// END for vLength
      
      for(int k = 0; k <= hLength - 1; k++){
        if(!isAvailable(randX + k, startY)){
          pass = false;
          break;
        }
      }
      
      if(pass){
        approvedSize = i;  
      }
      
           
    } // END for i <= randSize;
    
    // 3. Occupy place
    float circleSize = approvedSize * tilesize;
    PVector position = grids.tiles.get(int(randY)).get(int(randX)).pos.copy();
    position.x += circleSize/2;
    position.y += circleSize/2;
    
    if(checkedMyPlace(position.x, position.y, circleSize)){
      circles.add(new Circle(position.x, position.y, circleSize));
      
      for(int j = 0; j < approvedSize; j++){
        for (int k = 0; k < approvedSize; k++){
          grids.tiles.get(int(randY+j)).get(int(randX+k)).occupied = true;  
        }
      }
      totalGrid -= approvedSize;
      
      ArrayList<PVector> nowAvailables = getAvailableTiles();
      if(nowAvailables.size() == 0)
        can = false;
    }
    
  }
  
  void populate(){
      while(can){
        fillStep();
      }// END while
      
      //print("\nfinished");
  }
  
  boolean isAvailable(float x, float y){
    if(x >= grids.xCount || y >= grids.yCount){
      return false;
    }
    return !grids.tiles.get(int(y)).get(int(x)).occupied;
  }
  
  void draw(){
    time.update();
    
    // Comment this block to disable animation
    if(!time.paused){
      if(can){
        fillStep();
        time.pause(25);
      }
    }
    
    
    for(Circle circle : circles){
      circle.draw();  
    }
  }
}