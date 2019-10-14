void setup(){
  size( 1200, 600 );
  background( 80 );
}

void draw(){
  noFill();
  strokeWeight( 5 );
  triangle( 100,400, 500,400, 300,60);
  fill( 0 );
  ellipse( 100, 175, 125, 125 );
  ellipse( 500, 175, 125, 125 );
  ellipse( 300, 500, 125, 125 );
  noStroke();
  fill(80);
  triangle(300, 500, 100, 175, 500, 175);

  fill( 0 );
  strokeWeight( 5 );
  ellipse( 700, 175, 125, 125 );
  ellipse( 1040, 175, 125, 125 );
  ellipse( 700, 500, 125, 125 );
  ellipse( 1040, 500, 125, 125 );    
  fill(80);
  square(700, 175, 340);
}
