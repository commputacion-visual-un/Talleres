import processing.video.*;
PGraphics pg, pg1;
Movie movie;

void setup() {
  size(900, 900);
  pg = createGraphics(500, 400);
  pg1 = createGraphics(500, 400);
  movie = new Movie(this, "video.mov");
  movie.loop();
}

void draw() {
  //tint(255, 20);
  pg.beginDraw();
  pg.image(movie, 0, 0,400,400);  
  pg.endDraw();
  
  pg1.beginDraw();
  pg1.image(movie, 0, 0,400,400); 
  //pg1.filter(GRAY);
  pg1.endDraw();
  
  loadPixels();
  movie.loadPixels();  

  for (int x = 0; x < movie.width; x++) {    
    for (int y = 0; y < movie.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * movie.width;      
    
      // Get the red, green, blue values from a pixel      
      float r = red  (movie.pixels[loc]);      
      float g = green(movie.pixels[loc]);      
      float b = blue (movie.pixels[loc]);      
      
      // Calculate an amount to change brightness based on proximity to the mouse      
      float d = dist(x, y, mouseX, mouseY);      
      float adjustbrightness = map(d, 0, 100, 4, 0);      
      r *= adjustbrightness;      
      g *= adjustbrightness;      
      b *= adjustbrightness;      
      
      // Constrain RGB to make sure they are within 0-255 color range      
      r = constrain(r, 0, 255);      
      g = constrain(g, 0, 255);      
      b = constrain(b, 0, 255);      
    
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;    
    }  
  }  
  
  pg1.updatePixels();
  image(pg, 15, 15);
  image(pg1, 425, 15);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
//void draw() {
//  image(myMovie, 0, 0);
//}
