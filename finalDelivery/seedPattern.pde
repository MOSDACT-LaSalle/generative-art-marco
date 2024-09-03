/*---------------------------------
 Author: Marco Kornke
 Date: 03. September 2024
 Title:  Phyllotaxis algorithm (Plant inspired pattern)
 Description:
The Phyllotaxis algorithm arranges points in a spiral pattern 
using the golden angle to create visually pleasing and naturally 
occurring distributions, mimicking seed arrangements in plants.

 -----------------------------------*/

int n = 0;
float c = 8;  // scaling factor
float angleIncrement = 137.5; // The golden angle in degrees
color startColor, endColor;  // Colors for gradient
float sizeOffset;
float time = 0;  // Time variable to create dynamic movement

void setup() {
size(800, 800);
background(0);
colorMode(HSB, 255);  // Use HSB color mode for a colorful pattern
startColor = color(random(255), 255, 255);  // Random start color
endColor = color(random(255), 255, 255);  // Random end color
sizeOffset = random(5, 10);  // Random initial size for dynamic growth
}

void draw() {
float a = radians(n * angleIncrement);
float r = c * sqrt(n);

// Calculate position with orbiting effect
float orbitX = sin(time + a) * 20;
float orbitY = cos(time + a) * 20;
float x = r * cos(a) + width / 2 + orbitX;
float y = r * sin(a) + height / 2 + orbitY;

// Interpolate between startColor and endColor
float t = map(n, 0, 500, 0, 1);  // Map 'n' to a range between 0 and 1
color currentColor = lerpColor(startColor, endColor, t);

float circleSize = sizeOffset + sin(time + n * 0.1) * 5;  // Dynamic circle size variation

fill(currentColor);
noStroke();

// Draw a circle with dynamic size
ellipse(x, y, circleSize, circleSize);

n++;
time += 0.01;  // Gradually increase the time variable to create continuous motion

// Stop the sketch when points reach bounds of canvas
if (r > width / 2) {
noLoop();
}
}
