
int hanoi(int n){
  if(n<=0)return 0;
  
  if(n == 1){
    return 1;
  }
  else{
    return 2*hanoi(n-1)+1;
  }
}

int circle_num = 3;
int count = 0;
void setup(){
  size(800,800);
  count = hanoi(circle_num);
  println(count);
}

void draw(){
  translate(width/2,height/2);
  textSize(80);
  fill(129,41,139);
  text(count,0,0);
}
