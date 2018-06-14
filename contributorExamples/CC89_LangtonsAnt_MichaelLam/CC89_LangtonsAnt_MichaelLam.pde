// Michael Lam
// June 13, 2018
// Coding Challenge 89: Langton's Art

// Declaring variables
int[][] grid;
int x, y, dir, antUp = 0, antRight = 1, antDown = 2, antLeft = 3, colour = 0;
PImage ant;

// Changes:
// - Ant changes colour with each move, eventually creating a colourful canvas
// - Changed background colour
// - Increased speed of animation
// - Reversed ant's direction

// Initial setup
void setup() {
  fullScreen();
  grid = new int[width][height];
  ant = createImage(width, height, RGB);
  ant.loadPixels();
  for (int i = 0; i < ant.pixels.length; i++) {
    ant.pixels[i] = color(38);
  }
  ant.updatePixels();
  x = width/2;
  y = height/2;
  dir = antUp;
}

// Runs algorithm continuously
void draw() {
  ant.loadPixels();
  for (int n = 0; n < 100000; n++) {
    colour++;
    int state = grid[x][y];
    if (state == 0) {
      turnRight();
      grid[x][y] = 1;
    } else if (state == 1) {
      turnLeft();
      grid[x][y] = 0;
    }
    color col = color(255);
    if (grid[x][y] == 1) {
      col = color(colour);
    }
    int pix = x + y * ant.width;
    ant.pixels[pix] = col;
    moveForward();
  }
  ant.updatePixels();
  image(ant, 0, 0);
}

// Turns ant direction to the right
void turnRight() {
  dir++;
  if (dir > antLeft) {
    dir = antUp;
  }
}

// Turns ant direction to the left
void turnLeft() {
  dir--;
  if (dir < antUp) {
    dir = antLeft;
  }
}

// Moves the ant forward accordingly, without passing canvas borders
void moveForward() {
  if (dir == antUp) {
    y++;
  } else if (dir == antRight) {
    x--;
  } else if (dir == antDown) {
    y--;
  } else if (dir == antLeft) {
    x++;
  }
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
}