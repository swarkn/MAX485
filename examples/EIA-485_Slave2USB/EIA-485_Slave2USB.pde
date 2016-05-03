/*
  Demo: How to use the simple MAX485-library for the max485 EIA-485 driver IC from Maxim Integrated.
  Copyright 2016 Stefan Thema (swarkn), http://do-it-neat.com <swarkn@do-it-neat.com>
  
  Upload this Sketch on your Arduino/Genuino Uno or Nano to use it  as a EIA-485 receiving slave device.
  This sketch outputs received data to the serial USB-port.
*/

#include <SoftwareSerial.h>
#include <MAX485.h>

// Setup SoftSerial Port to receive TTL data from receiver 
SoftwareSerial FirstSerial(10, 11); // RX(10)->RO, TX(11)->DI
// Setup max485 Control Input
MAX485 FirstMax485(8, 9); // 8->RE, 9->DE

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial USB-port to connect
  }

  Serial.println("EIA-485 slave ready. Receiving...");

  // set the data rate for the SoftwareSerial port connected to the TTL to RS-485 module
  FirstSerial.begin(9600);
  // set Slave-Mode (not really necessary since this is the default library configuration)
  FirstMax485.setSlave();
} 

void loop() {
  FirstSerial.listen();
  while (FirstSerial.available() > 0) {
    char inByte = FirstSerial.read();
    Serial.write(inByte);
  }
}
