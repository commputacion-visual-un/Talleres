// Adaptatation of code from "https://processing.org/examples/edgedetection.html" :
// - Accept odd kernels of all sizes
// - Works on color images

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
                           
// OBSERVATION : Black lines appear around the image :
// We don't apply convolution on these pixels because they haven't neighbours  in every direction.
// Possibilities to correct that : * Extend the borders pixels in every direction
//                                 * Repeat the image in every direction
                           
// CHOOSE HERE WHICH KERNEL TO APPLY
float[][] kernel = Sharpen;
int mid_l = (kernel.length - 1)/2;    // To accept various ODD kernel sizes
PImage img;

void setup() { 
  size(1000, 500);
  img = loadImage("peniscola.jpg"); // Load the original image
  img.resize(500,500);
  print(mid_l);
  print(Gaussian3[0][0]);
  noLoop();
}

void draw() {
  image(img, 0, 0); // Displays the image from point (0,0) 
  img.loadPixels();
  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);
  // Loop through every pixel in the image.
  for (int y = mid_l; y < img.height-mid_l; y++) { // Skip top and bottom edges
    for (int x = mid_l; x < img.width-mid_l; x++) { // Skip left and right edges
      float sum_R = 0; // Red kernel sum for this pixel
      float sum_G = 0; // Green kernel sum for this pixel
      float sum_B = 0; // Blue kernel sum for this pixel
      for (int ky = -mid_l; ky <= mid_l ; ky++) {
        for (int kx = -mid_l; kx <= mid_l ; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);
          // For each RGB color :
          float R_val = red(img.pixels[pos]);
          float G_val = green(img.pixels[pos]);
          float B_val = blue(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum_R += kernel[ky+mid_l][kx+mid_l] * R_val;
          sum_G += kernel[ky+mid_l][kx+mid_l] * G_val;
          sum_B += kernel[ky+mid_l][kx+mid_l] * B_val;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sum_R, sum_G, sum_B);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  noStroke();
  edgeImg.updatePixels();
  image(edgeImg, width/2, 0); // Draw the new image
}
