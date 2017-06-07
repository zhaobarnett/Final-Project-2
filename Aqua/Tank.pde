class Tank{

  ArrayList<Fish> lof;
  
  public void setup(){
    size(1000, 800);
    background(255);
    ium = new Aquas();
  }
  
  public void draw(){
  background(200);
  for(Fish a : lof){
    a.display();
    a.xcoor += 1;
    a.ycoor += random(5.5) - 2.75;
    } 
  }
  
  
}