// Texture from Jason Liebig's FLICKR collection of vintage labels and wrappers:
// http://www.flickr.com/photos/jasonliebigstuff/3739263136/in/photostream/

PImage label;
PShape can;
float angle;
int size;
PShader texShader;

float[][] mascara;

float[][] maskBasic ={{0, 0, 0},
                     {0, 1, 0},
                     {0, 0, 0}};

float[][] EdgeDetection = {{ -1, -1, -1}, 
                           { -1,  9, -1}, 
                           { -1, -1, -1}};
                    
float[][] Sharpen       = {{  0, -1,  0}, 
                           { -1,  5, -1}, 
                           {  0, -1, 0}};
                           
float[][] Gaussian3     = {{  1./16,  2./16,  1./16}, 
                           {  2./16,  4./16,  2./16}, 
                           {  1./16,  2./16,  1./16}};
                           

float[][] bordes = {{ -1, -1, -1}, 
                           { -1,  8, -1}, 
                           { -1, -1, -1}};

void setup() {
  size = 3;
  size(640, 360, P3D);  
  label = loadImage("lachoy.jpg");
  can = createCan(100, 200, 32, label);
  texShader = loadShader("edgefrag.glsl", "texvert.glsl");
  mascara=maskBasic;
}

void draw() {    
  background(0);
    
  if(size == 3){
    texShader.set("mascara1",  mascara[0][0],mascara[0][1],mascara[0][2]);
    texShader.set("mascara2",  mascara[1][0],mascara[1][1],mascara[1][2]);
    texShader.set("mascara3",  mascara[2][0],mascara[2][1],mascara[2][2]);
  }
  
  shader(texShader);  
    
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail, PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(tex);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

void keyPressed() {
  if (key == '1') {
    size = 3;
    mascara=maskBasic;
  }
  if (key == '2') {
    size = 3;
    mascara=EdgeDetection;
  }
  if (key == '3') {
    size = 3;
    mascara=Sharpen;
  }
  if (key == '4') {
    size = 3;
    mascara=Gaussian3;
  }
  if (key == '5') {
    size = 3;
    mascara=bordes;
  }
}
