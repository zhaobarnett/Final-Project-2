import java.util.*;
import java.lang.*;

  float pH; //healthy is 8.0 - 8.4
  int fishPop;
  int plantPop;
  int liva; //0 - 10 livability, everything dies at 0

  Aqua(){
    this(10, 3);
  } 
  Aqua(int fPop, int pPop){
    //set Ph and initial fish and plant population
    pH = 8.0;
    fishPop = fPop;
    for (int i = 0; i < fPop; i++){
      addFish();
    }
    plantPop = pPop; 
    for (int i = 0; i < pPop; i++){
      growPlant();
    }
  }
  
  void addFish(){
    float xCoor = (float)(Math.random() * 900);
    float yCoor = (float)(Math.random() * 700);
    float si = (float)(Math.random() * 10);
    Fish x = new Fish(xCoor, yCoor, si);
  }
  
  void growPlant(){
    int xCoor = (int)(Math.random() * 900);
    int yCoor = (int)(Math.random() * 700);
    int si = (int)(Math.random() * 10);
    Plant x = new Plant(xCoor, yCoor, si);
  }
}
