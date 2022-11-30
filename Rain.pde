class Rain {
  int x1;
  int y1;
  int x2;
  int y2;
  int s;

  public Rain(int x, int y, int sp) {
    x1 = x;
    y1 = y;
    s = sp;
  }

  void display() {
    y1 = y1 + s; // scales speed according to mouse position
    x2 = x1;
    y2 = y1 + 30; // length of raindrops, change if they're too long/short

    stroke(#404a9ff5);
    pushMatrix();
    translate(0, 0, 100);
    line(x1, y1, x2, y2); // draws raindrop
    popMatrix();

    if (y1 >= height) { // did the drop hit the ground?
      // renews the drop by sending it back to the top (no need to generate new ones)
      x1 = int(random(0, width));
      y1 = -120;
    }
  }
}
