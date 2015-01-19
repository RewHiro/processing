float vx = 1;;
float y= 0;
float speed = 5;

void setup(){
  size(800,800);
}

void draw(){
  translate(width/2,height/2);
  background(255);
  vx += speed;
  for(int i = 0; i < 10; i++){
    ellipse(-200 + i * 50 + vx,y,50,50);
  }
  if(-200 + 10 * 50 + vx -25 >width/2){
      y += 50;
      speed *= -1;
  }
  else if(-200 + 0 * 50 + vx -25 < -width /2){
    y += 50;
    speed *= -1;    
  }
  if(y > height/2){
    y = 0;
  }
}
