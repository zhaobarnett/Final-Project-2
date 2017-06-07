ArrayList<Fish> lof;
Aqua ium;
  
  public void setup(){
    size(1000, 800);
    background(255);
    ium = new Aqua();
    lof = new ArrayList<Fish>();
    lof.add(new Fish(10, 10, 10));
  }
  
  public void draw(){
  background(200);
  for(Fish a : lof){
    a.display();
    a.xcoor += 1;
    a.ycoor += random(5.5) - 2.75;
    } 
  }
  
  void mousePressed() {
  int s = lof.size();
  for ( Fish next : lof.toArray(new Fish[0])) {
    for (Fish newFish : next.addFish()) {
      lof.add(newFish);
    }
  }
  while (s>0) {
    lof.remove(0);
    s--;
  }
}