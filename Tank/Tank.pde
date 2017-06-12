import controlP5.*;
import static javax.swing.JOptionPane.*;

   
   //Thanks to button class in processing's library!!!
   //buttons
  int defaultX, defaultY;      // Position of square button
  int createX, createY;
  int pHX, pHY;
  int rectWidth = 250;       // size of the rectangle buttons
  int rectHeight = 90;   
  int inputs;
  int hold;  
  int pHWdith = 60;
  int phHeight = 26;
  boolean pHS;
  boolean filled;
  boolean hasChosen;
  boolean choseDefault;
  boolean choseCreate;
  boolean infoBox;
  boolean option1;
  boolean option2;
  boolean start;
  boolean editPh;
  PImage bg;
  //slides and text fields stuff
  ControlP5 cp5;
  //Aquarium stuff
  float pH; //healthy is 8.0 - 8.4
  int fishPop;
  ArrayList<Fish> lof;
  float temp;
  float sunlight;
  int liva = 10; //0 - 10 livability, everything dies at 0
  int counter = 0;
  int livaCounter = 0;
  
  public void setup(){
  size(1000, 625);
  bg = loadImage("ocean.jpg"); 
  cp5 = new ControlP5(this);
  //coordinates of the rectangle
  defaultX = width/2-rectWidth/2;
  defaultY = height/2-rectHeight-10;
  createX = width/2-rectWidth/2;
  createY = height/2+10;
  pH = 8;
  pHS = false;
  pHX = 500;
  pHY = 0;
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
        text("Fish Population: " + fishPop, 100, 20);
        textSize(15);
        text("pH level: " + pH, 600, 20);
        rect(pHX, pHY, pHWdith, phHeight);
        fill(15);
        textSize(15);
        text("choose the pH level:", 350, 20);
      }
      if (option2 && (!start)){
        fill (255); 
        rect(0,0, 1000, 25);
        fill(0);
        textSize(15);
        text("Fish Population: " + hold, 10, 20);
        textSize(15);
        text("pH level: " + pH, 600, 20);
        rect(pHX, pHY, pHWdith, phHeight);
        fill(15);
        textSize(15);
        text("choose the pH level:", 350, 20);
        inputs -= 1;
        while(inputs > -1){
           addRandomFish(); 
           inputs--;
        }
      }
      if(option2 && start){
        inputs = 0;
        while(inputs == 0){
          final String id = showInputDialog("Please enter how much fish you want to start off with");          
          try{
          inputs = Integer.parseInt(id);
          hold = inputs;
          }
        catch(NumberFormatException e){
          javax.swing.JOptionPane.showMessageDialog(null, "Enter a valid number please");
        }
        }
        start = false;
      }
      if (pHS){
        pHS = false;
        final String it = showInputDialog("Please enter a number from 0 to 10");
        try{
          pH = Integer.parseInt(it);
          pHS = false;
        }         
        catch(NumberFormatException e){};
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
    if(hasChosen && option1){
      if(counter == 10){
      addRandomFish();
      counter = 0;
    }
    counter++;
    }
     determineLivability();
    if(livaCounter == liva){
      if(lof.size() > 0){
      lof.remove(0);
      fishPop--;
      hold--;
      }
      livaCounter = 0;
    }
    livaCounter++;
    liva = 12;
 }
 
 void determineLivability(){
   if(fishPop > 20){
     liva--;
   }
   else if(fishPop > 40){
     liva--;
   }
   else if(fishPop > 60){
     liva--;
   }
   else if(fishPop > 80){
     if(lof.size() > 0){
      lof.remove(0);
      fishPop--;
      hold--;
   }
   }
   else if(pH < 7.5 || pH > 8.4){
     liva--;
   }
   else if(pH < 7.0 || pH > 8.9){
     liva--;
   }
   else if(pH < 6.0 || pH > 9.9){
     liva--;
   }
   else if(pH < 3.0){
     if(lof.size() > 0){
      lof.remove(0);
      fishPop--;
      hold--;
      lof.remove(0);
      fishPop--;
      hold--;
      lof.remove(0);
      fishPop--;
      hold--;
      lof.remove(0);
      fishPop--;
      hold--;
   }
   }
   /*
   else if(temp < 72 || temp > 80){
     liva--;
   }
   else if(temp < 70 || temp > 88){
     liva--;
   }
   else if(sunlight < 75){
     liva--;
   }
   else if(sunlight < 50){
     liva--;
   }
   */
 }
 
 void mousePressed() {
 if(hasChosen){
        lof.add(new Fish(mouseX, mouseY, 10.0 + (float)(Math.random()*45)));
        fishPop += 1;
        hold += 1;
     }
  else if (choseDefault) {
    pH = 8.0;
    option1 = true;
    hasChosen = true;
    pHS = false;
    for(int i = 0; i < 10; i++){
      addRandomFish();
    }
  }
  else if(choseCreate){
    pH = 8.0;
    option2 = true;
    hasChosen = true;
    start = true;
    pHS = false;
  }
}

//determines if user has chosen an option
 void update() {
   if ( overRect(defaultX, defaultY, rectWidth, rectHeight) ) {
    choseDefault = true;
    pHS = false;
   }
   else if( overRect(createX, createY, rectWidth, rectHeight) ){
     choseCreate = true;
     pHS = false;
   }
   else if( overRect(pHX, pHY, pHWdith, phHeight) ){
     if(mousePressed){
       pHS = true;
     }
   }
   else{
     choseDefault = false;
     choseCreate = false;
     pHS = false;
   }
 }
 
 //determine if mousePressed is over a particular rectangle
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
   hold += 1;
   lof.add(new Fish((float)(Math.random()*1000), (float)(Math.random()*625), 10.0 + (float)(Math.random()*45) ));
 }
