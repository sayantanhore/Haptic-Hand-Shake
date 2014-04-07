#include <Servo.h>

int fsrAnalogPin = 0; // FSR is connected to analog 0
int LEDpin = 11; // connect Red LED to pin 11 (PWM pin)
int fsrReading; // the analog reading from the FSR resistor divider
int LEDbrightness;

Servo serv;
int position;

void setup(void) {
  Serial.begin(9600); // We'll send debugging information via the Serial monitor
  pinMode(LEDpin, OUTPUT);
  serv.attach(9);
}

void loop(void) {
  fsrReading = analogRead(fsrAnalogPin);
  Serial.print("Analog reading = ");
  Serial.println(fsrReading);
  //LEDbrightness = map(fsrReading, 0, 1023, 0, 255);
  //analogWrite(LEDpin, LEDbrightness);
  //LEDbrightness = map(fsrReading, 0, 1023, 0, 255);
  for (position = 0; position < fsrReading * 2; position +=1)
  {
    serv.write(position);
    delay(15);
  }

  //delay(100);
}

