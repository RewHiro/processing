/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 */
 
int xspacing = 10;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(1000, 800);
  smooth();
  w = width+10;
  dx = PI * 1.5;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(51, 204, 204);
  calcWave();
  renderWave();
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

