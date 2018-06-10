Ant ant, ant1, ant2, ant3, ant4;
float dir;
float[] direct = new float[4];
int colourChange = 0;
int c = int(random(251, 255));
boolean pause;
class Ant {
  int[][] grid;
  int x, y;
  float colA = random(1, 254);
  float colB = random(1, 254);
  float colC = random(1, 254);
  Ant(int xTemp, int yTemp) {
    x = xTemp;
    y = yTemp;
  }
  void run() {
    color col = get(x, y);
    if (col == color(250, 250, c)) {
      decideC();
      stroke(colA, colB, colC);
      point(x, y);
    } else {
      decideW();
      stroke(250, 250, c);
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
    if (q > 1) {
      dir--;
    } else if (q < 1) {
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
    if (q < 1) {
      dir--;
    } else if (q > 1) {
      dir++;
    }
    if (int(dir) > direct[3]) {
      dir = direct[0];
    } else if (int(dir) < direct[0]) {
      dir = direct[3];
    }
  }
}
void setup() {
  ant = new Ant(int(random(width)), int(random(height)));
  ant1 = new Ant(int(random(width)), int(random(height)));
  ant2 = new Ant(int(random(width)), int(random(height)));
  ant3 = new Ant(int(random(width)), int(random(height)));
  ant4 = new Ant(int(random(width)), int(random(height)));
  size(800, 600);
  direct[0] = 0;
  direct[1] = 1;
  direct[2] = 2;
  direct[3] = 3;
  dir = direct[int(random(3))];
  background(250, 250, c);
}
void draw() {
  if (pause == false) {
    ant.run();
    ant1.run();
    ant2.run();
    ant3.run();
    ant4.run();
  }
}
void mouseClicked() {
  if (pause == false) {
    pause = true;
  } else {
    pause = false;
  }
}
