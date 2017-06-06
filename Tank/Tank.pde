ArrayList<Fish> lof;
Aqua ium;
  
  public void setup(){
    size(1000, 800);
    background(255);
    ium = new Aqua();
    ium.addFish();
  }
  
  public void draw(){
  background(200);
  for(Fish a : lof){
    a.display();
    a.xcoor += 1;
    a.ycoor += random(5.5) - 2.75;
    } 
  }
