color riverBlue = #005A8B;
color lightBlue = #A2C2D4;
color darkGreen = #3F5822;
color lightGreen = #B7E3C4;
color lightGray = #D6E8D7;
color white = #FFFFFF;
color black = #000000;

int pos1;
int pos2;
int pos3;
int pos4;
int pos5;

void setup(){
  size(900, 900);
  pos1 = 150;
}

void draw(){
  // Sky
  background(#87CEEB);
  
  // Grass 
  noStroke();
  fill(lightGreen);
  rect(0, 560, 900, 75);
  
  // Trees
  drawTree(80,  545);
  drawTree(210, 520);
  drawTree(315, 533);
  drawTree(450, 532); 
  drawTree(575, 525);
  drawTree(690, 528);
  drawTree(820, 542);
  
  // Lake
  fill(riverBlue);
  rect(0, 620, 900, 280);
  
  // Soft shimmer at waterline
  fill(lightBlue);
  rect(0, 620, 900, 18);
  
  // Swans 
  swan(pos1, 710,  1, white);
  swan(260, 860, -1, white);
  swan(450, 740,  1, white);
  swan(650, 860, -1, white);
  swan(740, 710,  1, white); 
  
  //sun
  drawSun(820, 80);
  
  //movement
  if(pos1 < 250 && pos1 > 100){
    pos1 += 2;
  }
 
  
  
  
  
}

void drawTree(float x, float y){
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(#7A4F2D);
  rect(-7, 15, 14, 55);
  fill(darkGreen);
  ellipse(0, 0, 72, 80);
  fill(#4A6B2A);
  ellipse(4, -18, 52, 60);
  popMatrix();
}

void swan(float x, float y, float dir, color c){
  pushMatrix();
  translate(x, y);
  noStroke();
  
  // Body
  fill(c);
  ellipse(0, 0, 90, 50);
  
  // Tail
  fill(c);
  triangle(dir*(-38), -15, dir*(-68), -8, dir*(-45), 8);
  
  // Neck
  ellipse(dir*20, -30, 18, 52);
  
  // Head
  ellipse(dir*28, -56, 28, 24);
  
  // Beak
  fill(#E09020);
  triangle(dir*42, -62, dir*62, -58, dir*42, -52);
  
  // Eye
  fill(0);
  ellipse(dir*32, -60, 5, 5);
  
  popMatrix();
}

void drawSun(float x, float y){
  pushMatrix();
  translate(x, y);
  stroke(#FFD700);
  strokeWeight(3);
  line(0, -42, 0, -65);
  line(0,  42, 0,  65);
  line(-42, 0, -65, 0);
  line( 42, 0,  65, 0);
  line(-30, -30, -48, -48);
  line( 30, -30,  48, -48);
  line(-30,  30, -48,  48);
  line( 30,  30,  48,  48);
  noStroke();
  fill(#FFD700);
  ellipse(0, 0, 70, 70);
  popMatrix();
}
