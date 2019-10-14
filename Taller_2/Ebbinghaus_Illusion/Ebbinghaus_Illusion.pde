color blue = color(0,0,256);
color value;
void setup()
{
  size(1000, 600);
  background(250);
  value = blue;
}

void draw()
{
  noStroke();
  fill(value);
  circle(200, 100, 150);
  circle(400, 100, 150);
  circle(500, 300, 150);
  circle(100, 300, 150);
  circle(200, 500, 150);
  circle(400, 500, 150);
  
  fill(255,0,0);  
  circle(300, 300, 90);
  
  fill(value);
  circle(750, 245, 40);
  circle(800, 230, 40);
  circle(850, 245, 40);
  circle(870, 300, 40);
  circle(850, 355, 40);
  circle(800, 370, 40);
  circle(750, 355, 40);
  circle(730, 300, 40);
  
  fill(255,0,0);  
  circle(800, 300, 90);
}

void mouseClicked(){
  if (value == blue) {
    value = 250;
  } else {
    value = blue;
  }
}
