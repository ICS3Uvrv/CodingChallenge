void settings() {
  size(400, 400);
}
Ant ant;

void setup() {
  background(255);
  float antx = random(400);
  float anty = random(400);
  ant = new Ant(int(antx), int(anty));
}

void draw() {
  ant.run();
}
