float cx,cy;
float r;
boolean isHit;
float dx,dy;
float cx0,cy0;
float px,py;

void setup(){
  size(800,800);
  cx = width / 2;
  cy = height /2;
  r = 100;
  isHit = false;
}

void mouseDragged(){
  if(isHit){
    cx = cx0 + mouseX - px;
    cy = cy0 + mouseY - py;
  }
}

void mousePressed(){
  dx = mouseX - cx;
  dy = mouseY - cy;
  cx0 = cx;
  cy0 = cy;
  px = mouseX;
  py = mouseY;
  if(dx * dx + dy * dy< r * r){
    isHit = true;
  }
}

void mouseReleased(){
  isHit = false;
}



void draw(){
  background(255,255,255);
  ellipse(cx,cy,r*2,r*2);
}
