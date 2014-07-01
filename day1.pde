
float x, y;
int rectWidth, rectHeight, size;

void setup()
{
  size(612, 612);
  background(255);
  frameRate(10);
}

void draw()
{
  drawRects(1.5);
  drawEllipses();
}

void drawRects(float index)
{
  for(int i = 0; i <= width; i += random(10 + index, 50))
  {
    x = noise(i);
    y = cos(x);
    size += index;
    rectWidth = size;
    rectHeight = size;
    color c = color(random(255), noise(255), size / index);
    rect(size + random(x), size + noise(y), rectWidth, rectHeight);
    fill(c);
    noStroke();
    println(i);
    for(int z = 0; z <= 50; z++)
    {
      x += 1;
      y *= 1.2;
      rect(size + random(z), size + sin(z), random(100), sin(rectHeight));
      rotate(cos(size));
    }
  } 
}

void drawEllipses()
{
  for(int i = 0; i <= width / 2; i += random(2))
  {
    x = i;
    y += cos(100) / noise(x); 
    size += noise(y+x);
    rectWidth = size;
    rectHeight = size;
    ellipse(y * y, size + noise(100), rectWidth / 80, rectHeight / 80);
    fill(random(255), noise(255), size / x);
    noStroke();
  } 
}


void keyPressed() {
  if (key == 's') {
    saveFrame("data/frame-#####.png");
    println("image saved");
  } 
  else {
    println("key " + key + " pressed.");
  }
}
