float player_width = 70;
float player_height = 50;
float player_x = 0 - player_width / 2, player_y = 300 - player_height / 2;
float player_speed = 2;;

class PlayerBullet{
  PVector pos;
  PVector size = new PVector(5, 5);
  float speed = 3;
  
  PlayerBullet(float x, float y){
    pos = new PVector(x - size.x / 2, y);
  }
  PlayerBullet(PVector pos){
    this.pos = pos;
    pos.x = -size.x / 2;
  } 
  
  void update(){
    move();
  }
  
  void draw(){
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void move(){
    pos.y += -speed;
  }
  
  boolean remove(){
    if(!(pos.y < -height / 2))return false;
    return true;
  }
};

ArrayList<PlayerBullet>player_bullets = new ArrayList<PlayerBullet>();

void setup() {
  size(800, 800);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  
  
  for(PlayerBullet bullet : player_bullets){
    bullet.update();
    bullet.draw();
  }
  for(int i = 0; i < player_bullets.size(); i++){
    if(player_bullets.get(i).remove()){
      player_bullets.remove(i);
    }
  }
  
  rect(player_x, player_y, player_width, player_height);
}

void LeftKeyEvent(){
  if(!(keyCode == LEFT || key == 'a'))return;
  player_x += -player_speed;
  if(player_x < -width / 2){
    player_x += player_speed;
  }
}

void RightKeyEvent(){
  if(!(keyCode == RIGHT || key == 'd'))return;
  player_x += player_speed;  
  if(player_x + player_width > width / 2){
    player_x += -player_speed;
  }
}

void SpaceKeyEvent(){
  if(key != ' ' )return;
  player_bullets.add(new PlayerBullet(player_x + player_width / 2,player_y));
}

void keyPressed(){
  LeftKeyEvent();
  RightKeyEvent();
}

void keyTyped(){
  SpaceKeyEvent();
}
