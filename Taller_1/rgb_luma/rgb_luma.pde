PImage img;
PImage pg;

void setup() {
  size(500, 250);
  // Images must be in the "data" directory to load correctly
  img = loadImage("peniscola.jpg");
  img.resize(250,250);
  pg = loadImage("peniscola.jpg");
  pg.resize(250,250);
}

void draw() { 
  
  //pg.filter(GRAY);
  img.loadPixels();
  
  for (int i = 0; i < pg.width*pg.height; i++) {
    color c= color(img.pixels[i]);
    // RGB Method
    /*color c= color(img.pixels[i]);
    float R = red(c);
    float G = green(c);
    float B = blue(c);
    pg.pixels[i] = color(int((0.2126*R+0.7152*G+0.0722*B)));
    //pg.pixels[i] = color(int((R+G+B)/3));
    */
    // HSB Method
    colorMode(HSB,100);
    float H = hue(c);
    float S = saturation(c);
    float Br = brightness(c);
    pg.pixels[i] = color(Br);
}
  
  img.updatePixels();
  
  image(img, 0, 0);
  image(pg, 250, 0);
}
