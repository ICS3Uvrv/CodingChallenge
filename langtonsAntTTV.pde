  int colourChange = 0;
  float colA;
  float colB;
  float colC;
ant a1 = new ant();

PImage ant;

void settings() {
  size(400, 400);
}

void setup() {
  background(255);
  ant = createImage(width, height, RGB);
  ant.loadPixels();
}

void draw() {
  a1.update();
  updatePixels();
}
