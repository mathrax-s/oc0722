// Visual Synth Demo
// 2018.7.22

int maxSound = 5;

int[] bright = new int[maxSound];
int[] keys = {'a', 's', 'd', 'f', 'g'};
int[] notes ={2, 4, 7, 9, 11};
int status = 0;
int selectNum;
float x;
float[] lasty = new float[maxSound];

void setup() {
  size(800, 800);
  //fullScreen();
  findSerialPort();
  oscOpen();

  noStroke();
  colorMode(HSB);
  for (int i=0; i<maxSound; i++) {
    bright[i]=0;
  }
}

void draw() {
  switch(status) {
  case 0:
    background(0);

    selectNum=-1;
    for (int i=0; i<serialString.length; i++) {
      if (overRect(50, 95+50*i, width-100, 20)) {
        stroke(0, 255, 255);
        fill(0, 100, 255);
        selectNum=i;
      } else {
        stroke(0, 100, 255);
        noFill();
      }
      rect(50, 95+50*i, width-100, 20);

      fill(100, 100, 100);
      textAlign(CENTER, CENTER);
      textSize(20);
      text(serialString[i], width/2, 100+50*i);
    }

    //fill(0, 200, 110);
    //text("Select micro:bit", width/2, 550);
    break;

  case 1:
    fill(bright[1]*30, 250, 100, 20);
    noStroke();
    rect(0, 0, width, height);
    x+=3;
    if (x>width) {
      x=0;
    }
    for (int i=0; i<maxSound; i++) {
      stroke(i*50, 150, 255, 255);
      strokeWeight(2);
      fill(i*50, 150, 255, 255);
      ellipse(x, map(bright[i], 0, 1023, height, 0),10,10);
      line(x, lasty[i], x, map(bright[i], 0, 1023, height, 0));
      lasty[i] = map(bright[i], 0, 1023, height, 0);
      //bright[i]*=0.9;
      //fill(i*50, 150, 255, 255);
      //rect((width/maxSound)*i, height*bright[i], (width/maxSound), height*bright[i]);
    }

    break;
  }
}

void mousePressed() {
  if (status==0) {
    status=1;
    serialOpen();
    background(0);
    //} else if (status==1) {
    //  status=0;
  }
}

////Key Simulation
//void keyPressed() {
//  for (int i=0; i<maxSound; i++) {
//    if (key == keys[i]) {
//      bright[i] = 1.0;
//      sendOscSonicPi(notes[i]+72);
//    }
//  }
//}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}