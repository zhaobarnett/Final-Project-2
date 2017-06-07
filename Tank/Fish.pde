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
    float si = (float)(Math.random() * 10);
    Fish x = new Fish(xCoor, yCoor, si);
    retVal.add(x);
    return retVal;
  }
  
  public void display(){
    stroke(0);
    fill(255);
    ellipse(xcoor, ycoor, size, size);
    triangle(xcoor, ycoor, xcoor+1, ycoor+1, xcoor-1, ycoor-1);
  }
  
}