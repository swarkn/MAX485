/*
  Demo: How to use the simple MAX485-library for the max485 EIA-485 driver IC from Maxim Integrated.
  Copyright 2016 Stefan Thema (swarkn), http://do-it-neat.com <swarkn@do-it-neat.com>
  
  Upload this Sketch on your Arduino/Genuino Uno or Nano to use it as a EIA-485 sending master device.
*/

#include <SoftwareSerial.h>
#include <MAX485.h>

// Setup SoftSerial Port to send TTL data to driver 
SoftwareSerial FirstSerial(10, 11); // RX(10)->RO, TX(11)->DI
// Setup max485 Control Input
MAX485 FirstMax485(8, 9); // 8->RE, 9->DE

int i = 0;

void setup() {
  // set the data rate for the SoftwareSerial port connected to the TTL to RS-485 module
  FirstSerial.begin(9600);
  // set Master-Mode
  FirstMax485.setMaster();
}

void loop() {
  i ++;
  // set carrier
  FirstMax485.sending(true);
  // send to SoftSerial
  FirstSerial.print("Master speaking, message number: ");
  FirstSerial.println(i);
  // lower carrier
  FirstMax485.sending(false);
  delay(500);
}
