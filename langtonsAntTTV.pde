float dir;
float[] direct = new float[4];
int colourChange = 0;
float antx = random(400);
float anty = random(400);
float colA;
float colB;
float colC;

class Ant {
  int[][] grid;
  int x;
  int y;

  public Ant(int antx, int anty) {
    x = antx;
    y = anty;
  }

  void run() {

    color col = get(x, y);
    if (col == color(255, 255, 255)) {
      ant.decideC();
      stroke(colA, colB, colC);
      point(x, y);
    } else {
      ant.decideW();
      stroke(255);
      point(x, y);
    }

    //out of bounds
    if (x > width-1) {
      x = 0;
    } else if (x < 0) {
      x = width-1;
    }
    if (y > height-1) {
      y = 0;
    } else if (y < 0) {
      y = height-1;
    }

    if (int(dir) == direct[0]) {
      y--;
    } else if (int(dir) == direct[1]) {
      x++;
    } else if (int(dir) == direct[2]) {
      y++;
    } else if (int(dir) == direct[3]) {
      x--;
    }
  }


  void decideW() {
    float q = random(100.0);
    if (q > 10) {
      dir--;
    } else if (q < 10) {
      dir++;
    }
    if (int(dir) > direct[3]) {
      dir = direct[0];
    } else if (int(dir) < direct[0]) {
      dir = direct[3];
    }
  }
  void decideC() {
    float q = random(100.0);
    if (q < 10) {
      dir--;
    } else if (q > 10) {
      dir++;
    }
    if (int(dir) > direct[3]) {
      dir = direct[0];
    } else if (int(dir) < direct[0]) {
      dir = direct[3];
    }
  }
}
Ant ant;
Ant ant1;
Ant ant2;
void setup() {
  ant = new Ant(int(random(width)), int(random(height)));
  ant1 = new Ant(int(random(width)), int(random(height)));
  ant2 = new Ant(int(random(width)), int(random(height)));
  size(400, 400);
  direct[0] = 0;
  direct[1] = 1;
  direct[2] = 2;
  direct[3] = 3;
  dir = direct[int(random(3))];
  background(255);
}

void draw() {
  for (int s = 0; s < 10; s++) {
    ant.run();
    ant1.run();
    ant2.run();
  }
  //count of colour changing
  colourChange++;
  if (colourChange > 100) {
    colA = random(254);
    colB = random(254);
    colC = random(254);
    colourChange = 0;
  }
}
