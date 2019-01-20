//
// Copyright 2015 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// FirebaseDemo_ESP8266 is a sample that demo the different functions
// of the FirebaseArduino API.

#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <OneWire.h>
#include <DallasTemperature.h>

// Set these to run example.
#define FIREBASE_HOST "test-de47e.firebaseio.com"
#define FIREBASE_AUTH "G4RM5PNSqf0R89dMvoRf7HJLLZx538dvZ97jYp4r"
#define WIFI_SSID "AstaJake"
#define WIFI_PASSWORD "vgyvgy789"
// Data wire is plugged into port 2 on the Arduino
#define ONE_WIRE_BUS 5
#include <NTPtimeESP.h>

 // Choose server pool as required
NTPtime NTPch("ch.pool.ntp.org");  
// Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature.
DallasTemperature sensors(&oneWire);

// arrays to hold device address
DeviceAddress insideThermometer;
int willConnect;
int mostRecentTemp;
strDateTime dateTime;


void setup() {
  Serial.begin(9600);



  //DallasTemp
  Serial.print("Locating devices...");
  sensors.begin();
  Serial.print("Found ");
  Serial.print(sensors.getDeviceCount(), DEC);
  Serial.println(" devices.");

  // report parasite power requirements
  if (sensors.isParasitePowerMode()) Serial.println("ON");
  else Serial.println("OFF");
  if (!sensors.getAddress(insideThermometer, 0)) {
    sensors.setResolution(insideThermometer, 9);
  }

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
    while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  //firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

int printTemperature(DeviceAddress deviceAddress)
{
  float tempC = sensors.getTempC(deviceAddress);
  Serial.print("Temp C: ");
  Serial.println(tempC);
  int TempC = sensors.getTempC(deviceAddress);
  return TempC;
}

float getTemp() {
  //SensorData
  sensors.requestTemperatures();
  Serial.println("DONE");
  float tempToSend =   printTemperature(insideThermometer);
  return tempToSend;
}


void loop() {
   dateTime = NTPch.getNTPtime(1.0, 1);

  // check dateTime.valid before using the returned time
  // Use "setSendInterval" or "setRecvTimeout" if required
  if(dateTime.valid){
    NTPch.printDateTime(dateTime);

    byte actualHour = dateTime.hour;
    byte actualMinute = dateTime.minute;
    byte actualsecond = dateTime.second;
    int actualyear = dateTime.year;
    byte actualMonth = dateTime.month;
    byte actualday = dateTime.day;
    byte actualdayofWeek = dateTime.dayofWeek;
  }
  int testa = dateTime.hour;
  Serial.println(testa);
  //Firebase upplload
  Firebase.setInt("logs", getTemp());
  Serial.println("Uploaded");
  if (Firebase.failed())
  {
    Serial.println(Firebase.error());
  }
  mostRecentTemp = getTemp();
  ESP.deepSleep(10e6);
}
