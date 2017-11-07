PImage hourbig_image;
PImage hour_image;
PImage minute_image;
PImage second_image;
PImage secondsmall_image;
PImage secondsupersmall_image;

PImage background;

Rotator hourbig;
Rotator hour;
Rotator minute;
Rotator second;
Rotator secondsmall;
Rotator secondsupersmall;

PVector mouseStart = new PVector(0, 0);

float secsprsmlTint, secsmlTint, secTint, minTint, hrTint, hrbigTint;

void setup(){
  size(1000, 1000, P2D);
  
  hourbig_image = loadImage("images/hourbig.png");
  hour_image = loadImage("images/hour.png");
  minute_image = loadImage("images/minute.png");
  second_image = loadImage("images/second.png");
  secondsmall_image = loadImage("images/secondsmall.png");
  secondsupersmall_image = loadImage("images/secondsupersmall.png");
  
  background = loadImage("images/background.png");
  
  int speed = 50;
  
  hourbig = new Rotator(hourbig_image, 800, 1, speed, 60, true, "left");
  hour = new Rotator(hour_image, 636, 2, speed, 30, true, "right");
  minute = new Rotator(minute_image, 424, 3, speed, 12, true, "left");
  second = new Rotator(second_image, 266, 4, speed, 60, true, "right");
  secondsmall = new Rotator(secondsmall_image, 160, 5, speed, 30, true, "left");
  secondsupersmall = new Rotator(secondsupersmall_image, 86, 6, speed, 12, true, "right");
  
  secsprsmlTint = 0.5 * 255;
  secsmlTint = 0.6 * 255;
  secTint = 0.7 * 255;
  minTint = 0.8 * 255;
  hrTint = 0.9 * 255;
  hrbigTint = 1 * 255;
}

void draw(){
  background(51);
  image(background, 0, 0);
  pushMatrix();
    translate(width/2, height/2);
    
    fill(51);
    noStroke();
    //rect(-470, -470, 940, 940);
    
    //tint(255, secsprsmlTint);
    secondsupersmall.draw();
    
    //tint(255, secsmlTint);
    secondsmall.draw();
    
    //tint(255, secTint);
    second.draw();
    
    //tint(255, minTint);
    minute.draw();
    
    //tint(255, hrTint);
    hour.draw();
    
    //tint(255, hrbigTint);
    hourbig.draw();
    
    
    
  popMatrix();

}
/*void mousePressed(){
    mouseStart.set(mouseX, mouseY);
}
void mouseDragged(){
    float center = 500;
    
    float deltaX = mouseX - mouseStart.x;
    float deltaY = mouseY - mouseStart.y;
    
    float divider = 10;
    
    hourbig.pos.x = hourbig.centerPos.x - (deltaX *hourbig.level);
    hourbig.pos.y = hourbig.centerPos.y - (deltaY * hourbig.level);
    
    hour.pos.x = hour.centerPos.x - (deltaX * hour.level);
    hour.pos.y = hour.centerPos.y - (deltaY * hour.level);
    
    minute.pos.x = minute.centerPos.x - (deltaX * minute.level);
    minute.pos.y = minute.centerPos.y - (deltaY * minute.level);
    
    second.pos.x = second.centerPos.x - (deltaX * second.level);
    second.pos.y = second.centerPos.y - (deltaY * second.level);
    
    secondsmall.pos.x = secondsmall.centerPos.x - (deltaX * secondsmall.level);
    secondsmall.pos.y = secondsmall.centerPos.y - (deltaY * secondsmall.level);
    
    secondsupersmall.pos.x = secondsupersmall.centerPos.x - (deltaX * secondsupersmall.level);
    secondsupersmall.pos.y = secondsupersmall.centerPos.y - (deltaY * secondsupersmall.level);
}

void mouseReleased(){
  hourbig.pos = hourbig.centerPos.copy();
  hour.pos = hour.centerPos.copy();
  minute.pos = minute.centerPos.copy();
  second.pos = second.centerPos.copy();
  secondsmall.pos = secondsmall.centerPos.copy();
  secondsupersmall.pos = secondsupersmall.centerPos.copy();
}*/