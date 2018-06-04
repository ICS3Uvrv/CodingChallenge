class Ant {
  int[][] grid;
  int x = 200;
  int y = 200;
  int antUp = 0;
  int antRight = 1;
  int antDown = 2;
  int antLeft = 3;
  int dir = antUp;
  int colourChange = 0;
  float colA;
  float colB;
  float colC;
  int colposx = x;
  int colposy = y;
  public Ant(int posx, int posy) {
    colposx = posx;
    colposy = posy;
  }
  void run() {
    grid = new int[width][height];
    int antLocation = grid[x][y];
    if (antLocation == 0) {

      if (dir > antLeft) {
        dir = antUp;
      }
      grid[x][y] = 1;
      if (dir == antUp) {
        y--;
      } else if (dir == antRight) {
        x++;
      } else if (dir == antDown) {
        y++;
      } else if (dir == antLeft) {
        x--;
      }
      color col = get(colposx, colposy);
      if (col == color(255, 255, 255)) {
        dir--;
      }
      stroke(colA, colB, colC);
      point(colposx, colposy);
    } else if (antLocation == 1) {
      if (dir < antUp) {
        dir = antLeft;
      }
      grid[x][y] = 0;
      if (dir == antUp) {
        y--;
      } else if (dir == antRight) {
        x++;
      } else if (dir == antDown) {
        y++;
      } else if (dir == antLeft) {
        x--;
      }
      color col = get(colposx, colposy);
      if (col != color(255, 255, 255)) {
        dir++;
      }
      stroke(255);
      point(colposx, colposy);
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
    if (colourChange > 500) {
      colA = random(255);
      colB = random(255);
      colC = random(255);
      colourChange = 0;
    }
  }
}
