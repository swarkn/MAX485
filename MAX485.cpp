/*
  MAX485.cpp - A simple library for using the max485 EIA-485 driver IC from Maxim Integrated.
  Copyright 2016 Stefan Thema (swarkn), http://do-it-neat.com <swarkn@do-it-neat.com>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Arduino.h"
#include "MAX485.h"

MAX485::MAX485(int pinRE, int pinDE)
{
	pinMode(pinRE, OUTPUT);
	pinMode(pinDE, OUTPUT);
	_pinRE = pinRE;
	_pinDE = pinDE;
	// Default to Slave-Mode, receiving
	setSlave();
	sending(false);
}

void MAX485::setMaster()
{
	digitalWrite(_pinRE, HIGH);
}

boolean MAX485::isMaster()
{
	if (digitalRead(_pinRE))
	{
		return true;
	} else {
		return false;
	}
}

void MAX485::setSlave()
{
	digitalWrite(_pinRE, LOW);
}

boolean MAX485::isSlave()
{
	if (digitalRead(_pinRE))
	{
		return false;
	} else {
		return true;
	}
}

void MAX485::sending(boolean setCarrier)
{
	if (setCarrier)
	{
		digitalWrite(_pinDE, HIGH);
	} else {
		digitalWrite(_pinDE, LOW);
	}
}