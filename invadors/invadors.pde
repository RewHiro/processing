PImage[] invador_animation = new PImage[2];
int anime = 0;
int frame_count = 0;

class Invador{
  PVector pos;
  PVector size = new PVector(50, 50);
  float speed = 2;
  
  
  Invador(float x,float y){
    pos = new PVector(x, y);
  }
  Invador(PVector pos){
    this.pos = pos;
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
};



ArrayList<Invador> invadros = new ArrayList<Invador>();


void BounceInvador(){
    if(!(invadros.get(invadros.size() - 1).pos.x + invadros.get(invadros.size() - 1).size.x > width/2 ||
      invadros.get(0).pos.x < -width /2))return;
      
    for(Invador invador : invadros){
      invador.pos.y += 50;
      invador.speed *= -1;
    }
}

void RepositPosInvador(){
  if(!(invadros.get(0).pos.y > height / 2 - 50))return;
  for(Invador invador : invadros){
    invador.pos.y = -height / 2;
  }
}


void setup(){
  size(800,800);
  invador_animation[0] = loadImage("invader_1.bmp");
  invador_animation[1] = loadImage("invader_2.bmp");

  for(int i = 0; i < 10; i++){
    invadros.add(new Invador(-200 + 50 * i, -height / 2)); 
  }
}

void draw(){
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
  for(int i = 0; i < player_bullets.size(); i++){
    if(player_bullets.get(i).remove()){
      player_bullets.remove(i);
    }
  }
  
  rect(player_x, player_y, player_width, player_height);  
}
