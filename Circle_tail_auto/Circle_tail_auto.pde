float []cx = new float[2];
float []cy = new float[2];
float []r = new float[2];
float theta[] = new float[2];

void setup(){
  size(800,800);
  cx[0] = width / 2;
  cy[0] = height /2;
  r[0] = 300;
  r[1] = 50;
  cx[1] = width / 2 + r[0]* cos(theta[0]) - r[1] * cos(theta[0]);
  cy[1] = height /2 + r[0]* sin(theta[1]) - r[1] * sin(theta[1]);
}

void Update(){
  theta[0] += PI / 60;
  theta[1] += PI / 60;
  cx[1] = width / 2 + r[0]* cos(theta[0]) - r[1] * cos(theta[0]);
  cy[1] = height /2 + r[0]* sin(theta[1]) - r[1] * sin(theta[1]);
}

void draw(){
  background(255,255,255);
  Update();
  ellipse(cx[0],cy[0],r[0] * 2,r[0] * 2);
  ellipse(cx[1],cy[1],r[1] * 2,r[1] * 2);
}
