#include <Servo.h>

const int inPin = 7; 
const int outPin = 8; 
int inputValue = A0;
int heatPin = 4 ;
int fsrPin = 0;
Servo serv;
long fsrVal=0;


void setup()
{
  Serial.begin(9600); 
  serv.attach(9);

  pinMode(inPin,INPUT);
  pinMode(outPin,OUTPUT);
}

void loop() 
{


    fsrVal = analogRead(fsrPin);

    if (fsrVal>40)
    {
      if (digitalRead(outPin)==LOW)
        {
          digitalWrite(outPin,HIGH);
          Serial.print(3);
        }
      delay(200);
    }
    else if (digitalRead(outPin) == HIGH)
    {
      digitalWrite(outPin,LOW);
      Serial.print(2);
      delay(200);
    }

    if (digitalRead(inPin) == HIGH)
    {
        serv.write(0);
        digitalWrite(heatPin,HIGH);
        Serial.print(1);
        delay(200);
    } 
    else 
    {
       serv.write(180);      
       //digitalWrite(heatPin,LOW);
       Serial.print(0);
       delay(200);
    }
}
