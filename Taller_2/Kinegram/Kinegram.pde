PImage img;
int iniX;
boolean right;

void setup()
{
  size(686, 276);
  img = loadImage("kinegram.PNG");
  iniX = 20;
  right = true;
}

void draw()
{
  image(img,0,0);
  grid(iniX);
  if(right)
  {
    iniX+=1;
  }
  else
  {
    iniX-=1;
  }
  if(iniX>=650)
  {
    right = false;
  }
  if(iniX<=19)
  {
    right = true;
  }
}

void grid(int initialX)
{
  int x = initialX;
  strokeWeight(10);
  for(int i = 0;i<70;i++)
  {
    line(x, 0, x, 276);
    x+=12;
  }
}
