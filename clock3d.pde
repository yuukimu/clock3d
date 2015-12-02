int timeInit;
int s_x=10, s_y=100;
int old, resetFlag=0;
int rectWidth=0, rectHeight=20;
int sec=1;

void setup() {
	size(512, 512, OPENGL);
	background(0);
	noStroke();
	//frameRate(60);
	timeInit = millis();
}

void draw() {
	ambientLight(63, 31, 31);
	directionalLight(255, 255, 255, -1, 0, 0);
	pointLight(63, 127, 255, mouseX, mouseY, 200);
	spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
  //println(mouseX + "," + mouseY);
  //camera(width/2, height/2, 100, width/2, height/2, -200, 0, 0, 0);
	int timeNow = millis() - timeInit;
	if(preTime(timeNow) == 1){
		fill(0);
		rect(0, 200, 512, 100);
		fill(255);
		rectWidth = 0;
    pushMatrix();
    translate(sec * 55, 100, -20);
    rotateY(20);
    box(35, 35, 35);
    popMatrix();
    sec++;
	}
	rectWidth += 5;
	pushMatrix();
  translate(width/2, height/2, -20);
  rotateX(20);
	box(rectWidth, 18, rectHeight);
  popMatrix();
	if(s_x > 500) s_x = 10;
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