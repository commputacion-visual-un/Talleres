import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3, V;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;

// 2. Hints
boolean triangleHint = false;
boolean gridHint = true;
boolean debug = false;
boolean shadeHint = false;

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P2D;

// 4. Window dimension
int dim = 10;

// 4. Variables declaration
float w1, w2, w3;         // Edgefunction result 
float Lx, Rx, Ty, By;     // Limits of the square in which is generated the random triangle
float lda1, lda2, lda3;   // Barycentric coordinates

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {
  rectMode(CENTER);
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);
  // not really needed here but create a spinning task
  // just to illustrate some nub timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask(scene) {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
  V = new Vector();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  push();
  scene.applyTransformation(node);
  triangleRaster();
  pop();
}

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  float area = E(v1,v2,v3);
  boolean clockwise = area>0;
  
  for (float i = Lx; i <=Rx ; i+=width/(2*pow(2, 2*n))){      // Rasterization
    for (float j = By; j <=Ty ; j+=width/(2*pow(2, 2*n))){
      V.set(i, j);
      w1 = E(v2,v3,V);                                        // Edge function for each triangle edge 
      w2 = E(v3,v1,V);
      w3 = E(v1,v2,V);
      
      if ( (w1>=0 && w2>=0 && w3>=0)&&clockwise || (w1<=0 && w2<=0 && w3<=0)&&(!clockwise) ){ // Vector in the triangle
        lda1 = w1/area;
        lda2 = w2/area;
        lda3 = w3/area;
        noStroke();
        fill(lda1*255, lda2*255, lda3*255);                   // Color depending on the barycentric coordinates
        square(node.location(V).x(), node.location(V).y(), 0.05);
      }
      
    }
  } 
  // node.location converts points from world to node
  // here we convert v1 to illustrate the idea
  if (debug) {
    push();
    noStroke();
    fill(255, 0, 0, 125);
    square(round(node.location(v1).x()), round(node.location(v1).y()), 1);
    pop();
  }
}

float E(Vector A, Vector B, Vector P){
  // Returns the value for the edge function considering edge A-B CLOCKWISE for the point P
  return ( (node.location(P).x()-node.location(A).x())*(node.location(B).y()-node.location(A).y()) - 
           (node.location(P).y()-node.location(A).y())*(node.location(B).x()-node.location(A).x()) );
}

void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
  Lx = min(v1.x(), v2.x(), v3.x());
  Rx = max(v1.x(), v2.x(), v3.x());
  Ty = max(v1.y(), v2.y(), v3.y());
  By = min(v1.y(), v2.y(), v3.y());
}

void drawTriangleHint() {
  push();

  if(shadeHint)
    noStroke();
  else {
    strokeWeight(2);
    noFill();
  }
  beginShape(TRIANGLES);
  if(shadeHint)
    fill(255, 0, 0);
  else
    stroke(255, 0, 0);
  vertex(v1.x(), v1.y());
  if(shadeHint)
    fill(0, 255, 0);
  else
    stroke(0, 255, 0);
  vertex(v2.x(), v2.y());
  if(shadeHint)
    fill(0, 0, 255);
  else
    stroke(0, 0, 255);
  vertex(v3.x(), v3.y());
  endShape();

  strokeWeight(5);
  stroke(255, 0, 0);
  point(v1.x(), v1.y());
  stroke(0, 255, 0);
  point(v2.x(), v2.y());
  stroke(0, 0, 255);
  point(v3.x(), v3.y());

  pop();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 's')
    shadeHint = !shadeHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run();
  if (key == 'y')
    yDirection = !yDirection;
}
