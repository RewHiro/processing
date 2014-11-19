float angle = 0;
PVector pos = new PVector(0,0,0);
PVector size = new PVector(100,-200,100);

void setup(){
  size(800,800,P3D);
  background(0);
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

void Cylinder(
int angle_num,
PVector pos,
PVector size,
color Color)
{
  if(angle_num<3)return;
  
  PVector[] quad_pos = new PVector[angle_num];
  PVector[] quad_size = new PVector[angle_num];  
  
  for(int i = 0; i < angle_num; i++){
    quad_pos[i] = new PVector(size.x*cos(2*PI/(angle_num)*i+2*PI/(angle_num/2))+pos.x,
                                pos.y,
                                  size.z*sin(2*PI/(angle_num)*i+2*PI/(angle_num/2))+pos.z);
                                  
    quad_size[i] = new PVector(size.x*cos(2*PI/(angle_num)*i+2*PI/(angle_num/2))+pos.x,
                                 pos.y-size.y,
                                   size.z*sin(2*PI/(angle_num)*i+2*PI/(angle_num/2))+pos.z);
  }

  
  for(int i = 0; i < angle_num; i++){
    int j = angle_num-1 > i ? i+1 : 0; 
      Quad(quad_size[i],quad_size[j],quad_pos[i],quad_pos[j],Color);
  } 
}


void draw(){
  background(0);
  translate(width/2,height/2);  

  lights();
  angle += PI/120;
  rotateX(-PI/6);
  rotateY(angle);
  
  Cylinder(8,pos,size,color(255,0,0));


}
