float []cx = new float[2];
float []cy = new float[2];
float []r = new float[2];
float theta[] = new float[2];
float d[] = new float[2];

void setup(){
  size(800,800);
  cx[0] = width / 2;
  cy[0] = height /2;
  r[0] = 300;
  r[1] = 50;
  cx[1] = cx[0] + (r[0] - r[1]) * cos(theta[0]);
  cy[1] = cy[0] + (r[0] - r[1]) * sin(theta[0]);
}

void Update(){
  // first quadrant
  if(cx[0] < mouseX && cy[0] > mouseY){
    d[0] = sqrt((mouseX -cx[0]) * (mouseX -cx[0]) + (mouseY -cy[0]) * (mouseY -cy[0]));
    d[1] = sqrt((cx[0] - mouseX) * (cx[0] - mouseX ));
    theta[0] = -acos(d[1] / d[0]);
  }  
  // second quadrant
  else if(cx[0] > mouseX && cy[0] > mouseY){
    d[0] = sqrt((mouseX -cx[0]) * (mouseX -cx[0]) + (mouseY -cy[0]) * (mouseY -cy[0]));
    d[1] = sqrt((cx[0] - mouseX) * (cx[0] - mouseX ));
    theta[0] = -acos(-d[1] / d[0]);
  }
  // third quadrant
  else if(cx[0] > mouseX && cy[0] < mouseY){
    d[0] = sqrt((mouseX -cx[0]) * (mouseX -cx[0]) + (mouseY -cy[0]) * (mouseY -cy[0]));
    d[1] = sqrt((cx[0] - mouseX) * (cx[0] - mouseX ));
    theta[0] = acos(-d[1] / d[0]);
  }  
  // fourth quadrant
  else if(cx[0] < mouseX && cy[0] < mouseY){
    d[0] = sqrt((mouseX -cx[0]) * (mouseX -cx[0]) + (mouseY -cy[0]) * (mouseY -cy[0]));
    d[1] = sqrt((mouseX -cx[0]) * (mouseX -cx[0]));
    theta[0] = acos(d[1] / d[0]);
  }
  cx[1] = cx[0] + (r[0] - r[1]) * cos(theta[0]);
  cy[1] = cy[0] + (r[0] - r[1]) * sin(theta[0]);
}

void draw(){
  background(255,255,255);
  Update();
  ellipse(cx[0],cy[0],r[0] * 2,r[0] * 2);
  ellipse(cx[1],cy[1],r[1] * 2,r[1] * 2);
}
