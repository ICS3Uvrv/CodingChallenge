class ant {
  int[][] grid;
  int x;
  int y;
  int dir;

  int antUp = 0;
  int antRight = 1;
  int antDown = 2;
  int antLeft = 3;
  void update() {
    grid = new int[width][height];
    x = 200;
    y = 200;
    dir = antUp;
    colourChange++;
    if (colourChange > 500) {
      colA = random(255);
      colB = random(255);
      colC = random(255);
      colourChange = 0;
    }
    int antLocation = grid[x][y];
    if (antLocation == 0) {
      dir++;
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
    } else if (antLocation == 1) {
      dir--;
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
    }
    //greater than width
    if (x > width-1) {
      x = 0;
    } else if (x < 0) {
      x = width-1;
    }
    //greater than height
    if (y > height-1) {
      y = 0;
    } else if (y < 0) {
      y = height-1;
    }
    loadPixels();
    if(x < width){
    if(y < height){
    x++;
    y++;
        int pix = x + width * y;
        if (grid[x][y] == 0) {
          pixels[pix] = color(255);
        } else {
          pixels[pix] = color(colA, colB, colC);
        }
      }
    }
    
  }
}
