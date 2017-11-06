class Grid {
  ArrayList<ArrayList<Tile>> tiles = new ArrayList<ArrayList<Tile>>();
  
  float xCount = 0;
  float yCount = 0;
  
  float tilesize = 0;
  
  Grid(float _tilesize){
    tilesize = _tilesize;
    
    xCount = floor(width/tilesize);
    yCount = floor(height/tilesize);
    
    populate();
  }
  
  void populate(){
    tiles.clear();
    
    for(int y = 0; y < yCount; y++){
      tiles.add(new ArrayList<Tile>());
      for(int x = 0; x < xCount; x++){
        tiles.get(y).add(new Tile(x * tilesize, y * tilesize));
      }
    }
  }// END void populate
  
  void draw(){
    stroke(255);
    noFill();
    for(int y = 0; y < yCount; y++){
      for(int x = 0; x < xCount; x++){
        Tile tile = tiles.get(y).get(x);
        
        rect(tile.pos.x, tile.pos.y, tilesize, tilesize);
      }
    }
  }
}