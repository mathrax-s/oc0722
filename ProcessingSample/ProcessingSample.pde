// Visual Synth Demo
// 2018.7.22

int maxSound = 3;

float[] bright = new float[maxSound];
int[] keys = {'a', 's', 'd'};
int[] notes ={2, 4, 7};

void setup() {
  size(600, 600);
  //fullScreen();
  serialOpen();
  oscOpen();

  noStroke();
  colorMode(HSB);
  for (int i=0; i<maxSound; i++) {
    bright[i]=0;
  }
}

void draw() {
  background(30, 40, 255);

  for (int i=0; i<maxSound; i++) {
    bright[i]*=0.9;
    fill(i*50, 150, 255, 255);
    rect((width/maxSound)*i, height*bright[i], (width/maxSound), height*bright[i]);
  }
}

//Key Simulation
void keyPressed() {
  for (int i=0; i<maxSound; i++) {
    if (key == keys[i]) {
      bright[i] = 1.0;
      sendOscSonicPi(notes[i]+72);
    }
  }
}