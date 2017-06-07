ArrayList<Fish> lof;

public void setup(){
  size(800, 600);
  lof = new ArrayList<Fish>();
  lof.add( new Fish(width/3 * 2, height/2, 100));
  lof.add( new Fish(width/3, height/2, 100));  
}

public void draw(){
  background(200);
  for(Fish a : lof){
    a.display();
    a.xcoor += 1;
    a.ycoor += random(5.5) - 2.75;
  }
}