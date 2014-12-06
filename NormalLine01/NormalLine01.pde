
PVector P1;
PVector P2;

float a = 2;
float b = 100;

PVector mouse;
PVector normal;

void setup(){
  size(800,800,P3D);
  background(255);
  
  P1 = new PVector(-width/2,a*(-width/2)+b);
  P2 = new PVector(width/2,a*(width/2)+b);  
  
  mouse = new PVector(0,0);
  normal = new PVector(0,0);
}

void draw(){
  background(255);
  
  mouse.x = mouseX-width/2;
  mouse.y = -mouseY+height/2;  
  
  normal.x = (a*(mouse.y-b) + mouse.x) / (pow(a,2)+1);
  normal.y = (a*(a*(mouse.y-b) + mouse.x)) / (pow(a,2)+1) + b;
  
  translate(width/2,height/2);
  rotateX(PI);
  
  beginShape(LINES);
  
  vertex(-width/2,0);
  vertex(width/2,0);
  
  vertex(0,-height/2);
  vertex(0,height/2);  
  
  vertex(P1.x,P1.y);
  vertex(P2.x,P2.y);  
  
  vertex(mouse.x,mouse.y);
  vertex(normal.x,normal.y);
  
  endShape();
}
