class Point{
  float x,y,r;
  
  Point(float x_, float y_, float r_){
    x = x_;
    y = y_;
    r = r_;
  }
  
  
  void show() {
    noStroke();
    fill(255,0,0);
    ellipse(x,y,r,r);
  }
  
  
}
