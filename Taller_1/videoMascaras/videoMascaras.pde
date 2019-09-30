// video Kernel

import processing.video.*;
PGraphics pg, pg1;
Movie movie;
PImage m, m1;


float[][] EdgeDetection = {{ -1, -1, -1}, 
                           { -1,  9, -1}, 
                           { -1, -1, -1}};
                    
float[][] Sharpen       = {{  0, -1,  0}, 
                           { -1,  5, -1}, 
                           {  0, -1, 0}};
                           
float[][] Gaussian3     = {{  1./16,  2./16,  1./16}, 
                           {  2./16,  4./16,  2./16}, 
                           {  1./16,  2./16,  1./16}};
                           
float[][] Gaussian5     = {{  1./256,  4./256,  6./256,  4./256,  1./256}, 
                           {  4./256, 16./256, 24./256, 16./256,  4./256}, 
                           {  6./256, 24./256, 36./256, 24./256,  6./256},
                           {  4./256, 16./256, 24./256, 16./256,  4./256},
                           {  1./256,  4./256,  6./256,  4./256,  1./256}};

float[][] BoxBlur5      = {{  1./25,  1./25,  1./25,  1./25,  1./25}, 
                           {  1./25,  1./25,  1./25,  1./25,  1./25},
                           {  1./25,  1./25,  1./25,  1./25,  1./25},
                           {  1./25,  1./25,  1./25,  1./25,  1./25},
                           {  1./25,  1./25,  1./25,  1./25,  1./25}};

float[][] kernel = BoxBlur5; // CHANGE HERE WHICH KERNEL TO APPLY
int mid_l = (kernel.length - 1)/2;    // To accept various ODD kernel sizes

void setup() {
  size(900, 900);
  frameRate(30);
  pg = createGraphics(400, 400);
  pg1 = createGraphics(400, 400);
  movie = new Movie(this, "La dura vida de un cuidador de pandas.mov");
  movie.loop();
}

void videoKernel(PGraphics pg, Movie movie){
  pg.loadPixels();
  movie.loadPixels();  
  
  if(movie.width > 0){
    m = movie.get();
    m1 = movie.get();
    m.resize(400,400);
    m1.resize(400,400);
  
  for (int y = mid_l; y < m.height-mid_l; y++) { // Skip top and bottom edges
    for (int x = mid_l; x < m.width-mid_l; x++) { // Skip left and right edges
      float sum_R = 0; // Red kernel sum for this pixel
      float sum_G = 0; // Green kernel sum for this pixel
      float sum_B = 0; // Blue kernel sum for this pixel
      for (int ky = -mid_l; ky <= mid_l ; ky++) {
        for (int kx = -mid_l; kx <= mid_l ; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*m.width + (x + kx);
          // For each RGB color :
          float R_val = red(m.pixels[pos]);
          float G_val = green(m.pixels[pos]);
          float B_val = blue(m.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum_R += kernel[ky+mid_l][kx+mid_l] * R_val;
          sum_G += kernel[ky+mid_l][kx+mid_l] * G_val;
          sum_B += kernel[ky+mid_l][kx+mid_l] * B_val;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      m1.pixels[y*m.width + x] = color(sum_R, sum_G, sum_B);
    }
  }
  
  m1.updatePixels();
  pg.image(m1, 0, 0);
  }
}

void draw() {
  pg.beginDraw();
  pg.image(movie, 0, 0,400,400);  
  pg.endDraw();
  
  pg1.beginDraw();
  videoKernel(pg1, movie);
  pg1.endDraw();
  
  image(pg, 15, 15);
  image(pg1, 425, 15);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
