// Structure of the program inspired from a Scintillating grig code at http://www.openprocessing.org/sketch/26605

void setup() {
  size(498, 327);
}

void draw() {
  background(0);                   // black background
  int step = 25;                   // grid spacing
  
                               //horizontal lines
  strokeWeight(2);                 // medium weight lines 
  stroke(140, 140, 140);           // clear grey colour for lines
  for (int y = 1; y <= height; y = y + step){
    line(0, y, width, y); 
  }
  
                               //Checkerboard
  int h_rct = 21;                 // square size
  stroke(256, 256, 256);          // white cases
  float speed = 0;                // Variable speed depending on the line
  for (int i = 0; i < width; i = i + 1) {
    for (int j = 0; j < height; j = j + 1) {  
      if (i%2==1){
        if (j==0 || j==4 || j==8 || j==12){
          speed = 0;
        }
        if (j%2==1){
          speed = -0.15;
        }
        if (j==2 || j==6 || j==10){
          speed = -0.3;
        }
        rect(i*step + speed*mouseX, 3+j*step, h_rct, h_rct);
      }
    }
  }
 
  
}
