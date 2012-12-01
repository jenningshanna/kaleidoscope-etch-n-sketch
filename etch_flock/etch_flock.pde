import processing.serial.*;

Serial myPort;
int val;     
int poteValue = 0;
int lightValue = 0;

Flock flock;

void setup() {
  size(1100, 560);
  //colorMode(HSB, TWO_PI, 1, 1, 1);
  
   int portId = 4;
  //println (Serial.list());
  String portName = Serial.list()[portId];  //find the serial port, to port 4

  myPort = new Serial(this, portName, 9600);  //create serial object that processing can refer to
  
  smooth();
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 10; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  background(50);
  //potePressed();
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
//void potePressed(){
  //if (int i = 0; i > lightValue; i++) {  
    int i = 0;
    for(i = 0; i < 250; i++) {
    flock.addBoid(new Boid(mouseX,mouseY));
    }
 // }
}

void serialEvent( Serial serial) {
  // char lec = '\n';
  // int lei = 10;
   String s = serial.readStringUntil( '\n' );
  // String s = serial.readString();
  if ( s == null ) {
    // no thanks
  } 
  else {
    s = trim(s);
    //println(s);
    String stringArray[] = split(s, ',');
      poteValue = int(stringArray[0]);
      lightValue = int(stringArray[1]);
      
      println("Potentiometer: " + poteValue);
      println("Light Meter" + lightValue);
  }
}
