   //Thanks to button class in processing's library!!!
   //buttons
  int defaultX, defaultY;      // Position of square button
  int createX, createY;
  int rectWidth = 250;       // size of the rectangle buttons
  int rectHeight = 90;   
  boolean hasChosen = false;
  boolean choseDefault;
  boolean choseCreate;
  boolean option1;
  boolean option2;
  //Aquarium stuff
  float pH; //healthy is 8.0 - 8.4
  int fishPop;
  int plantPop;
  int liva; //0 - 10 livability, everything dies at 0
  ArrayList<Fish> lof;
  PImage bg;
  
  public void setup(){
  size(1000, 625);
  bg = loadImage("ocean.jpg"); 
  //coordinates of the rectangle
  defaultX = width/2-rectWidth/2;
  defaultY = height/2-rectHeight-10;
  createX = width/2-rectWidth/2;
  createY = height/2+10;
  lof = new ArrayList<Fish>();
  }
  
 public void draw(){
   update();
   background(bg);
   fill (255); 
   rect( defaultX, defaultY, rectWidth, rectHeight); 
   rect( createX, createY, rectWidth, rectHeight); 
   fill(0);
   text("Default", defaultX+30, defaultY+65);
   textSize(55);
   text("Create", createX+35, createY+65);
   //this is what's shown after choosing an option
   if (option1 || option2) {
      noStroke();
      noFill();
      rect( defaultX, defaultY, rectWidth, rectHeight);
      background(bg);
      if(option1){
        fill (255); 
        rect(0,0, 1000, 25);
        fill(0);
        textSize(15);
        text("Fish Population: " + fishPop, 10, 20);
      }
   }
   for(Fish a : lof){
    a.xcoor += Math.random() * 2;
    a.ycoor += Math.random() - .5 ;
    if(a.xcoor > 1000){
      a.xcoor = 0;
    }
    if(a.ycoor < 50){
      a.ycoor = 50;
    }
    if(a.ycoor > 625){
      a.ycoor = 625;
    }
    a.display();
    }
    if(pH < 8 || pH > 8.4){
      lof.remove(random(lof.size()));
  }
 }
 
 void mousePressed() {
   if(hasChosen){
      lof.add(new Fish(mouseX, mouseY, 10.0 + (float)(Math.random()*45)));
      fishPop += 1;
   }
  else if (choseDefault) {
    option1 = true;
    hasChosen = true;
    for(int i = 0; i < 10; i++){
      addRandomFish();
    }
  }
  else if(choseCreate){
    option2 = true;
    hasChosen = true;
  }
}

//determines if user has chosen an option
 void update() {
   if ( overRect(defaultX, defaultY, rectWidth, rectHeight) ) {
    choseDefault = true;
   }
   else if( overRect(createX, createY, rectWidth, rectHeight) ){
     choseCreate = true;
   }
 }
 
 //determine if mouseClick is over a particular rectangle
 boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
 }
 
 void addRandomFish(){
   fishPop += 1;
   lof.add(new Fish((float)(Math.random()*1000), (float)(Math.random()*625), 10.0 + (float)(Math.random()*45) ));
 }
 
 //better function
   void addDefaultFish(){
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
    lof.add(new Fish(920, 106, 50));
  }