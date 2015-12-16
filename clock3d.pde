int timeInit;
boolean startFlag = false;
int old, resetFlag=0;
int rectWidth=0, rectHeight=20;
int x=2, y=100;

void setup() {
	size(800, 640, OPENGL);
	background(0);
	noStroke();
  textSize(70);
}

void draw() {
	ambientLight(63, 31, 31);
	directionalLight(255, 255, 255, -1, 0, 0);
	pointLight(63, 127, 255, mouseX, mouseY, 200);
	spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
  if(mousePressed) {
    startFlag = true;
    timeInit = millis();
  }
	int timeNow = millis() - timeInit;
  if(startFlag == true){
    if(preTime(timeNow) == 1){
      fill(0);
      rect(0, 400, 800, 100);
      fill(255);
      rectWidth = 0;
      pushMatrix();
      translate(x * 55, y, -20);
      rotateY(20);
      box(35, 35, 35);
      popMatrix();
      x++;
      if(x == 12){
        x = 2;
        y += 70;
      }
    }
    fill(0);
    rect(0, 540, 800, 100);
    fill(255);
    float m = timeNow / 1000.0;
    String str = nf(m, 2, 2);
    String[] ary = split(str, ".");
    text(ary[0]+":"+ary[1], 300, 540, 500, 100);
    rectWidth += 5;
    pushMatrix();
    translate(width/2, 440, -20);
    rotateX(20);
    box(rectWidth, 18, rectHeight);
    popMatrix();
  }
  else{
    fill(255);
    text("0:0", 350, 540, 700, 100);
  }
}

int preTime(int now){
	if(resetFlag == 0){
		old = now;
		resetFlag = 1;
	}
	else if(now - old >= 1000){
		resetFlag = 0;
		return 1;
	}
	return 0;
}