PVector player_size = new PVector(70, 50);
PVector player_pos = new PVector(0 - player_size.x / 2, 300 - player_size.y / 2);

float player_speed = 3;
class PlayerBullet{
  PVector pos;
  PVector size = new PVector(5, 5);
  float speed = 3;
  boolean is_delete = false;
  
  PlayerBullet(float x, float y){
    pos = new PVector(x - size.x / 2, y);
  }
  PlayerBullet(PVector pos){
    this.pos = pos;
    pos.x = -size.x / 2;
  } 
  
  void update(){
    move();
    delete();
  }
  
  void draw(){
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void move(){
    pos.y += -speed;
  }
  
  void delete(){
    if(!(pos.y < -height / 2))return;
    is_delete = true;
  }
  
  boolean remove(){
    return is_delete;
  }
};

ArrayList<PlayerBullet>player_bullets = new ArrayList<PlayerBullet>();

void LeftKeyEvent(){
  if(!(keyCode == LEFT || key == 'a'))return;
  player_pos.x += -player_speed;
  if(player_pos.x < -width / 2){
    player_pos.x += player_speed;
  }
}

void RightKeyEvent(){
  if(!(keyCode == RIGHT || key == 'd'))return;
  player_pos.x += player_speed;  
  if(player_pos.x + player_size.x > width / 2){
    player_pos.x += -player_speed;
  }
}

void SpaceKeyEvent(){
  if(key != ' ' )return;
  if(player_bullets.size() == 10)return;
  player_bullets.add(new PlayerBullet(player_pos.x + player_size.x / 2,player_pos.y));
}

void keyPressed(){
  LeftKeyEvent();
  RightKeyEvent();
}

void keyTyped(){
  SpaceKeyEvent();
}
