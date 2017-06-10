class Fish{
  //global variables
  int ID;
  boolean isAlive;
  float size;
  float xcoor;
  float ycoor;
  float colorR;
  float colorG;
  float colorB;
  
  Fish(float xcoor, float ycoor, float size){
    this.xcoor = xcoor;
    this.ycoor = ycoor;
    this.size = size;
    colorR = random(256);
    colorG = random(256);
    colorB = random(256);
  }
 
  void display(){
    stroke(0);
    fill(colorR, colorG, colorB);
    ellipse(xcoor, ycoor, size*1.5, size);
    triangle(xcoor-size, ycoor+size*.4, xcoor-size*.7, ycoor, xcoor-size, ycoor-size*.4);
    fill(0);
    ellipse(xcoor+size*.5, ycoor-size*.15, size*.1, size*.1);
  }
}
 