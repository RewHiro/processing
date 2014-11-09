
boolean ispressed_enter;

void setup(){
  size(800,800,P3D);
  background(255);
  rectMode(CENTER);
  ispressed_enter = false;
}


void rect3D(
float pos_x,
float pos_y,
float size_x,
float size_y,
color rect_color,
float depth
)
{
  translate(0,0,depth);  
  fill(rect_color);
  rect(pos_x,pos_y,size_x,size_y);  
}



void keyPressed(){
  ispressed_enter = !ispressed_enter;
}



void draw(){
  background(255);
//hint(DISABLE_DEPTH_TEST);
  rotateX(0);
//  rotateY(PI/4);
  rotateZ(0);
  
  
  float mouse_x = map(mouseX,0,width,-1000,1000);
  float mouse_y = map(mouseY,0,height,-1000,1000);
  
  camera(mouse_x,mouse_y,1000,
  width/2,height/2,0,
  0,1,0);
 
 
 
  translate(width/2,height/2);  
  
//float test = mouseX;
//println(test);
  
  if(ispressed_enter){
  rect3D(0,0,200,200,color(255,0,0,50),100);
  
  rect3D(0,0,200,200,color(0,255,0,50),-100);
  
  rect3D(0,0,200,200,color(0,0,255,50),-100);
  }
  else {
  rect3D(0,0,200,200,color(0,0,255,50),0-100);
  
  rect3D(0,0,200,200,color(0,255,0,50),100);
  
  rect3D(0,0,200,200,color(255,0,0,50),100);    
  }
}
