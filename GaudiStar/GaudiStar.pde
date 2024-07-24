int maxLines = 50; // Total number of lines to draw in each quadrant
int linesDrawn = 0; // Number of lines drawn so far
int stepSize = 10; // Distance between lines

void setup() {
  size(1000, 1000); // Set the size of the window to 1000x1000 pixels
  frameRate(20); // Set the frame rate to 30 FPS
}

void draw() {
  background(255, 165, 0); // Orange background color
  translate(width / 2, height / 2); // Move the origin to the center
  stroke(0); // Set the stroke color

  // Draw lines in the upper right quadrant
  for (int i = 1; i <= linesDrawn; i++) {
    line(0, 500 - i * stepSize, i * stepSize, 0);
  }

  // Draw lines in the upper left quadrant
  for (int i = 1; i <= linesDrawn; i++) {
    line(0, 500 - i * stepSize, -i * stepSize, 0);
  }

  // Draw lines in the lower right quadrant
  for (int i = 1; i <= linesDrawn; i++) {
    line(0, -(500 - i * stepSize), i * stepSize, 0);
  }

  // Draw lines in the lower left quadrant
  for (int i = 1; i <= linesDrawn; i++) {
    line(0, -(500 - i * stepSize), -i * stepSize, 0);
  }

  // New vertical line from (0, 500) to (0, -500)
  line(0, 500, 0, -500);

  linesDrawn++; // Increment the number of lines drawn
  if (linesDrawn > maxLines) {
    linesDrawn = 0; // Reset after drawing all lines
  }
}
