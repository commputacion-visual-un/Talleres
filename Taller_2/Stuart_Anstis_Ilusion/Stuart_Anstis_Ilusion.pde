float move;
int s;
int step;

void setup() {
  size(600, 400);
  move = width/2;
  s = 1;
  step = 15;                         // Line spacing
}

void draw() {
  background(256,256,256);      // White background
  
  if (mousePressed == false) {       //horizontal lines
    strokeWeight(15);                // weight lines 
    stroke(0, 0, 0);                 // black lines
    for (int i = 0; i <= width; i = i + 1){
      if (i%2==1){
        line(i*step, 0, i*step, height);
      }
    }
  }
  noStroke();                      // Rectangles
  fill(0,0,130);               // Blue one
  rect(move, 200, 65, 30);
  fill(256,256,0);             // Yellow one
  rect(move, 100, 65, 30);
  move = move + s*0.90;            // Movement increment
  if (move>(width-70)){
    s = -1;
  }
  if (move<0){
    s = +1;
  }
 
}
