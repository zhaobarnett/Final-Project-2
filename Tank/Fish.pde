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
  
  ArrayList<Fish> addFish(){
    ArrayList<Fish> retVal = new ArrayList<Fish>();
    float xCoor = (float)(Math.random() * 1000);
    float yCoor = (float)(Math.random() * 800);
    float si = (float)(Math.random() * 50);
    Fish x = new Fish(xCoor, yCoor, si);
    retVal.add(x);
    return retVal;
  }
  
  public void display(){
    stroke(0);
    fill(colorR, colorG, colorB);
    ellipse(xcoor, ycoor, size*1.5, size);
    triangle(xcoor-size, ycoor+size*.4, xcoor-size*.7, ycoor, xcoor-size, ycoor-size*.4);
    fill(0);
    ellipse(xcoor+size*.5, ycoor-size*.15, size*.1, size*.1);
  }
  
}
 
