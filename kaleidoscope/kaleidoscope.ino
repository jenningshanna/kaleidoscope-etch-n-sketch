/* 

Jennings Hanna 
FINAL
Physical Computing FALL Semester 2012 
MFA IxD SVA
Kaleidoscope Etch a Sketch
 
*/

const int pote = A0;
const int light_sensor = A1;

int prev_light = 0;
int prev_pote = 0;
//boolean button = 12;

void setup(){
  Serial.begin(9600);

  pinMode(pote,INPUT);
}

void loop(){

  int val = 0;
  int i;
  
  for(i = 0; i < 10; i++)
  {
  val += analogRead(pote);
  }
  
  val = val / 10;
  
//  if (prev_pote != val){
  Serial.print(val / 4); // the sensor val
  Serial.print(',');
//  prev_pote = val;
//  }
  
  val = 0;
  for(i = 0; i < 10; i++)
  {
  val += analogRead(light_sensor);
  }
  
  val = val / 10;
  
  //  if (prev_light != val){
  Serial.print(val / 4); // the sensor val
  Serial.print(',');
  //  prev_light = val;
  //  }
    
  //  val = digitalRead(button);
  //  Serial.print(val); // the sensor val
  //  Serial.print(',');
  
  Serial.print('\n');


  // entire program PAUSES HERE
  delay(3);

  // resumes normal
}





