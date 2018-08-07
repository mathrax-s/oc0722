import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void oscOpen() {
  oscP5 = new OscP5(this, 9999);
  myRemoteLocation = new NetAddress("localhost", 4002);
}

void sendOscSonicPi(int note) {
  OscMessage myMessage = new OscMessage("/trigger/channel0");
  myMessage.add(note); 
  oscP5.send(myMessage, myRemoteLocation);
}



void sendOscPd(int note0, int note1, int note2, int note3, int note4) {
  OscMessage myMessage = new OscMessage("/channel0");
  myMessage.add(note0); 
  myMessage.add(note1); 
  myMessage.add(note2); 
  myMessage.add(note3); 
  myMessage.add(note4); 
  oscP5.send(myMessage, myRemoteLocation);
}

/*
##| SonicPi Code
 live_loop :zoo do
 use_real_time
 a = sync "/osc/trigger/channel0"
 synth :beep, note: a,  release: 0.5
 end
 */