int[][] grid;
int x;
int y;
int dir;
int antUp = 0;
int antRight = 1;
int antDown = 2;
int antLeft = 3;

void settings() {
  size(400, 400);
}

void turnR() {
}

void turnL() {
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
}

void setup() {
  background(255);
  grid = new int[width][height];
  x = 200;
  y = 200;
  dir = antUp;
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
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int pix = i * width + j;
      pixels[pix] = color(random(255));
    }
  }
  updatePixels();
}
