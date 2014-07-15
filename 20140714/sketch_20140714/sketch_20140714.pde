float x,y;
float r;
float x1,y1;
int state;
float dragx;
float dragy;

void setup(){
  size(800,800);
  x = width / 2;
  y = height / 2;  
  r = 100;
  dragx = x;
  dragy = y;  
}


void mouseDragged(){
  x = mouseX - sqrt((mouseX - x) * (mouseX - x));
  if((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y) < r * r){
    if(mousePressed){
      x = mouseX - sqrt((mouseX - x) * (mouseX - x));
      y = mouseY;
      }

//      else if(x > mouseX){
//      x = mouseX + sqrt((mouseX - x) * (mouseX - x));
//      }
//      if(y < mouseY){
//      y = mouseY + sqrt((mouseY - y) * (mouseY - y));
//      }
//      else if(y < mouseY){
//      y = mouseY - sqrt((mouseY - y) * (mouseY - y));
//      }
    
    dragx = x;
    dragy = y;
    }
}

void mouseReleased(){
  x = dragx;
  y = dragy;
}

void draw(){
  mouseDragged();
  mouseReleased();
  background(255,255,255);
  ellipse(x,y,r *2,r *2);
}
