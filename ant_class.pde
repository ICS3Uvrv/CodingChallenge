class Ant {

  int[][] grid;
  int x;
  int y;
  int antUp = 0;
  int antRight = 1;
  int antDown = 2;
  int antLeft = 3;
  int dir = antUp;
  int colourChange = 0;
  float colA;
  float colB;
  float colC;

  public Ant(int antx, int anty) {
    x = antx;
    y = anty;
  }
  void run() {

    if (colourChange > 100) {
      colA = random(254);
      colB = random(254);
      colC = random(254);
      colourChange = 0;
    }
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
    //count of colour changing
    colourChange++;

    if (dir == antUp) {
      y--;
    } else if (dir == antRight) {
      x++;
    } else if (dir == antDown) {
      y++;
    } else if (dir == antLeft) {
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
    if (dir > antLeft) {
      dir = antUp;
    } else if (dir < antUp) {
      dir = antLeft;
    }
  }
  void decideC() {
    float q = random(100.0);
    if (q < 1) {
      dir--;
    } else if (q > 1) {
      dir++;
    }
    if (dir > antLeft) {
      dir = antUp;
    } else if (dir < antUp) {
      dir = antLeft;
    }
  }
}
