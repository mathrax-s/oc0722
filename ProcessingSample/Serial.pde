//Serial Communication

import processing.serial.*;
Serial myPort;

//USB-DEVICE
String portName = "usb";
int portNumber;


void serialOpen() {
  //findSerialPort(); 
  if (selectNum>=0) {
    myPort = new Serial(this, Serial.list()[selectNum], 115200); 
    myPort.setDTR(true);
    delay(1000);
    myPort.clear();
  }
}

String[] serialString;  
int serialCount = 0;
void findSerialPort() {
  boolean firstContact = false; 
  String serialCheck;  
  int serialIndex;  
  int unknown;

  unknown=0;
  serialString = Serial.list();  
  for (int i = serialString.length - 1; i > 0; i--) {  
    serialCheck = serialString[i];  
    serialIndex = serialCheck.indexOf(portName);  
    if (serialIndex > -1) {
      portNumber = i;
    } else {
      unknown=1;
    }
  }
  println(Serial.list());
}




void serialEvent (Serial p) {
  String stringData=myPort.readStringUntil(10);
  if (stringData!=null) {
    stringData=trim(stringData);
    int microbitData[]=int(split(stringData, ','));

    if (microbitData.length>=4) {

      bright[0]=microbitData[0];
      bright[1]=microbitData[1];
      bright[2]=microbitData[2];
      bright[3]=microbitData[3];
      bright[4]=microbitData[4];

      sendOscPd(microbitData[0], microbitData[1], microbitData[2], microbitData[3], microbitData[4]);

      //println(bright[0] + "\t"+bright[1]+ "\t"+bright[2]);
    }
  }  
  //if (myPort.available()>0) {
  //  int inByte = myPort.read();
  //  println(inByte);
  //  if (inByte=='0') {
  //    bright[0] = 1.0;
  //    sendOscSonicPi(notes[0]+72);
  //  }
  //  if (inByte=='1') {
  //    bright[1] = 1.0;
  //    sendOscSonicPi(notes[1]+72);
  //  }
  //  if (inByte=='2') {
  //    bright[2] = 1.0;
  //    sendOscSonicPi(notes[2]+72);
  //  }
  //}
}