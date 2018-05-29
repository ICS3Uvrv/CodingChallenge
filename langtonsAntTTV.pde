int[][] grid;
int x;
int y;
int dir;
int colourChange = 0;
float a = 0.0;
float b = 0.0;
float c = 0.0;
float colA;
float colB;
float colC;

int antUp = 0;
int antRight = 1;
int antDown = 2;
int antLeft = 3;

PImage ant;

void settings() {
  size(400, 400);
}

void setup() {
  background(255);
  grid = new int[width][height];
  x = 200;
  y = 200;
  dir = antUp;
  colA = a;
  colB = b;
  colC = c;
  colourChange++;
  if (colourChange > 100) {
    a = random(255);
    b = random(255);
    c = random(255);
    colourChange = 0;
  }
}
//ant movement
void turnR() {
  dir++;
  if (dir > antLeft) {
    dir = antUp;
  }
}

void turnL() {
  dir--;
  if (dir < antUp) {
    dir = antLeft;
  }
}

void moveForward() {
  if (dir == antUp) {
    y--;
  } else if (dir == antRight) {
    x++;
  } else if (dir == antDown) {
    y++;
  } else if (dir == antLeft) {
    x--;
  }
  //greater than width
  if (x > width) {
    x = 0;
  } else if (x < 0) {
    x = width-1;
  }
  //greater than height
  if (y > height) {
    y = 0;
  } else if (y < 0) {
    y = height-1;
  }
}

void draw() {
  int antLocation = grid[x][y];

  if (antLocation == 0) {
    turnR();
    grid[x][y] = 1;
    moveForward();
  } else if (antLocation == 1) {
    turnL();
    grid[x][y] = 0;
    moveForward();
  }
  //colour block
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int pix = i * width + j;
      if (grid[i][j] == 0) {
        pixels[pix] = color(255);
      } else {
        pixels[pix] = color(colA, colB, colC);
      }
    }
  }
  updatePixels();
}
