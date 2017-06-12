import controlP5.*;
import static javax.swing.JOptionPane.*;

   
   //Thanks to button class in processing's library!!!
   //buttons
  int defaultX, defaultY;      // Position of square button
  int createX, createY;
  int rectWidth = 250;       // size of the rectangle buttons
  int rectHeight = 90;   
  int inputs;
  int hold;
  boolean filled;
  boolean hasChosen;
  boolean choseDefault;
  boolean choseCreate;
  boolean infoBox;
  boolean option1;
  boolean option2;
  boolean start;
 
  //slides and text fields stuff
  ControlP5 cp5;
  Slider pHSlider;
  //Aquarium stuff
  float pH; //healthy is 8.0 - 8.4
  int fishPop;
  int plantPop;
  int liva; //0 - 10 livability, everything dies at 0
  ArrayList<Fish> lof;
  PImage bg;
  int counter;
  
  public void setup(){
  size(1000, 625);
  bg = loadImage("ocean.jpg"); 
  cp5 = new ControlP5(this);
  //coordinates of the rectangle
  defaultX = width/2-rectWidth/2;
  defaultY = height/2-rectHeight-10;
  createX = width/2-rectWidth/2;
  createY = height/2+10;
  lof = new ArrayList<Fish>();
          pHSlider = new Slider(cp5, "pH levels");
        pHSlider.setPosition(350.0, 10.0);
        pHSlider.setMin(6.0);
        pHSlider.setMax(9.0);
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
        textSize(15);
        text("pH level: " + pH, 200, 20);

      }
      if (option2 && (!start)){
        fill (255); 
        rect(0,0, 1000, 25);
        fill(0);
        textSize(15);
        text("Fish Population: " + hold, 10, 20);
        textSize(15);
        text("pH level: " + pH, 200, 20);
        inputs -= 1;
        while(inputs > -1){
           addRandomFish(); 
           inputs--;
         }
      }
      if(option2 && start){
        inputs = 0;
        while(inputs == 0){
          final String id = showInputDialog("Please enter how much fish you want to start off with");          try{
          inputs = Integer.parseInt(id);
          hold = inputs;
          }
        catch(NumberFormatException e){
          javax.swing.JOptionPane.showMessageDialog(null, "Enter a valid number please");
        }
        }
        pHSlider = new Slider(cp5, "pH levels");
        pHSlider.setPosition(350.0, 10.0);
        pHSlider.setMin(6.0);
        pHSlider.setMax(9.0);
        pH = pHSlider.getValue();
        start = false;
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
        pHSlider = new Slider(cp5, "pH levels");
        pHSlider.setPosition(350.0, 10.0);
        pHSlider.setMin(6.0);
        pHSlider.setMax(9.0);
        pH = pHSlider.getValue();
            if(counter == 10){
      addRandomFish();
      counter = 0;
    }
    counter++;
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
    pH = 8.0;
  }
  else if(choseCreate){
    option2 = true;
    hasChosen = true;
    start = true;
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
   else{
     choseDefault = false;
     choseCreate = false;
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
   lof.add(new Fish((float)(Math.random()*1000), (float)(Math.random()*625), 10.0 + (float)(Math.random()*45) ));
 }
