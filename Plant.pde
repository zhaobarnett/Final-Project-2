int ID;
boolean isAlive;
float size;
float xcoor;
float ycoor;
float colorR;
float colorG;

void setup() {
  size(600, 600);
  colorR = random(256);
  colorG = random(356);
  background(255);
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(600, 600, 500, 600, 500, 500, 560, 520);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256);
  colorG = random(356);
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(500, 600, 400, 600, 500, 350, 460, 420);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256);
  colorG = random(356);
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(400, 600, 300, 600, 280, 350, 300, 320);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256);
  colorG = random(356);
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(100, 600, 200, 600, 200, 270, 260, 280);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256)+ 10;
  colorG = random(356)+ 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(50, 600, 40, 600, 130, 500, 135, 142);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256);
  colorG = random(356);
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(20, 600, 20, 600, 100, 450, 160, 120);
  noStroke();
  fill(colorR, colorG, 0);  
  colorR = random(256) + 10;
  colorG = random(356) + 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(500, 600, 400, 600, 300, 450, 460, 420);
  noStroke();
  fill(colorR, colorG, 0);  
  colorR = random(256) + 10;
  colorG = random(356) + 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(500, 600, 140, 600, 300, 450, 460, 420);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256)+ 10;
  colorG = random(356)+ 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(25, 600, 200, 600, 130, 145, 246, 350);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256) + 10;
  colorG = random(356) + 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(500, 600, 400, 600, 300, 450, 460, 420);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256) + 10;
  colorG = random(356) + 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(600, 600, 600, 600, 530, 445, 160, 100);
  noStroke();
  fill(colorR, colorG, 0);
  colorR = random(256) + 10;
  colorG = random(356) + 10;
  smooth();
  stroke(colorR, colorG, 0);
  strokeWeight(50); 
  curve(100, 100, 250, 600, 150, 250, 500, 420);
  noStroke();
  fill(colorR, colorG, 0);
  
  // Use the array to keep the code shorter;
  // you already know how to draw ellipses!
  fill(255, 0, 0);
  noStroke();
}


/*void setup(){
    //this.xcoor = xcoor;
    //this.ycoor = ycoor;
    //this.size = size;
    size(600,600);
    background(255);
    colorR = random(256);
    colorG = random(356);
}
public void display(){
    stroke(0);
    fill(colorR, colorG, 0);
    beginShape();
    curveVertex(40, 40); // the first control point
    curveVertex(40, 40); // is also the start point of curve
    curveVertex(80, 60);
    curveVertex(100, 100);
    curveVertex(60, 120);
    curveVertex(50, 150); // the last point of curve
    curveVertex(50, 150); // is also the last control point
    endShape();

  }*/
