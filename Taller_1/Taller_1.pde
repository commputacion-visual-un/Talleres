PGraphics pg, pg1;
PImage img, img2;
int[] hist;
int max, min;
boolean selectMin;

void setup()
{
  size(900, 900);
  pg = createGraphics(400, 400);
  pg1 = createGraphics(400, 400);
  img = loadImage("imagen.jpg");
  img.resize(400, 400);
  img2 = loadImage("imagen.jpg");
  img2.resize(400, 400);
  //img2.filter(GRAY);
  selectMin = true;
  max = 256;
  min = 0;
  hist = new int[256];
  calculateHistogram(img);
}

void calculateHistogram(PImage img)
{
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(img.get(i, j)));
      hist[bright]++;
    }
  }
}

void histogram(PGraphics pg)
{
  // Find the largest value in the histogram
  int histMax = max(hist);
  pg.stroke(255);
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < pg.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, pg.width, 0, 255));
    // Convert the histogram value to a location between
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, pg.height, 0));
    if (which == min)
    {
      pg.stroke(200, 100, 50);
    } else if (which == max)
    {
      pg.stroke(50, 100, 200);
    } else
    {
      pg.stroke(255);
    }
    pg.line(i, pg.height, i, y);
  }
}

void dibujar(PImage img, PImage img2, PGraphics pg) {
  //pg.filter(GRAY);
  img2 = loadImage("imagen.jpg");
  img2.resize(400, 400);
  img.loadPixels();

  for (int i = 0; i < img.width * img.height; i++) {
    color c= color(img.pixels[i]);
    // RGB Method
    float R = red(c);
    float G = green(c);
    float B = blue(c);
    float Br = int((R+G+B)/3);
    // HSB Method
    /*colorMode(HSB,100);
     float H = hue(c);
     float S = saturation(c);
     float Br = brightness(c);*/
    if (min <= Br && Br <= max)
    {
      img2.pixels[i] = color(Br);
    } else
    {
      img2.pixels[i] = color(0);
    }
  }
  
  pg.image(img2, 0, 0);
}

void draw()
{
  pg.beginDraw();
  pg.image(img, 0, 0);
  pg.endDraw();

  pg1.beginDraw();
  dibujar(img, img2, pg1);
  histogram(pg1);
  pg1.endDraw();

  image(pg, 15, 15);
  image(pg1, 425, 15);
}

void mouseClicked() {
  if (mouseX > 425 && mouseX < 825)
  {
    if (mouseY > 15 && mouseY < 415)
    {
      int x = mouseX - 425;
      int m = int(map(x, 0, pg1.width, 0, 255));

      if (selectMin)
      {
        if (m < max)
        {
          min = m;
          selectMin = false;
        } else
        {
          max = m;
        }
        selectMin = false;
      } else
      {
        if (m > min)
        {
          max = m;
          selectMin = true;
        } else
        {
          min = m;
        }
      }
    }
  }
}
