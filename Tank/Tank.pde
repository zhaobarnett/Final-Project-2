  //Thanks to button class in processing's library!!!
  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  //Aquarium stuff
  float pH; //healthy is 8.0 - 8.4
  int fishPop;
  int plantPop;
  int liva; //0 - 10 livability, everything dies at 0
  boolean def;
  ArrayList<Fish> lof;
  PImage bg;
  
  public void setup(){
  size(1000, 625);
  bg = loadImage("ocean.jpg"); 
  rectColor = color(0);
  rectHighlight = color(51);
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  pH = 8.0;
  if (def){
    fishPop = 10;
    for (int i = 0; i < fishPop; i++){
       addFish();
    }
  }
  plantPop = 5; 
    for (int i = 0; i < plantPop; i++){
       growPlant();
    }
  }
  
 public void draw(){
   update(mouseX, mouseY);
   background(bg);
   fill (255); 
   rect( rectX, rectY, 250, rectSize); 
   fill(0);
   text("DEFAULT", 400, rectY + 63);
   textSize(57);   
   if (def) {
      noStroke();
      noFill();
      rect( rectX, rectY, 250, rectSize);
      background(bg);
   }
   for(Fish a : lof){
    a.display();
    a.xcoor += 1;
    a.ycoor += random(5.5) - 2.75;
    } 
 }
 void mousePressed() {
  if (rectOver) {
    def = true;
  }
}
 void update(int x, int y) {
   if ( overRect(rectX, rectY, 250, rectSize) ) {
    rectOver = true;
   }
   else{
     rectOver = false;
   }
 }
 boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
 }
   void addFish(){
    float xCoor = (float)(Math.random() * 900);
    float yCoor = (float)(Math.random() * 600);
    float si = (float)(Math.random() * 10);
    Fish x = new Fish(xCoor, yCoor, si);
    x.draw();
  }
 void growPlant(){
    int xCoor = (int)(Math.random() * 900);
    int yCoor = (int)(Math.random() * 600);
    int si = (int)(Math.random() * 10);
    Plant x = new Plant(xCoor, yCoor, si);
 } 
 