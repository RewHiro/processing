void setup(){
  size(800,800,P3D);
  background(0);
  noStroke();
}

float triangle1_x = width/2;
float angle = 0;

PVector v0 = new PVector(0,0,0);
PVector v1 = new PVector(100,0,0);
PVector v2 = new PVector(0,100,0);
PVector v3 = new PVector(100,100,0);

PVector v4 = new PVector(0,0,-100);
PVector v5 = new PVector(100,0,-100);
PVector v6 = new PVector(0,100,-100);
PVector v7 = new PVector(100,100,-100);  

PVector pos = new PVector(0,0,0);
PVector size = new PVector(50,150,50);

void Quad(
PVector p0,    // lower left
PVector p1,    // lower right
PVector p2,    // upper left
PVector p3,    // upper right
color Color)   
{
  fill(Color);
  
  vertex(p0.x,p0.y,p0.z);
  vertex(p1.x,p1.y,p1.z);
  vertex(p2.x,p2.y,p2.z);

  vertex(p3.x,p3.y,p3.z);
  vertex(p1.x,p1.y,p1.z);
  vertex(p2.x,p2.y,p2.z);  
}



void Quad(
PVector pos,
PVector size,
float depth,
color Color)
{
  fill(Color);
  
  vertex(pos.x,pos.y,depth);
  vertex(pos.x+size.x,pos.y,depth);
  vertex(pos.x,pos.y+size.y,depth);
  
  vertex(pos.x+size.x,pos.y+size.y,depth);
  vertex(pos.x,pos.y+size.y,depth);
  vertex(pos.x+size.x,pos.y,depth);
}



void Box(
PVector p0,        // lower left
PVector p1,        // lower right
PVector p2,        // upper left
PVector p3,        // upper right
PVector p4,        // lower left
PVector p5,        // lower right
PVector p6,        // upper left
PVector p7,        // upper right
color Color)        
{
 Quad(p0,p1,p2,p3,Color); 
 Quad(p4,p5,p6,p7,Color); 
 Quad(p1,p5,p3,p7,Color);
 Quad(p4,p0,p6,p2,Color);  
 Quad(p4,p5,p0,p1,Color);  
 Quad(p2,p3,p6,p7,Color);
}


void Box(
PVector pos,
PVector size,
color Color)
{
  PVector p0 = new PVector(pos.x,pos.y,pos.z);
  PVector p1 = new PVector(pos.x+size.x,pos.y,pos.z);
  PVector p2 = new PVector(pos.x,pos.y+size.y,pos.z);
  PVector p3 = new PVector(pos.x+size.x,pos.y+size.y,pos.z);

  PVector p4 = new PVector(pos.x,pos.y,pos.z-size.z);
  PVector p5 = new PVector(pos.x+size.x,pos.y,pos.z-size.z);
  PVector p6 = new PVector(pos.x,pos.y+size.y,pos.z-size.z);
  PVector p7 = new PVector(pos.x+size.x,pos.y+size.y,pos.z-size.z);    
  
  Box(p0,p1,p2,p3,p4,p5,p6,p7,Color);
  
}

void draw(){
  translate(width/2,height/2);
  angle += PI/120;
  background(0);
  lights();
  beginShape(TRIANGLE);
  
  Box(pos,size,color(255,0,0));

  rotateX(angle);  
  rotateY(angle);  
  rotateZ(angle);  
  endShape();
}
