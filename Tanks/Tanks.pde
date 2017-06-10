ArrayList<Fish> lof;
Aqua ium;
//<<<<<<< HEAD
//float screenW = 1000;
//float screenH = 800;
//=======
//float screenW = 1000;
//float screenH = 800;
//>>>>>>> fishClass
  
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
    a.xcoor += Math.random() * 2;
    a.ycoor += Math.random() - .5;
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
    if(ium.pH < 8 || ium.pH > 8.4){
      lof.remove(random(lof.size()));
    }
  }
  
  void mousePressed() {
  int s = lof.size();
  lof.add(new Fish(mouseX, mouseY, (float)(Math.random() * 50)));
  }