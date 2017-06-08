class Plant{
int ID;
int w;
int h;
boolean isAlive;
float size;
float xcoor;
float ycoor;

public Plant(float xcoor, float ycoor, float size){
    this.xcoor = xcoor;
    this.ycoor = ycoor;
    this.size = size;
}
public void display(){
    stroke(0);
    fill(255);

  }
}