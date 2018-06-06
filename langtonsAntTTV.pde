float antx = random(400);
float anty = random(400);
float ant1x = random(400);
float ant1y = random(400);
void settings() {
  size(400, 400);
}
Ant ant;
Ant ant1;
void setup() {
  background(255);

  ant = new Ant(int(antx), int(anty));
  ant1 = new Ant(int(ant1x), int(ant1y));
}

void draw() {
  ant.run();
  ant1.run();
}
