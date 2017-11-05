ArrayList<Square> squares = new ArrayList<Square>();

void addSquare(float initW, float initH, float activeW, float activeH, float lvl){
  squares.add(new Square(width/2, height/2, initW, initH, activeW, activeH, lvl)); 
}

boolean dragging = false;
PVector startPos = new PVector(0, 0);

PShape cur;
void setup(){
  size(1000, 1000);
  noCursor();
  
  cur = createShape();
  cur.beginShape();
  cur.fill(250, 75, 75);
  cur.noStroke();
  cur.vertex(0, 0);
  cur.vertex(182, 180);
  cur.vertex(76, 180);
  cur.vertex(0, 256);
  cur.endShape(CLOSE);
  
  addSquare(300, 500, 275, 475, 1);
  addSquare(300, 500, 250, 450, 2);
  addSquare(300, 500, 225, 425, 3);
  addSquare(300, 500, 200, 400, 4);
  addSquare(300, 500, 175, 375, 5);
  addSquare(300, 500, 150, 350, 6);
  addSquare(300, 500, 125, 325, 7);
  addSquare(300, 500, 100, 300, 8);
  addSquare(300, 500, 75, 275, 9);
  addSquare(300, 500, 50, 250, 10);
}

void draw(){
  background(25);
  
 
  
  for(int i = squares.size()-1; i >= 0; i--){
    Square square = squares.get(i);
    square.draw();  
  }
  
  stroke(200);
  rect(width/2, height/2, 300, 500);
  
  shape(cur, mouseX, mouseY, 11.375, 16);
}

void mousePressed(){
  for(Square square : squares){
    square.activate();  
  }
  
  dragging = true;
  for(Square square : squares){
    square.startPos = square.pos.copy();  
  }
  startPos.set(mouseX, mouseY);
}
void mouseDragged(){
  if(dragging){
    PVector currentPos = new PVector(mouseX, mouseY);
    PVector deltaPos = currentPos.sub(startPos);
    
    for(Square square : squares){
      square.pos.set(square.startPos.x-(deltaPos.x*square.level), square.startPos.y-(deltaPos.y*square.level)); 
    }
  }
}
void mouseReleased(){
  for(Square square : squares){
    square.deactivate();  
  }
  
  dragging = false;
}