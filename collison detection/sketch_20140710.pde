class OBJECT{
  public float x, y;
};
class CRect extends OBJECT{
  float wide, high;
  public CRect(){
    x = width / 2 - 200;
    y = height / 2 - 200;
    wide = 400;
    high = 400;
  }
  void Draw(){
    strokeWeight(10);
    rect(x, y, wide, high);
  } 
};

class CCircle extends OBJECT{
  float vx, vy;
  float r;
  int state;
  public CCircle(){
    r = 50;
    x = 100;
    y = 100;
    vx = random(-3, 3);
    vy = random(-3, 3);
    
    // if out of rect
    if(Rect.x > x + (r / 2) || Rect.x + Rect.wide  < x - (r / 2)
    || Rect.y  > y + (r / 2) || Rect.y + Rect.high < y - (r / 2)){
      state = 1;
    }
  }
  
  // if mousedragged
  void mouseDragged(){
    
    // if the pale of circle
      if((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y) < r * r){
        if(mousePressed){        
          state = 2;
        }
        // if mousereleased
        else{
          
          // if out of rect
          if(Rect.x - 5 > x + (r / 2) || Rect.x + Rect.wide +5 < x - (r / 2)
          || Rect.y - 5 > y + (r / 2) || Rect.y + Rect.high +5 < y - (r / 2)){
            state = 1;
          }
          // if the pale of rect
          else if(Rect.x +5 < x - (r / 2) && Rect.x + Rect.wide -5 > x + (r / 2)
          && Rect.y +5 < y - (r / 2) && Rect.y + Rect.high -5 > y + (r / 2)){
            state = 0;
          }
        }
      }
    }
  void Update(){
    
    // handling of speed
    if(state == 1 || state == 0){
      x += vx;
      y += vy;
    }
    
    mouseDragged();
    
    // if out of window's display
    if(state == 1 || state == 0){
      // collision detection
      if(0 > x - (r / 2) || x + (r / 2)> width){
        vx *= -1;
      }
      if(0 > y - (r / 2) || y + (r / 2)> height){
        vy *= -1;
      }
    }
    
    // if out of rect
    if(state == 1){
      // collision detection
      if(x+ (r / 2) > Rect.x -6 && x - (r / 2) < Rect.x + Rect.wide +6
      && y + (r / 2) > Rect.y +5 && y - (r / 2) < Rect.y + Rect.high -5){
        vx *= -1;
               }
      if(x+ (r / 2) > Rect.x +5 && x - (r / 2) < Rect.x + Rect.wide -5
      && y + (r / 2) > Rect.y -6 && y - (r / 2) < Rect.y + Rect.high +6){
        vy *= -1;
      }
    }
    
    // if the pale of rect
    if(state == 0){
      // collision detection
      if(x - (r / 2) < Rect.x + 6 || x + (r / 2) > Rect.x + Rect.wide -6){
        vx *= -1;
               }
      if(y - (r / 2) < Rect.y +6 || y + (r / 2) > Rect.y + Rect.high -6){
        vy *= -1;
      }
    }
    
    // if mousedragged
    if(state == 2){
      x = mouseX;
      y = mouseY;
    }    
  }
  void Draw(){
    strokeWeight(1);
    ellipse(x, y, r, r);
  }
};

// instantiation
CRect Rect;
ArrayList<CCircle> Circle;

// init
void setup(){
  size(800,800);
  Rect = new CRect();
  Circle =  new ArrayList<CCircle>();
  for(int i = 0; i < 10; i++){
    Circle.add(new CCircle());
  }
}

void draw(){
  background(255, 255, 255);
  Rect.Draw();
  for(int i = 0; i < Circle.size(); i++){
    CCircle Circles = Circle.get(i);
    Circles.Update();
    Circles.Draw();
  }
}
