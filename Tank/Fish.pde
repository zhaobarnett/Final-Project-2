class Fish{
  //global variables
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
  
  ArrayList<Fish> addFish(){
    ArrayList<Fish> retVal = new ArrayList<Fish>();
    float xCoor = (float)(Math.random() * 900);
    float yCoor = (float)(Math.random() * 700);
    float si = (float)(Math.random() * 50);
    Fish x = new Fish(xCoor, yCoor, si);
    retVal.add(x);
    return retVal;
  }
  
  public void display(){
    stroke(0);
    fill(255);
    ellipse(xcoor, ycoor, size*1.5, size);
    ellipse(xcoor+size*.5, ycoor-size*.15, size*.1, size*.1);
    triangle(xcoor-size, ycoor+size*.4, xcoor-size*.7, ycoor, xcoor-size, ycoor-size*.4);
  }
  
}