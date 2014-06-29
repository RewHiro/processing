float x;
float y;
float xSpeed;
float ySpeed;
float amplitude;
float theta;
float small1;
int keytype;
float ballx[];
float bally[];
float circlecolor[];
float circlecount[];
int colorMAX = 5;
float Scirclecolor[];
float Scirclecount[];
int ScircleMAX = 12;
int circlescount;
int keymouse;
int count = 0;
Circle[] circles = new Circle[100];

class Circle{
  int st = 0;
  float xPos;
  float yPos;
  float size;
  float circlecolor[];
  
  Circle (float x, float y,int stt){
    st = stt;
    xPos = x;
    yPos = y;
    size = 50;
    circlecolor = new float[3];
    for(int i = 0; i < 3; i++){
      circlecolor[i] = random(100);
    }
  }
  
  void update(){
    colorMode(HSB,100);
    fill(circlecolor[0],circlecolor[1],circlecolor[2]);
    ellipse(xPos,yPos,size,size);
  }
}

void setup(){
  size(800, 800);
  x = width / 2;
  y = height / 2;
  xSpeed = 10;
  ySpeed = 10;
  amplitude = 200;
  keytype = 0;
  ballx = new float [5];
  bally = new float [5];
  circlecolor =new float [colorMAX];
  circlecount = new float[2];
  Scirclecolor = new float [12];
  Scirclecount = new float [12];
  circlescount = 0;
  keymouse = 0;
    
  
  for(int i = 0; i < 5; i++){
    ballx[i] = random(width); 
    bally[i] = random(height);
  }
  for(int i = 0; i < colorMAX; i++){
    circlecolor[i] = (int)random(100);
  }
  for(int i = 0; i < 2; i++){
    circlecount[i] = 0.1;
  }
  
  for(int i = 0; i < ScircleMAX; i++){
    Scirclecolor[i] = (int)random(100);
  }
  for(int i = 0; i < ScircleMAX; i++){
    Scirclecount[i] = 0.1;
  }
}


void update(){
  if(keyPressed == true && keyCode == UP){
    y -= ySpeed;
  }
  else if(keyPressed == true && keyCode == DOWN){
    y += ySpeed;
  }
  
  if(keyPressed == true && keyCode == RIGHT){
    x += xSpeed;
  }
  else if(keyPressed == true && keyCode == LEFT){
    x -= xSpeed;
  }
  
  if(keyPressed == true && key == 'a'){
    keytype = 0;
  }
  else if(keyPressed == true && key == 's'){
    keytype = 1;
  }
  
  for(int i = 3; i < 5; i++){
    if(circlecolor[i] >= 100.0 || circlecolor[i] <= 0.0){
      if(i == 3){
        circlecount[0] *= -1;
      }
      else if(i == 4){
        circlecount[1] *= -1;
      }
    }
  }
  circlecolor[3] += circlecount[0];
  circlecolor[4] += circlecount[1];
  
   for(int i = 0; i < ScircleMAX; i++){
    if(Scirclecolor[i] >= 100 || Scirclecolor[i] <= 0){
      Scirclecount[i] *= -1;
    }
   }
   
   for(int i = 0; i < ScircleMAX; i++){
     Scirclecolor[i] += Scirclecount[i];
   }

  theta += PI/120;
  small1 = theta;
}
  
void draw(){
  colorMode(RGB,255);
  background(255, 255, 255);
  update();
  fill(0, 0, 0); 
  ellipse(x, y, 100, 100);
  
  switch(keytype){
    case 0:
    for(int i = 2; i < 7; i +=2){
      colorMode(HSB,100);
      if(i == 2){
        fill(circlecolor[0], circlecolor[1],circlecolor[2]);
      }
      else if(i == 4){
        fill(circlecolor[0], circlecolor[3],circlecolor[2]);
      }
      else if(i == 6){
        fill(circlecolor[0], circlecolor[1],circlecolor[4]);
      }
        ellipse(x + sin(i * PI / 3 + small1) * amplitude, y - cos(i * PI / 3 + small1) * amplitude, 50, 50);
      }
    
    break;
    
    case 1:
    colorMode(HSB,100);
    
    fill(Scirclecolor[0],Scirclecolor[1],Scirclecolor[2]);
    ellipse(x + sin( small1) * amplitude, y - cos(small1) * amplitude, 50, 50);    
    
    fill(Scirclecolor[3],Scirclecolor[4],Scirclecolor[5]);
    ellipse(x - sin( small1) * amplitude, y + cos(small1) * amplitude, 50, 50);
    
    fill(Scirclecolor[6],Scirclecolor[7],Scirclecolor[8]);
    ellipse(x + sin( small1) * amplitude, y + cos(small1) * amplitude, 50, 50);
    
    fill(Scirclecolor[9],Scirclecolor[10],Scirclecolor[11]);
    ellipse(x - sin( small1) * amplitude, y - cos(small1) * amplitude, 50, 50);
    break;
  }
  for(int i = 0; i < count; i++){
    if(circles[i].st == 1){
      circles[i].update();
    }
  }
}
void mousePressed(){
  circles[count] = new Circle(mouseX,mouseY,1);
  count++;
}
