PImage[] invador_animation = new PImage[2];
int anime = 0;
int frame_count = 0;
int stage = 1;
int death_count;
boolean is_death = false;

class Invador{
  PVector pos;
  PVector size = new PVector(50, 50);
  float speed = 1;
  boolean is_delete = false;
  
  Invador(float x,float y){
    pos = new PVector(x, y);
  }
  Invador(PVector pos){
    this.pos = pos;
  }
  
  void speedUp(int value){
    speed = value;
  }

  void update(){
    move();
  }
  
  void draw(){
    image(invador_animation[anime],pos.x,pos.y,size.x,size.y);
  }
  
  void move(){
    pos.x += speed;
  }
  
  boolean remove(){
    return is_delete;
  }  
};



ArrayList<Invador> invadros = new ArrayList<Invador>();


void BounceInvador(){
    for(Invador invador : invadros){
      if(invador.pos.x + invador.size.x > width / 2 ||
        invador.pos.x < -width / 2){
        for(Invador enemy : invadros){
        enemy.pos.y += 50;
        enemy.speed *= -1;
        }
       break; 
      }
    }
}

void RepositPosInvador(){
  if(!(invadros.get(0).pos.y > height / 2 - 50))return;
  for(Invador invador : invadros){
    invador.pos.y = -height / 2;
  }
}

void Init(){
  for(int j = 0; j < 4; j++){
    for(int i = 0; i < 10; i++){
      invadros.add(new Invador(-200 + 50 * i, -height / 2 + j * 50)); 
    }
  }
  death_count = invadros.size();  
}


void setup(){
  size(800,800);
  invador_animation[0] = loadImage("invader_1.bmp");
  invador_animation[1] = loadImage("invader_2.bmp");
  Init();

}

boolean hit(PVector a_pos, PVector a_size, PVector b_pos, PVector b_size){
  if(!(a_pos.x < b_pos.x + b_size.x && b_pos.x < a_pos.x + a_size.x &&
    a_pos.y < b_pos.y + b_size.y && b_pos.y < a_pos.y + a_size.y))return false;
    return true;
}

void draw(){
  if(is_death)return;
  fill(255);
  translate(width/2,height/2);
  background(255);
  frame_count++;
  anime = frame_count / 60 % 2;

  BounceInvador();
  RepositPosInvador();
  
  for(Invador invador : invadros){
    invador.update();
    invador.draw();
  }

  for(PlayerBullet bullet : player_bullets){
    bullet.update();
    bullet.draw();
  }
  
  rect(player_pos.x, player_pos.y, player_size.x, player_size.y);  
  
  for(int i = 0; i < player_bullets.size(); i++){
    if(player_bullets.get(i).remove()){
      player_bullets.remove(i);
    }
  }
  
  for(int i = 0; i < invadros.size(); i++){
    if(invadros.get(i).remove()){
      invadros.remove(i);
    }
  }
  
  for(Invador invador : invadros){
    for(PlayerBullet bullet : player_bullets){
      if(hit(invador.pos,invador.size,bullet.pos,bullet.size)){
        invador.is_delete = true;
        bullet.is_delete = true;
        death_count--;
        break;
      }
    }
    if(hit(player_pos, player_size, invador.pos,invador.size)){
      is_death = true;
    }
  }
  if(death_count == 0){
    Init();
    stage++;
    for(Invador invador : invadros){
      invador.speedUp(stage);
    }
  }
  
  fill(0);
  textSize(20);
  text("Stage" + stage, -width / 2, -height / 2, 100, 100);
}
