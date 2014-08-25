
class CObject{
  float x,y;
  float vx,vy;
  float rx,ry;
  float d;
  float speed;
  float red;
  float green;
  float blue;

}

class CCircle extends CObject{
  
  public CCircle(float x,float y ,float rx,float ry,float speed){
    this.x = x;
    this.y = y;
    this.rx = rx;
    this.ry = ry;
    this.speed = speed;
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);    
  }
  void Draw(){
    smooth();
    noStroke();
    fill(red,green,blue);
    ellipse(x,y,rx,ry);
  }
  
  //head
  void Update(){
    d = sqrt((mouseX -x) * (mouseX -x)+ (mouseY -y)*(mouseY-y));
    vx= (mouseX -x)/d*speed;
    vy = (mouseY-y)/d*speed;
    if(d < speed/2){
      vx = 0;
      vy = 0;
    }
    x += vx;
    y += vy;
//      d = sqrt((mouseX -x) * (mouseX -x)+ (mouseY -y)*(mouseY-y));
//      if(d < 1.000){
//        vx = 0;
//        vy = 0;
//      }
//      angle = atan2(y-mouseY,x-mouseX);
//      text(angle,200,200);
//      vx = cos(degrees(angle));
//      vy = sin(degrees(angle));
//      x += vx;
//      y += vy;
  }
  
  //after
  void Update(float x1,float y1){
    if(mousePressed){
      vx += random(-50,50);
      vy += random(-50,50);
    }
    else {
      d = sqrt((x1 -x) * (x1 -x)+ (y1 -y)*(y1-y));
      vx= (x1 -x)/d*speed;
      vy = (y1-y)/d*speed;
      if(d >100){
      vx= (x1 -x)/d*60;
      vy = (y1-y)/d*60;
      }
      if(d > 50){
      vx= (x1 -x)/d*40;
      vy = (y1-y)/d*40;        
      }
      if(d < 16.000){
      vx= (x1 -x)/d*2;
      vy = (y1-y)/d*2;
      }
      if(d < 8.000){
      vx= (x1 -x)/d*1;
      vy = (y1-y)/d*1;      
      }
      if(d < 4.00){
      vx= (x1 -x)/d*0.1;
      vy = (y1-y)/d*0.1;
      }
    }
    x += vx;
    y += vy;
  }
};

ArrayList<CCircle> circle;
int CIRCLE_NUM = 60;

void setup(){
  size(800,800);
  circle = new ArrayList<CCircle>();
for(int i = 0; i < CIRCLE_NUM; i++){
  circle.add(new CCircle(width/2,height/2,75/2,50/2,4));
  }
}

void draw(){
  background(0,0,0);
  
  //update of head
  for(int i = 0; i < 1;i++){
   CCircle circles = circle.get(i);
   circles.Update();
  }
  
  // update of after
  for(int i = 1; i <CIRCLE_NUM ;i++){
    CCircle circles = circle.get(i);
    CCircle Circles = circle.get(i-1);   
    circles.Update(Circles.x,Circles.y);
  }
  
  // draw
  for(int i = CIRCLE_NUM-1; i > -1;i--){
    CCircle circles = circle.get(i);
    circles.Draw();
  }
}
