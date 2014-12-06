PVector P1; 
PVector P2; 

PVector v1;
PVector v2;

float slope = 1;
float intercept = 100;

PVector mouse;

PVector normal;

void setup(){
  size(800,800,P3D);
  background(255);
  
  P1 = new PVector(-width/2,slope * (-width/2) + intercept);
  P2 = new PVector(width/2,slope * (width/2) + intercept);
  
  v1 = new PVector(P2.x-P1.x,P2.y-P1.y);
  v2 = new PVector(0,0);
  
  mouse = new PVector(0,0);
  normal = new PVector(0,0);
  
}

void draw(){
  background(255);
  mouse.x = mouseX-width/2;
  mouse.y = -mouseY+height/2;  
  
  v2.x = mouse.x - P1.x;
  v2.y = mouse.y - P1.y;
  
  float dot = v1.x * v2.x + v1.y * v2.y;
  
  float V1 = v1.x * v1.x + v1.y * v1.y;
  float V2 = v2.x * v2.x + v2.y * v2.y;
  
  // check scall
  float scall = (dot) / (V1);
  
  normal.x = scall * v1.x + P1.x;
  normal.y = scall * v1.y + P1.y;  
  
  translate(width/2,height/2);  
  rotateX(PI);

  beginShape(LINES);
  
  vertex(P1.x,P1.y);
  vertex(P2.x,P2.y);
  
  vertex(-width/2,0);
  vertex(width/2,0);  

  vertex(0,-height/2);
  vertex(0,height/2);
  
  vertex(mouse.x,mouse.y);
  vertex(normal.x,normal.y);  
  
  endShape();
  
  println(scall);
  
}
