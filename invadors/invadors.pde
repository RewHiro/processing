float y = 0;
PImage[] invador_animation = new PImage[2];
int anime = 0;
int frame_count = 0;
float speed = 2;
float size = 50;

class Invador{
  float x = 0;
  Invador(float x){
    this.x = x;
  }
  
  void update(){
    x += speed;
  }
  
  void draw(){
    image(invador_animation[anime],x,y,size,size);
  }
};

ArrayList<Invador> invadros = new ArrayList<Invador>();

void setup(){
  size(800,800);
  invador_animation[0] = loadImage("invader_1.bmp");
  invador_animation[1] = loadImage("invader_2.bmp");

  for(int i = 0; i < 10; i++){
    invadros.add(new Invador(-200 + 50 * i));
  }
}

void draw(){
  translate(width/2,height/2);
  background(255);
  frame_count++;
  anime = frame_count / 60 % 2;
   
  for(Invador invador : invadros){
    invador.update();
    invador.draw();
  }
  
  if( invadros.get(9).x + size >width/2 ||
        invadros.get(0).x < -width /2){
      y += 50;
      speed *= -1;
  }
  if(y > height/2 -50){
    y = 0;
  }
}
