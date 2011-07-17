// Graphing sketch for MSP430--Original from Arduino website (http://www.arduino.cc/en/Tutorial/Graph)
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 // Modified by kiran jose(www.kiranjose.com) to plot graph using MSP430 Launchpad
 // --Checks for a space from MSP430 to sample the values
 // --String is converted to int and plotted as points 
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 1;         // horizontal position of the graph
 
 void setup () {
 // set the window size:
 size(400, 300);        
 
 // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[2].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[2], 2400);
 // don't generate a serialEvent() unless you get a space character:
 myPort.bufferUntil(' ');
 // set inital background:
 background(0);
 }
 void draw () {
 // everything happens in the serialEvent()
 }
 
 void serialEvent (Serial myPort) {
 // get the ASCII string:
 String inString = myPort.readStringUntil(' ');
  char c1s = inString.charAt(0);
  int no = int(c1s);
  //no = no*2;
  println(no);
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // convert to an int and map to the screen height:
 float inByte = float(no); 
 inByte = map(inByte, 0, 250, 0, height);
 
 // draw the line:
 stroke(127,34,255);
 strokeWeight(3);
 //line(xPos, height, xPos, height - inByte);
 point(xPos, height - inByte);
 
 // at the edge of the screen, go back to the beginning:
 if (xPos >= width) {
 xPos = 0;
 background(0); 
 } 
 else {
 // increment the horizontal position:
 xPos++;
 }
 }
 }
