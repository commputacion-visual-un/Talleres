float cst;

void setup() {
  size(600, 600);
  cst = sqrt(3)/2;
}

void draw() {
  strokeWeight(2);
  background(256,256,256);      // White background
  
  int dec = 50; 
  fill(256,256,256);                           // White one
  triangle(250., 350., 350., 350., 300., 350- cst*100.);
          //LEFT      //RIGHT    //HIGH   Angles
  strokeWeight(0);
  point(300. -0.5*dec, 350- cst*100. -cst*dec); //HIGH
  point(350. +dec, 350.);                       //RIGHT
  point(250. -0.5*dec, 350. +cst*dec);          //LEFT
  
  strokeWeight(0);                             //HIGH
  point(300. -0.5*dec, 350- cst*100. -cst*dec -2*dec*cst);        //left
  point(300. -0.5*dec +dec, 350- cst*100. -cst*dec -2*dec*cst);   //right
  
  strokeWeight(0);                            //RIGHT
  point(350. +(5./2)*dec, 350. +cst*dec);                         //right
  point(350. +2*dec, 350. +2*cst*dec);                            //left
  
  strokeWeight(0);                            //LEFT
  point(250. -(5./2)*dec, 350. +cst*dec);                         //left
  point(250. -2*dec, 350. +2*cst*dec);                            //right
  
  strokeWeight(3);
  stroke(0);
  fill(256,0,0);               // Red
  quad(350., 350., 350. +dec, 350., 300. -0.5*dec, 350- cst*100. -cst*dec -2*dec*cst, 300. -0.5*dec, 350- cst*100. -cst*dec);
  quad(300. -0.5*dec, 350- cst*100. -cst*dec -2*dec*cst, 300. -0.5*dec, 350- cst*100. -cst*dec, 250. -2*dec, 350. +2*cst*dec, 250. -(5./2)*dec, 350. +cst*dec);
  stroke(256,0,0);
  line(300. -0.5*dec, 350- cst*100. -cst*dec -2*dec*cst +6, 300. -0.5*dec, 350- cst*100. -cst*dec);
  
  strokeWeight(3);
  stroke(0);
  fill(0,0,256);               // Blue
  quad(300., 350- cst*100., 300. -0.5*dec, 350- cst*100. -cst*dec, 250. -2*dec, 350. +2*cst*dec, 250. -0.5*dec, 350. +cst*dec);
  quad(250. -2*dec, 350. +2*cst*dec, 250. -0.5*dec, 350. +cst*dec, 350. +(5./2)*dec, 350. +cst*dec, 350. +2*dec, 350. +2*cst*dec);
  stroke(0,0,256);
  strokeWeight(4);
  line(250. -2*dec +5, 350. +2*cst*dec -3, 250. -0.5*dec, 350. +cst*dec);
  
  strokeWeight(3);
  stroke(0);
  fill(0,256,0);               // Green
  quad(300. -0.5*dec, 350- cst*100. -cst*dec -2*dec*cst, 300. -0.5*dec +dec, 350- cst*100. -cst*dec -2*dec*cst, 350. +(5./2)*dec, 350. +cst*dec, 350. +dec, 350.);
  quad(350. +(5./2)*dec, 350. +cst*dec, 350. +dec, 350, 250., 350., 250. -0.5*dec, 350. +cst*dec);
  stroke(0,256,0);
  strokeWeight(4.5);
  line(350. +dec +3, 350. +2, 350. +(5./2)*dec -7, 350. +cst*dec -4);
  
}
