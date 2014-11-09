class CQuadPlane{
  float m_pos_x,m_pos_y;
  float m_size_x,m_size_y;
  float m_angle_x;
  color m_color;
  CQuadPlane(float pos_x,float pos_y,
  float size_x,float size_y,float start_angle_x,
  color paint){
    m_pos_x = pos_x;
    m_pos_y = pos_y;
    m_size_x = size_x;
    m_size_y = size_y;
    m_angle_x = start_angle_x;
    m_color = paint;
  }
  
  void update(){
//    m_angle_x += PI/120;

  }
  
  void draw(){
    rotateY(m_angle_x);
    fill(m_color);
    rect(m_pos_x,m_pos_y,m_size_x,m_size_y);
  }
}
