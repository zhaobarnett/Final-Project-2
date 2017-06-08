ArrayList<Fish> lof;
Aqua ium;
float screenW = 1000;
float screenH = 800;
  
  public void setup(){
    size(1000, 800);
    //background(0,0,100);
    ium = new Aqua();
    lof = new ArrayList<Fish>();
    lof.add(new Fish(10, 10, 10));
  }
  
  public void draw(){
  background(0,100,200);
  for(Fish a : lof){
    a.xcoor += 1;
    a.ycoor += random(2.25) - 1.375;
    if(a.xcoor > screenH){
      a.xcoor = 0;
    }
    if(a.ycoor < 0){
      a.ycoor = 0;
    }
    a.display();
    }
    if(ium.pH < 8 || ium.pH > 8.4){
      lof.remove(random(lof.size()));
    }
  }
  
  void mousePressed() {
  int s = lof.size();
  for ( Fish next : lof.toArray(new Fish[0])) {
    for (Fish newFish : next.addFish()) {
      lof.add(newFish);
    }
  }
//  while (s>0) {
  //  lof.remove(0);
    //s--;
  //}
}