float []cx = new float[2];
float []cy = new float[2];
float []r = new float[2];
float theta[] = new float[2];
float d;
float rate;
float dx;
float dy;

void setup(){
  size(800,800);
  cx[0] = width / 2;
  cy[0] = height /2;
  r[0] = 300;
  r[1] = 50;
  cx[1] = mouseX;
  cy[1] = mouseY;
}

void Update(){
  dx = mouseX -cx[0];
  dy = mouseY -cy[0];  
  d = sqrt(dx * dx + dy * dy);  
  // first quadrant
  // r[0] < d[0] + r[1]
  if(d> r[0]-r[1]){
    rate = (r[0]-r[1])/d;
    cx[1] = cx[0] +dx*rate;
    cy[1] = cy[0] +dy*rate;    
  }
  else{
    cx[1] = mouseX;
    cy[1] = mouseY;
  }
}

void draw(){
  background(255,255,255);
  Update();
  ellipse(cx[0],cy[0],r[0] * 2,r[0] * 2);
  ellipse(cx[1],cy[1],r[1] * 2,r[1] * 2);
  text("cx[1]",10,10);
//  println(cx[1]);
  println(rate);
}
