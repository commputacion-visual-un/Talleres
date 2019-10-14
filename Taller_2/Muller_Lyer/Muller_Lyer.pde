//Code inspire from: https://www.openprocessing.org/sketch/452004
void setup() {
  size(600, 650);
  background(255);

}

void draw() {
  stroke (0,0,0);
  line(100,100,500,100); //First line
  line (100,300,500,300);//Second line
  line (100,500,500,500);//Third line
  //First line arrows
  line (100,100,150,50);
  line (100,100,150,150);
  line (500,100,450,50);
  line (500,100,450,150);  
  //Second line arrows
  line (50,250,100,300);
  line (50,350,100,300);
  line (550,250,500,300);
  line (550,350,500,300); 
  //Third line arrows
  line (100,500,150,450);
  line (100,500,150,550);
  line (500,500,550,450);
  line (500,500,550,550);  
  
  //border lines
  stroke (0,0,255);
  if (mouseX>500)
    stroke (255,255,255);
    line (100,0,100,650);
    line (500,0,500,650); 
  if (mouseX<500)
    line (100,0,100,650);
    line (500,0,500,650);
}
