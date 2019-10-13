PImage img, img2;
int moment;

void setup()
{
  size(600, 600);
  img = loadImage("un.png");
  img2 = loadImage("un-negative.png");
  img.resize(600,600);
  img2.resize(600,600);
  img.filter(GRAY);
  frameRate(1);
  moment = 0;
}

void draw()
{
  textSize(25);
  image(img2,0,0);
  moment++;
  if(moment > 20)
  {
    image(img,0,0);
    fill(050,250,50);
    text("Esta imagen es a blanco y negro,",115,535);
    text("¿ve color en el pasto y los edificios?",110,560);
    if(moment > 30)
    {
      moment = 0;
    }
  }
  else
  {
    fill(255);
    text("Mire fijamente el punto negro al centro ",85,60);
    text("de la imagen hasta que cambie la imagen",80,85);
  }
  updatePixels();
}
