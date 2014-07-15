float[] colorcount = new float[3];
int imagecount = 0;
void setup()
{
  size(1000, 800);
  smooth();
  for(int i = 0; i < colorcount.length; i++){
    colorcount[i] = random(0, 255);
  }
}
void draw()
{
  PImage fish = loadImage("6136212.jpg");
  PImage fish1 = fish.get(0,0, 150, 112);
  translate(0,0);
  image(fish1, 500, 0);
  for(int i = 0; i < colorcount.length; i++){
    if(colorcount[i] == 256){
      colorcount[i] = 0;
    }
  }
  fill(colorcount[0], colorcount[1],colorcount[2]);
  for(int i = 0; i < colorcount.length; i++){
  colorcount[i]++;
  }    
  for(int i = 0; i < 50; i+= 7){
    for(int j = 0; j < 50; j+= 10){
      ellipse(100 + j, 100 + i, 15, 30);
    }
  }
}
