void settings() {
  size(400, 400);
}
Ant ant;

void setup() {
  background(255);
  ant = new Ant((int)200, (int)200);
}

void draw() {
  ant.run();
}
