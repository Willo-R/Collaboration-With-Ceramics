color riverBlue = #005A8B;
color lightBlue = #A2C2D4;
color darkGreen = #3F5822;
color lightGreen = #B7E3C4;
color lightGray = #D6E8D7;
color white = #FFFFFF;
color black = #000000;

float swanColor = 255;

//top left swan
float pos1 = 150;
float dir1 = 1.4;
int sign1 = 1;

//middle swan
float pos2 = 450;
float dir2 = 1.3;
int sign2 = 1;

//top right swan
float pos3 = 750;
float dir3 = 1.5;
int sign3 = 1;

//bottom left swan
float pos4 = 260;
float dir4 = 1.5;
int sign4 = -1;

//botton right swan
float pos5 = 650;
float dir5 = 1.2;
int sign5 = -1;

//change color
int count;

//Happiness from swan
float spark1Y = 740;
float spark2Y = 700;
float spark3Y = 720;
float angle15 = 0;
float angle34 = 0;



void setup(){
  size(900, 900);
  count = 0;
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
  swan(pos1, 710, sign1, white, angle15);
  swan(pos4, 860, sign4, white, angle34);
  swan(pos2, 740, sign2, color(swanColor), 0);
  swan(pos5, 860, sign5, white, angle15);
  swan(pos3, 710, sign3, white, angle34); 
  
  //sun
  drawSun(820, 80);
  
  //movement
  if(count < 500){
    pos1 += dir1;
    if(pos1 > 200 || pos1 < 100){
      dir1 = -dir1;
      sign1 = -sign1;
    }
  }
 
  if(count < 500){
    pos2 += dir2;
    if(pos2 > 500 || pos2 < 400){
      dir2 = -dir2;
      sign2 = -sign2;
    }
  }
  
  if(count < 500){
     pos3 += dir3;
     if(pos3 > 800 || pos3 < 700){
       dir3 = -dir3;
       sign3 = -sign3;
     }
  }
  
  if(count < 500){
    pos4 -= dir4;
    if(pos4 > 310 || pos4 < 210){
      dir4 = -dir4;
      sign4 = -sign4;
    }
  }
  
  if(count < 500){
    pos5 -= dir5;
    if(pos5 > 700 || pos5 < 600){
      dir5 = -dir5;
      sign5 = -sign5;
    }
  }
  
  
  //color change
  if(count > 300 && swanColor > 90){
    swanColor -= 1;
  }
  
  if(count == 560){
    sign1 = -sign1;
  }
  
    if(count > 600 && count < 650){
      angle15 += 0.005;
      angle34 += -0.005;
    }
  
  
  if(count >= 700){
    drawSparkles();
  }
  
  count += 1;
  
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

void swan(float x, float y, float dir, color c, float angle){
  pushMatrix();
  translate(x, y);
  rotate(angle);
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

void drawSparkles(){
  pushMatrix();
  translate(pos2, 740);
  stroke(#FFD700);
  strokeWeight(2);
  
  // Glow rays 
  line(0, -55, 0, -75);        // up
  line(0,  35, 0,  55);        // down
  line(-55, 0, -75, 0);        // left
  line( 55, 0,  75, 0);        // right
  line(-40, -40, -55, -55);    // up-left
  line( 40, -40,  55, -55);    // up-right
  line(-40,  25, -55,  40);    // down-left
  line( 40,  25,  55,  40);    // down-right
  
  noStroke();
  popMatrix();
}
