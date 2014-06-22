int xspacing = 10;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float x;
float y;
float x1;
float targetx;
float springForce;
float damping;
float stiffness;
float velocity;


void setup() {
  size(1000, 800);
  smooth();
  w = width+10;
  dx = PI * 1.5;
  yvalues = new float[w/xspacing];
  x = 100;
  y = 200;
  x1 = 100;
  stiffness = 0.1;
  damping = 0.9;
  velocity = 0.0;
  targetx = 100;
}

void fish()
{
  stroke(0);
  fill(116,169,214);
  triangle(x,y,-95 + x,-20 + y, -95 + x,20 + y);
  fill(67,135,233);
  ellipse(x,y,90,50);
  fill(0, 0, 0);
  ellipse(28 + x,-10 +y,5,5);
  strokeWeight(2);
  line(-90 + x,y, 50, 200);
  line(-90 + x,-10 + y, 50, 195);
  line(-90 + x,10 + y, 50, 205);
}

void fishspring(float x1)
{
    stroke(0);
    fill(116,169,214);
    triangle(x1,600,-95 + x1,-20 + 600, -95 + x1,20 + 600);
    fill(67,135,233);
    ellipse(x1,600,90,50);
    fill(0, 0, 0);
    ellipse(28 + x1,-10 +600,5,5);
    strokeWeight(2);
    line(-90 + x1,600, 50, 600);
    line(-90 + x1,-10 + 600, 50, 595);
    line(-90 + x1,10 + 600, 50, 605);    
}

void draw() {
  background(51, 204, 204);
  calcWave();
  renderWave();
  if(mousePressed == true && mouseButton == LEFT){
  x = mouseX;
  y = mouseY;
  fish();
  }
  else{
    if(x == 100 && y ==200){
      x = 100;
      y = 200;
    fish();
    }
    if(x > 100){
      x-=2;
      fish();      
    }
    else if(x < 100){
      x+=2;
      fish();
    }
    if(y > 200){
      y-=2;
      fish();     
    }
    else if(y < 200){
      y+=2;
      fish();
    }
  }
  if(mousePressed == true && mouseButton == RIGHT){
    targetx = mouseX;
    fishspring(targetx);
  }
  else{
    springForce = stiffness * (x1 - targetx);
    velocity = damping * (velocity + springForce);
    targetx += velocity;
    fishspring(targetx);
  }
}

// value of one circle
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += PI/2;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(radians(x))*amplitude;
    x+=dx;
  }
}

// draw wave
void renderWave() {
  noStroke();
  fill(51, 153, 102);
  // A simple way to draw the wave with an ellipse at each location
  for (int i = 0; i < yvalues.length; i++) {
    ellipse(i*xspacing, amplitude+yvalues[i], 10, 10);
    ellipse(i*xspacing, amplitude-yvalues[i], 10, 10);
    ellipse(i*xspacing, height - amplitude+yvalues[i], 10, 10);
    ellipse(i*xspacing, height - amplitude-yvalues[i], 10, 10);
  }
}
