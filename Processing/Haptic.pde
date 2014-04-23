PImage arduino;
PImage FSR;
PImage servo;
PImage heatPad;
PImage heatPadRed;
String s;
float left;
float right;
float top;
float scaleFactor = 0.5;
float translationFactor = (1.0 / scaleFactor) - 1;
float posX;
float posY;
boolean overFSR1 = false;
boolean overFSR2 = false;

// Pin position
float a0_position_frac = 0.865;
float a4_position_frac = 0.945;
float a5_position_frac = 0.965;
float d13_position_frac = 0.710;
float pwm_9_position_frac = 0.780;

void setup(){
  size(displayWidth, displayHeight);
  arduino = loadImage("arduino_uno_2.png");
  FSR = loadImage("FSR.jpg");
  servo = loadImage("servo.jpg");
  heatPad = loadImage("Heating_Pad.jpg");
  heatPadRed = loadImage("Heating_Pad_Red.jpg");
  s = "";
  
  drawStatic();
  
}

void draw(){
  drawStatic();
  showDataLocation();
}

void showDataLocation(){
  // Setting co-ordinates
  left = displayWidth * 10.0 / 100;
  right = displayWidth - left - arduino.width;
  top = (displayHeight - arduino.height) / 2.0;
  pushMatrix();
  
  // Scaling
  scale(scaleFactor);
  
  // Translation
  translate(left * translationFactor, top * translationFactor);
  
  // Updating co-ordinates
  left = left + left * translationFactor;
  right = right + right * translationFactor;
  top = top + top * translationFactor;
  
  //posX = left;
  //posY = (top + arduino.height) * a4_position_frac;
  
  noStroke();
  fill(255, 0, 0);
  float t =  (frameCount/20.0)%1;
  
  if(overFSR1 == true){
  
    // For FSR to Arduino
    
    float X = bezierPoint(left - FSR.width * 3 / 2, left - FSR.width * 3 / 2, left, left, t);
    float Y = bezierPoint(top + FSR.height, top + FSR.height, (top + arduino.height) * a0_position_frac, (top + arduino.height) * a0_position_frac, t);
    
    ellipse(X, Y, 20, 20);
    
    // For Arduino to Arduino
    
    X = bezierPoint(left + arduino.width, left + arduino.width, right - 100, right - 100, t);
    Y = bezierPoint((top + arduino.height) * a4_position_frac, (top + arduino.height) * a4_position_frac, (top + arduino.height) * a4_position_frac, (top + arduino.height) * a4_position_frac, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right - 100, right - 100, right - 100, right - 100, t);
    Y = bezierPoint((top + arduino.height) * a4_position_frac, (top + arduino.height) * a4_position_frac, (top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a4_position_frac + 100, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right - 100, right - 100, right + arduino.width + 50, right + arduino.width + 50, t);
    Y = bezierPoint((top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a4_position_frac + 100, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width + 50, right + arduino.width + 50, right + arduino.width + 50, right + arduino.width + 50, t);
    Y = bezierPoint((top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a4_position_frac + 100, (top + arduino.height) * a5_position_frac, (top + arduino.height) * a5_position_frac, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width + 50, right + arduino.width + 50, right + arduino.width, right + arduino.width, t);
    Y = bezierPoint((top + arduino.height) * a5_position_frac, (top + arduino.height) * a5_position_frac, (top + arduino.height) * a5_position_frac, (top + arduino.height) * a5_position_frac, t);
    
    // From Arduino to HeatPad
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width, right + arduino.width, right + arduino.width / 2 + 220, right + arduino.width / 2 + 220, t);
    Y = bezierPoint((top + arduino.height) * d13_position_frac, (top + arduino.height) * d13_position_frac, (top + arduino.height) * d13_position_frac, (top + arduino.height) * d13_position_frac, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width / 2 + 220, right + arduino.width / 2 + 220, right + arduino.width / 2 + 220, right + arduino.width / 2 + 220, t);
    Y = bezierPoint((top + arduino.height) * d13_position_frac, (top + arduino.height) * d13_position_frac, (top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2 + 50, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width / 2 + 220, right + arduino.width / 2 + 220, right + arduino.width / 2, right + arduino.width / 2, t);
    Y = bezierPoint((top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2 + 50, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width / 2, right + arduino.width / 2, right + arduino.width / 2, right + arduino.width / 2, t);
    Y = bezierPoint((top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2 + 50, (top + heatPad.height) / 2, (top + heatPad.height) / 2, t);
    
    // From Arduino to Servo
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width, right + arduino.width, right + arduino.width + servo.width / 2 + 200, right + arduino.width + servo.width / 2 + 200, t);
    Y = bezierPoint((top + arduino.height) * pwm_9_position_frac, (top + arduino.height) * pwm_9_position_frac, (top + arduino.height) * pwm_9_position_frac, (top + arduino.height) * pwm_9_position_frac, t);
    
    ellipse(X, Y, 20, 20);
    
    X = bezierPoint(right + arduino.width + servo.width / 2 + 200, right + arduino.width + servo.width / 2 + 200, right + arduino.width + servo.width / 2 + 200, right + arduino.width + servo.width / 2 + 200, t);
    Y = bezierPoint((top + arduino.height) * pwm_9_position_frac, (top + arduino.height) * pwm_9_position_frac, (top + servo.height) / 2, (top + servo.height) / 2, t);
    
    ellipse(X, Y, 20, 20);
  }
  /*
  noStroke();
  fill(255, 0, 0);
  float t =  (frameCount/20.0)%1;
  float X = bezierPoint(left, left - 30, left - 70, left - 100, t);
  float Y = bezierPoint(posY, posY, posY, posY, t);
  
  ellipse(X, Y, 20, 20);
  
  X = bezierPoint(left - 100, left - 100, left - 100, left - 100, t);
  Y = bezierPoint(posY, posY + 30, posY + 70, posY + 100, t);
  
  ellipse(X, Y, 20, 20);
  
  X = bezierPoint(left - 100, left - 100, right - 100, right - 100, t);
  Y = bezierPoint(posY + 100, posY + 100, posY + 100, posY + 100, t);
  
  ellipse(X, Y, 20, 20);
  
  X = bezierPoint(right - 100, right - 100, right - 100, right - 100, t);
  Y = bezierPoint(posY + 100, posY + 70, posY + 30, posY, t);
  
  ellipse(X, Y, 20, 20);
  
  X = bezierPoint(right - 100, right - 70, right - 30, right, t);
  Y = bezierPoint(posY, posY, posY, posY, t);
  
  ellipse(X, Y, 20, 20);
  */
  popMatrix();
}

void drawStatic(){

  // Setting background
  background(255);
  
  // Setting co-ordinates
  left = displayWidth * 10.0 / 100;
  right = displayWidth - left - arduino.width;
  top = (displayHeight - arduino.height) / 2.0;
  pushMatrix();
  
  // Scaling
  scale(scaleFactor);
  
  // Translation
  translate(left * translationFactor, top * translationFactor);
  
  // Updating co-ordinates
  left = left + left * translationFactor;
  right = right + right * translationFactor;
  top = top + top * translationFactor;
  
  // Placing images
  image(arduino, left, top);
  image(arduino, right, top);
  
  image(FSR, left - FSR.width * 2, top);
  image(FSR, right - FSR.width * 2, top);
  
  stroke(255, 0, 0);
  
  if(overFSR1 == true){
    image(heatPad, left + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(heatPadRed, right + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(servo, left + arduino.width + 200, (top - servo.height) / 2);
    // Rotate Servo
    float tempLeft = right + arduino.width + 200;
    float rotateXPos = tempLeft * 1.007;
    float tempTop = (top - servo.height) / 2.0;
    float rotateYPos = tempTop + servo.height * 0.9;
    translate(rotateXPos, rotateYPos);
    rotate(PI / 2.0);
    translate(- rotateXPos, - rotateYPos);
    image(servo, tempLeft, tempTop);
    translate(rotateXPos, rotateYPos);
    rotate(-PI / 2.0);
    translate(- rotateXPos, - rotateYPos);
  }
  
  else if(overFSR2 == true){
    image(heatPadRed, left + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(heatPad, right + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(servo, right + arduino.width + 200, (top - servo.height) / 2);
    // Rotate Servo
    float tempLeft = left + arduino.width + 200;
    float rotateXPos = tempLeft * 1.007;
    float tempTop = (top - servo.height) / 2.0;
    float rotateYPos = tempTop + servo.height * 0.9;
    translate(rotateXPos, rotateYPos);
    rotate(PI / 2.0);
    translate(- rotateXPos, - rotateYPos);
    image(servo, tempLeft, tempTop);
    translate(rotateXPos, rotateYPos);
    rotate(-PI / 2.0);
    translate(- rotateXPos, - rotateYPos);
  }
  
  else{
    image(heatPad, left + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(heatPad, right + (arduino.width - heatPad.width) / 2, (top - heatPad.height) / 2);
    image(servo, left + arduino.width + 200, (top - servo.height) / 2);
    image(servo, right + arduino.width + 200, (top - servo.height) / 2);
  }
  
  
  
  // Drawing FSR - Arduino connectors
  
  stroke(0, 126, 0);
  
  line(left - FSR.width * 3 / 2, top + FSR.height, left, (top + arduino.height) * a0_position_frac);
  line(right - FSR.width * 3 / 2, top + FSR.height, right, (top + arduino.height) * a0_position_frac);
  
  // Drawing HeatPad - Arduino connectors
  
  stroke(0, 126, 0);
  
  line(left + arduino.width / 2, (top + heatPad.height) / 2, left + arduino.width / 2, (top + heatPad.height) / 2 + 50);
  line(left + arduino.width / 2, (top + heatPad.height) / 2 + 50, left + arduino.width / 2 + 220, (top + heatPad.height) / 2 + 50);
  line(left + arduino.width / 2 + 220, (top + heatPad.height) / 2 + 50, left + arduino.width / 2 + 220, (top + arduino.height) * d13_position_frac);
  line(left + arduino.width / 2 + 220, (top + arduino.height) * d13_position_frac, left + arduino.width, (top + arduino.height) * d13_position_frac);
  
  line(right + arduino.width / 2, (top + heatPad.height) / 2, right + arduino.width / 2, (top + heatPad.height) / 2 + 50);
  line(right + arduino.width / 2, (top + heatPad.height) / 2 + 50, right + arduino.width / 2 + 220, (top + heatPad.height) / 2 + 50);
  line(right + arduino.width / 2 + 220, (top + heatPad.height) / 2 + 50, right + arduino.width / 2 + 220, (top + arduino.height) * d13_position_frac);
  line(right + arduino.width / 2 + 220, (top + arduino.height) * d13_position_frac, right + arduino.width, (top + arduino.height) * d13_position_frac);
  
  // Drawing Servo - Arduino connectors
  
  stroke(0, 126, 0);
  
  line(left + arduino.width + servo.width / 2 + 200, (top + servo.height) / 2, left + arduino.width + servo.width / 2 + 200, (top + arduino.height) * pwm_9_position_frac);
  line(left + arduino.width + servo.width / 2 + 200, (top + arduino.height) * pwm_9_position_frac, left + arduino.width, (top + arduino.height) * pwm_9_position_frac);
  
  line(right + arduino.width + servo.width / 2 + 200, (top + servo.height) / 2, right + arduino.width + servo.width / 2 + 200, (top + arduino.height) * pwm_9_position_frac);
  line(right + arduino.width + servo.width / 2 + 200, (top + arduino.height) * pwm_9_position_frac, right + arduino.width, (top + arduino.height) * pwm_9_position_frac);
  
  // Drawing Arduino - Arduino connectors
  stroke(0, 126, 0);
  
  line((left + arduino.width), (top + arduino.height) * a4_position_frac, right - 100, (top + arduino.height) * a4_position_frac);
  line(right - 100, (top + arduino.height) * a4_position_frac, right - 100, (top + arduino.height) * a4_position_frac + 100);
  line(right - 100, (top + arduino.height) * a4_position_frac + 100, right + arduino.width + 50, (top + arduino.height) * a4_position_frac + 100);
  line(right + arduino.width + 50, (top + arduino.height) * a4_position_frac + 100, right + arduino.width + 50, (top + arduino.height) * a5_position_frac);
  line(right + arduino.width + 50, (top + arduino.height) * a5_position_frac, right + arduino.width, (top + arduino.height) * a5_position_frac);
  
  stroke(0, 255, 0);
  
  line((left + arduino.width), (top + arduino.height) * a5_position_frac, right - 115, (top + arduino.height) * a5_position_frac);
  line(right - 115, (top + arduino.height) * a5_position_frac, right - 115, (top + arduino.height) * a5_position_frac + 100);
  line(right - 115, (top + arduino.height) * a5_position_frac + 100, right + arduino.width + 65, (top + arduino.height) * a5_position_frac + 100);
  line(right + arduino.width + 65, (top + arduino.height) * a5_position_frac + 100, right + arduino.width + 65, (top + arduino.height) * a4_position_frac);
  line(right + arduino.width + 65, (top + arduino.height) * a4_position_frac, right + arduino.width, (top + arduino.height) * a4_position_frac);
   
  popMatrix();
  
}

boolean sketchFullScreen() {
  return true;
}

void mousePressed(){
  if((mouseX + mouseX * translationFactor) >= left - FSR.width && (mouseX + mouseX * translationFactor) <= left){
    if((mouseY + mouseY * translationFactor) >= top && (mouseY + mouseY * translationFactor) <= top + FSR.height){
      overFSR1 = true;
    } 
    //println(mouseX + ", " + mouseY);
  }
  else if((mouseX + mouseX * translationFactor) >= right - FSR.width && (mouseX + mouseX * translationFactor) <= right){
    if((mouseY + mouseY * translationFactor) >= top && (mouseY + mouseY * translationFactor) <= top + FSR.height){
      overFSR2 = true;
    }
  }
}

void mouseReleased() {
  overFSR1 = false;
  overFSR2 = false;
}
