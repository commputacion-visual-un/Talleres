import processing.video.*;
PGraphics pg, pg1;
Movie movie;
PImage m;

void setup() {
  size(900, 900);
  pg = createGraphics(400, 400);
  pg1 = createGraphics(400, 400);
  movie = new Movie(this, "La dura vida de un cuidador de pandas.mov");
  movie.loop();
}

void filtrarVideo(PGraphics pg, Movie movie){
  pg.loadPixels();
  movie.loadPixels();  
  
  if(movie.width > 0){
    m = movie.get();
    m.resize(400,400);
  
  for (int loc = 0; loc < m.width * m.height; loc++) {
    // Get the red, green, blue values from a pixel      
    float r = red  (m.pixels[loc]);      
    float g = green(m.pixels[loc]);      
    float b = blue (m.pixels[loc]);      
    
    // Calculate an amount to change brightness based on proximity to the mouse      
    float d = dist( m.width/2+415, m.height/2, mouseX, mouseY);      
    float adjustbrightness = map(d, 0, 200, 4, 0);      
    r *= adjustbrightness;      
    g *= adjustbrightness;      
    b *= adjustbrightness;      
    
    // Constrain RGB to make sure they are within 0-255 color range      
    r = constrain(r, 0, 255);      
    g = constrain(g, 0, 255);      
    b = constrain(b, 0, 255);      
  
    // Make a new color and set pixel in the window      
    color c = color(r, g, b);      
    m.pixels[loc] = c;    
  }
  
  m.updatePixels();
  pg.image(m, 0, 0);
  }
}

void draw() {
  //tint(255, 20);
  pg.beginDraw();
  pg.image(movie, 0, 0,400,400);  
  pg.endDraw();
  
  pg1.beginDraw();
  filtrarVideo(pg1, movie);
  //pg1.image(movie, 0, 0,400,400); 
  //pg1.filter(GRAY);
  pg1.endDraw();
  
  /*
  pg1.updatePixels();*/
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
