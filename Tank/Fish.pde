class Fish{
  int ID;
  int w;
  int h;
  boolean isAlive;
  float size;
  float xcoor;
  float ycoor;
  
  Fish(float xcoor, float ycoor, float size){
    this.xcoor = xcoor;
    this.ycoor = ycoor;
    this.size = size;
  }
 
  void draw(){
    stroke(153);
    fill(255);
    ellipse(xcoor, ycoor, size, size);
    triangle(xcoor, ycoor, xcoor+1, ycoor+1, xcoor-1, ycoor-1);
  }
}
 