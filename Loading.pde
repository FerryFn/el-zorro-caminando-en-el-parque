int w = 0;
int c = 0;
float titik = 0;

class Loading{
  void load(){
    background(#D6A447);
    fill(0);
    textSize(30);
    text("Loading", 590, 465);
    if (titik > 1) circle(697, 465, 2);
    if (titik > 2) circle(707, 465, 2);
    if (titik > 3) circle(717, 465, 2);
    if (titik > 4) titik= 0;
    titik = titik + 0.5;
    strokeWeight(2);
    noFill();
    rect(450, 400, 400, 30);
    fill(0);
    rect(452, 402, w, 27);
    w += 10;
    if (w > 400) {
      //w = 0;
      SceneControl.currentScene=1;
    }
    pushMatrix();
    {
      textSize(70);
      translate(600, 100, 0);
      for (c = 0; c < 45; c++) {
          translate(0, 0, 0.3);
          fill(0);
          text("El Zorro", -70, 150);
          text("Caminando", -120, 215);
          text("En El Parque", -135, 280);
      }
    }
    popMatrix();
  }
}
