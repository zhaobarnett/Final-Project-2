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
  lof = new ArrayList<Fish>();
  pH = 8.0;
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
    a.xcoor += Math.random() * 2;
    a.ycoor += Math.random() - .5 ;
    if(a.xcoor > 1000){
      a.xcoor = 0;
    }
    if(a.ycoor < 0){
      a.ycoor = 0;
    }
    if(a.ycoor > 800){
      a.ycoor = 800;
    }
    a.display();
    }
    if(pH < 8 || pH > 8.4){
      lof.remove(random(lof.size()));
  }
 // for(Fish a : lof){
  //  a.display();
   // a.xcoor += 1;
   // a.ycoor += random(5.5) - 2.75;
   // } 
 }
 void mousePressed() {
  if (rectOver) {
    def = true;
    addFish();
  }
  else{
   int s = lof.size();
  lof.add(new Fish(mouseX, mouseY, (float)(Math.random() * 50)));
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
    fishPop = 15;
    lof.add(new Fish(500, 500, 100));
    lof.add(new Fish(150, 300, 15));
    lof.add(new Fish(100, 10, 10));
    lof.add(new Fish(20, 40, 40));
    lof.add(new Fish(600, 400, 15));
    lof.add(new Fish(600, 600, 5));
    lof.add(new Fish(800, 500, 15));
    lof.add(new Fish(100, 160, 30));
    lof.add(new Fish(260, 640, 20));
    lof.add(new Fish(120, 406, 5));
    lof.add(new Fish(900, 200, 15));
    lof.add(new Fish(890, 500, 25));
    lof.add(new Fish(900, 460, 20));
    lof.add(new Fish(60, 340, 7));
    lof.add(new Fish(920, 106, 15));
  }