ArrayList<CQuadPlane>planes;
float rotate;

void setup(){
  size(800,800,P3D);
  background(255);
    hint(ENABLE_DEPTH_SORT);
  planes = new ArrayList<CQuadPlane>();
  float x = -50,y = -50;
  planes.add(new CQuadPlane(x,y,abs(x*2),abs(y*2),0,color(255,0,0,50)));
  planes.add(new CQuadPlane(x,y,abs(x*2),abs(y*2),PI/5,color(0,255,0,50)));
  planes.add(new CQuadPlane(x,y,abs(x*2),abs(y*2),PI*2/5,color(0,0,255,50)));
  
  translate(width/2,height/2,0);

  rotate = 0;
  
  colorMode(RGB,256);
}

void update(){
  for(CQuadPlane Planes : planes){
    Planes.update();
  }
  rotate += PI/180;
}

void draw(){
  update();
  background(255);
  
  rotateY(rotate);
  
  for(CQuadPlane Planes : planes){
    Planes.draw();
  }
  
  camera(
  0,mouseY,200,
  0,0,0,
  0,1,0
  );
  
  translate(width/2,height/2,0);
}
