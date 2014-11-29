float angle = 0;
PVector pos = new PVector(0,0,0);
PVector size = new PVector(100,-200,100);

void setup(){
  size(800,800,P3D);
  background(255);
}


void Quad(
PVector p0,              // lower left
PVector p1,              // lower right
PVector p2,              // upper left
PVector p3,              // upper right
color Color)             
{
 fill(Color);
 noStroke();
 beginShape(TRIANGLE);
 
 vertex(p0.x,p0.y,p0.z); 
 vertex(p1.x,p1.y,p1.z);
 vertex(p2.x,p2.y,p2.z); 
 
 vertex(p3.x,p3.y,p3.z); 
 vertex(p1.x,p1.y,p1.z);
 vertex(p2.x,p2.y,p2.z);  
 
 endShape();
 
}

void Quad(
PVector pos,
PVector size,
color Color)
{
  fill(Color);
  noStroke();
  beginShape(TRIANGLE);
  
  vertex(pos.x,pos.y);
  vertex(pos.x+size.x,pos.y);
  vertex(pos.x,pos.y+size.y);
  
  vertex(pos.x+size.x,pos.y+size.y);
  vertex(pos.x,pos.y+size.y);
  vertex(pos.x+size.x,pos.y);
  
  endShape();
}

void Cylinder(
int angle_num,
PVector pos,
PVector size,
color Color)
{
  if(angle_num<3)return;
  for(int i = 0; i < angle_num; i++){
    PVector p1_pos = new PVector(size.x*cos(TWO_PI/(angle_num)*i+TWO_PI/(angle_num/2))+pos.x,
                                pos.y,
                                  size.z*sin(TWO_PI/(angle_num)*i+TWO_PI/(angle_num/2))+pos.z);
                                  
    PVector p1_size = new PVector(size.x*cos(TWO_PI/(angle_num)*(i+1)+TWO_PI/(angle_num/2))+pos.x,
                                pos.y,
                                  size.z*sin(TWO_PI/(angle_num)*(i+1)+TWO_PI/(angle_num/2))+pos.z);    
                                  
    PVector p2_pos = new PVector(size.x*cos(TWO_PI/(angle_num)*i+TWO_PI/(angle_num/2))+pos.x,
                                pos.y-size.y,
                                  size.z*sin(TWO_PI/(angle_num)*i+TWO_PI/(angle_num/2))+pos.z);
                                  
    PVector p2_size = new PVector(size.x*cos(TWO_PI/(angle_num)*(i+1)+TWO_PI/(angle_num/2))+pos.x,
                                pos.y-size.y,
                                  size.z*sin(TWO_PI/(angle_num)*(i+1)+TWO_PI/(angle_num/2))+pos.z);
                                  
    Quad(p2_pos,p2_size,p1_pos,p1_size,Color);                                  
  }
}


void draw(){
  background(255);
  translate(width/2,height/2);  
  
  lights();
  angle += PI/120;
  rotateX(-PI/6);
  rotateY(angle);
  Cylinder(8,pos,size,color(255,0,0));

}
