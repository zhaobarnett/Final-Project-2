class Fish{
  //global variables
  int ID;
  int w;
  int h;
  int color;
  boolean isAlive;
  float size;
  float xcoor;
  float ycoor;
  
  Fish(float xcoor, float ycoor, float size){
    this.xcoor = xcoor;
    this.ycoor = ycoor;
    this.size = size;
  }
  
  public void display(){
    ellipse(xcoor, ycoor, size, size);
    triangle();
  }
  
}