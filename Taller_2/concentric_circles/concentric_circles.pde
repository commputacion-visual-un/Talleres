PImage img, img2;

void setup()
{
  size(650, 585);
  img = loadImage("imagen.png");
  img2 = loadImage("imagen2.png");
}

void draw()
{
  image(img2,0,0);
  if (mousePressed == false) {       //concentric circles
    image(img,0,0);
  }
  updatePixels();
}
