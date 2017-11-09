class ShapeCircle {
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  
  PVector pos = new PVector();
  
  int minShapes = 8;
  int maxShapes = 16;
  int minShapeSize = 20;
  int maxShapeSize = 60;
  int minLevel = 3;
  int maxLevel = 5;
  int minBaseDistance = 20;
  int maxBaseDistance = 40;
  int minGap = -10;
  int maxGap = 25;
  
  int randomInt(float a, float b){
    return int(random(a, b));  
  }
  
  String modeShuffle(){
    String[] modes = {"fil", "stroke", "fill", "stroke"};
    return modes[randomInt(0, modes.length-1)];
  }
  String shapeTypeShuffle(){
    String[] types = {"square", "hexagon", "circle", "triangle"};
    return types[randomInt(0, types.length-1)];
  }
  
  boolean isDead(){
    boolean dead = false;
    for(Shape shape : shapes){
      if(shape.dead){
        dead = true;
        break;
      }
    }
    return dead;
  }
  
  ShapeCircle(float x, float y){
    pos.set(x, y);
    
    int level = randomInt(minLevel, maxLevel);
    
    float baseDistance = random(minBaseDistance, maxBaseDistance);
    
    float totalShapeSize = 0;
    float gap = random(minGap, maxGap);
    int shapeCount = randomInt(minShapes, maxShapes);
    for(int i = 0; i < level; i++){
      
      float xpos = baseDistance + (i * gap) + totalShapeSize;
      float shapeSize = random(minShapeSize, maxShapeSize);
      
      totalShapeSize += shapeSize;
      
      float totalRotation = 0;
      float rotationStep = TWO_PI/ shapeCount;
      
      String type = shapeTypeShuffle();
      String mode = modeShuffle();

      color c = color(random(150, 250), random(100, 200), random(200, 255));
      
      for(int j = 0; j < shapeCount; j++){
          shapes.add(new Shape(type, mode, pos, totalRotation, xpos, shapeSize, c));
          
          totalRotation += rotationStep;
      }
     
    }// END for i < level
    
    // activate all
    for(Shape shape : shapes){
      shape.activate();
    }
  }
  
  void draw(){
    // activate all
    for(Shape shape : shapes){
      shape.draw();
    }
  }
}