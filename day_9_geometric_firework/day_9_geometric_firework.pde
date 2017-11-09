ArrayList<ShapeCircle> shapeSystem = new ArrayList<ShapeCircle>();

PShape cur;
void setup(){
  size(1000, 1000);  
  
  noCursor();
  
  // Draw cursor
  cur = createShape();
  cur.beginShape();
  cur.fill(250, 75, 75);
  cur.noStroke();
  cur.vertex(0, 0);
  cur.vertex(182, 180);
  cur.vertex(76, 180);
  cur.vertex(0, 256);
  cur.endShape(CLOSE);
  
  colorMode(HSB);
}
void draw(){
  background(25);
  
  for(ShapeCircle sc : shapeSystem){
    sc.draw();  
  }

  clearDeadBodies();
  
  shape(cur, mouseX, mouseY, 11.375, 16);
  
  saveFrame("frames/####.tga");
}

void clearDeadBodies(){
  ArrayList<Integer> deadIDs = new ArrayList<Integer>();
  for(int i = 0; i < shapeSystem.size(); i++){
    ShapeCircle sc = shapeSystem.get(i);
    
    if(sc.isDead()){
      deadIDs.add(i);  
    }
  }
  
  if(deadIDs.size() > 0){
    int substractor = 0;
    for(int i = 0; i < deadIDs.size(); i++){
      shapeSystem.remove(deadIDs.get(i) - substractor);
      substractor++;
    }
  }
}

void mousePressed(){
  shapeSystem.add(new ShapeCircle(mouseX, mouseY));  
}