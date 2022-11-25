class Taman {
  // Other classes
  Fox fox;
  Hujan[] hujan;

  // Interactability: Roger
  PImage imageRoger;
  float imageRogerOpacity = 0;

  SoundFile audioRoger;
  float audioRogerAmp = 0.01;
  int waitToRoger = 0;
  boolean audioRogerHasPlayed = false;

  // Color palette
  color bush1 = #4C8F4F;
  color bush2 = #36784E;
  color fence = #352E3D;
  color lampLight = #FCC88D;
  color lampStructure = #24222E;
  color path = #5A5A70;
  color sky1 = #AFCFC2;
  color treeTrunk = #844344;
  color treeBackdrop1 = #2D434D;
  color treeBackdrop2 = #385450;
  color water = #6A8A99;

  public Taman(Fox tempFox, Hujan[] hjn) {
    fox = tempFox;
    hujan = hjn;
  }
  
  // Call this to play scene
  void begin() {
    background(#7CAB6D);

    // Scene controlling with the Fox
    boundaryControl();
    layerControl();

    // Interactables in the scene
    interactRoger();

    langit();

    hujan();
    jalanan();

    push();
    {
      fill(water);
      ellipse(440, 540, 300, 100);
      ellipse(470, 580, 200, 100);
      ellipse(570, 530, 200, 100);
    }
    pop();


    batangPohonKecil(200, -250, treeTrunk, 0.5);
    batangPohonKecil(600, -250, treeTrunk, 0.5);
    batangPohonKecil(800, -250, treeTrunk, 0.5);
    push();
    {
      fill(bush2);
      ellipse(40, 30, 100, 100);
      ellipse(70, 30, 100, 100);
      ellipse(110, 50, 100, 100);
      ellipse(150, 40, 100, 100);
      ellipse(190, 30, 120, 100);
      ellipse(230, 30, 100, 100);
      ellipse(270, 20, 100, 100);
      ellipse(310, 10, 100, 100);
      ellipse(350, 30, 120, 100);
      ellipse(390, 40, 100, 100);
      ellipse(430, 30, 120, 100);
    }
    pop();

    semak(160, -40, 0, bush2, 1);
    semak(200, -40, 0, bush2, 1);
    semak(-20, -35, 0, bush2, 1);
    semak(20, -35, 0, bush2, 1);
    semak(280, -35, 0, bush1, 1);
    semak(60, -30, 0, bush1, 1);
    semak(100, -30, 0, bush1, 1);
    semak(-100, -30, 0, bush1, 1);

    batangPohonKecil(1450, -260, treeTrunk, 0.5);
    batangPohonKecil(1750, -280, treeTrunk, 0.5);
    push();
    {
      fill(bush2);
      ellipse(700, 30, 100, 100);
      ellipse(740, 40, 100, 100);
      ellipse(780, 30, 100, 100);
      ellipse(820, 30, 100, 100);
      ellipse(860, 30, 100, 100);
      ellipse(900, 40, 100, 100);
      ellipse(920, 30, 100, 100);
    }
    pop();
    semak(600, -80, 0, bush2, 1);
    semak(520, -80, 0, bush1, 1);
    semak(680, -80, 0, bush1, 1);
    semak(720, -80, 0, bush1, 1);

    semak(-180, 150, 9, bush1, 2);
    semak(-140, 150, 9, bush1, 2);

    pagar(0, 0);

    lampu(500, 320, 3);
    lampu(50, 500, 5);

    semak(950, 60, 7, bush2, 2);
    semak(800, 60, 7, bush1, 2);

    batangPohonBesar(1100, -210, 7, treeTrunk, 1);
    push();
    {
      translate(0, 0, 8);
      fill(treeTrunk);
      quad(1070, 240, 950, 110, 980, 110, 1070, 170);
      fill(bush1);
      ellipse(970, 50, 200, 200);
      ellipse(1070, 25, 200, 200);
      ellipse(1170, 60, 200, 200);
      ellipse(1230, 60, 200, 200);
    }
    pop();
    sign(0, 0, 3);
  }

  void langit() {
    push();
    noStroke();
    fill(sky1);
    rect(0, 0, width, 200);
    fill(treeBackdrop1);
    for (int i = 0; i <= width / 30; i++) {
      arc(i * width / 30, 200, 60, 60, PI, TWO_PI);
    }

    for (int i = 0; i < 10; i++) {
      arc(i * width / 30, 200, 100, 100, PI, TWO_PI);
    }

    pop();
  }

  void hujan() {
    for (int i = 0; i < hujan.length; i++) {
      hujan[i].display();
    }
  }

  void jalanan() {
    pushMatrix();
    {
      beginShape();
      noStroke();
      fill(path);
      vertex(0, 340);
      vertex(1280, 340);
      vertex(1280, 460);
      vertex(0, 460);
      endShape(CLOSE);
    }
    popMatrix();
  }

  void semak(int x, int y, int z, color g, float scale) {
    //dibungkus pake quad
    pushMatrix();
    {
      translate(x, y, z);
      scale(scale);
      fill(g);
      circle(90, 260, 60);
      circle(120, 240, 60+15);
      circle(150, 235, 60+15);
      circle(180, 255, 60+10);
      quad(110, 260,
        165, 250,
        180, 290,
        95, 290);
    }
    popMatrix();
  }

  void batangPohonKecil(int x, int y, color b, float scale) {
    pushMatrix();
    {
      scale(scale);
      translate(x, y);
      fill(b);
      //pohon kanan
      beginShape();
      vertex(20, 300); // titik pertama
      bezierVertex(100, 250, 10, 480, 80, 680); // membuat agar baris / garis melengkung
      vertex(20, 680); // titik terakhir
      endShape();
      //pohon kiri
      beginShape();
      vertex(20, 300); // titik pertama
      bezierVertex(-100, 250, -10, 480, -80, 680); // membuat agar baris / garis melengkung
      vertex(20, 680); // titik terakhir
      endShape();
    }
    popMatrix();
  }

  void batangPohonBesar(int x, int y, int z, color b, float scale) {
    pushMatrix();
    {
      scale(scale);
      translate(x, y, z);
      fill(b);
      //pohon kanan
      beginShape();
      vertex(20, 300); // titik pertama
      bezierVertex(100, 250, 10, 680, 80, 880); // membuat agar baris / garis melengkung
      vertex(20, 880); // titik terakhir
      endShape();
      //pohon kiri
      beginShape();
      vertex(20, 300); // titik pertama
      bezierVertex(-100, 250, -10, 680, -80, 880); // membuat agar baris / garis melengkung
      vertex(20, 880); // titik terakhir
      endShape();
    }
    popMatrix();
  }

  void pagar(int x, int y) {
    push();
    {
      translate(x, y);
      strokeWeight(10);
      stroke(fence);
      for (int i = 0; i < 14; i++) {
        line(20 * i + 20 * i, 170, 20 * i + 20 * i, 270);
      }
      // for (int i = 0; i < 530; i+=40) {
      //   line(i, 170, i, 270);
      // }
      line(0, 170, 525, 170);
      line(0, 250, 525, 250);
    }
    pop();
  }

  void lampu(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      stroke(lampStructure);
      strokeWeight(15);
      line(0, 0, 0, -180);
      strokeWeight(4);
      rectMode(CENTER);
      fill(lampStructure);
      rect(0, -200, 40, 60, 20);
      fill(lampLight);
      rect(0, -200, 20, 40, 10);
    }
    pop();

    if (fox.posY >= y && fox.posZ <= z) {
      fox.posZ = z + 1;
    } else if (fox.posY < y && fox.posZ > z) {
      fox.posZ = z - 1;
    }
  }

  void sign(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      pushMatrix();
      fill(#DEB887);
      rect(690, 275, 20, 60);
      rect(850, 275, 20, 60);
      fill(#A55B53);
      rect(670, 150, 220, 150, 10);
      fill(#DEB887);
      rect(690, 160, 180, 120, 5);

      // rect(x, y, width, height);
      rectMode(CENTER);
      popMatrix();
    }
    pop();
  }

  // For controlling which object is in front of other objects
  void layerControl() {
    // Sign layer control
    if (fox.posY >= 300 && fox.posZ <= 3) {
      fox.posZ = 4;
    } else if (fox.posY < 325 && fox.posZ > 3) {
      fox.posZ = 2;
    }

    // Front tree and bushes layer control
    if (fox.posY >= 620 && fox.posZ <= 7) {
      fox.posZ = 8;
    } else if (fox.posY < 630 && fox.posZ > 7) {
      fox.posZ = 6;
    }
  }

  // For controlling areas that isn't passable by the Fox
  void boundaryControl() {
    if (fox.posY <= 275 && fox.posX <= 555 && (keyCode == LEFT || keyCode == UP)) {
      // Top left boundary
      fox.stopWalk();
    } else if ((fox.posY <= 220 && keyCode == UP) || (fox.posY >= height - 50 && keyCode == DOWN)) {
      // Canvas boundary vertically
      fox.stopWalk();
    } else if ((fox.posX <= 50 && keyCode == LEFT) || (fox.posX >= width - 50 && keyCode == RIGHT)) {
      // Canvas boundary horizontally
      fox.stopWalk();
    } else if (((fox.posX >= 620 && keyCode == RIGHT) && fox.posX < 920 && fox.posY < 340 && fox.posY > 300) ||
      (fox.posX > 650 && (fox.posX <= 920 && keyCode == LEFT) && fox.posY < 340 && fox.posY > 300) ||
      (fox.posX > 650 && fox.posX < 920 && (fox.posY <= 340 && keyCode == UP) && fox.posY > 300) ||
      (fox.posX > 650 && fox.posX < 920 && fox.posY < 330 && (fox.posY >= 300 && keyCode == DOWN))) {
      // Sign boundary
      fox.stopWalk();
    } else if (((fox.posX >= 915 && keyCode == RIGHT) && fox.posY < 650 && fox.posY > 590) ||
      (fox.posX > 925 && (fox.posY <= 655 && keyCode == UP) && fox.posY > 590) ||
      (fox.posX > 925 && fox.posY < 650 && (fox.posY >= 585 && keyCode == DOWN))) {
      // Front bush boundary
      fox.stopWalk();
    } else if ((fox.posX >= 1010 && keyCode == RIGHT) && fox.posY >= 590) {
      // Front tree boundary
      fox.stopWalk();
    } else {
      fox.speed = fox.defaultSpeed;
    }
  }

  // Interactable: Roger
  void interactRoger() {
    if (fox.posX >= 1000 && fox.posY >= 635 &&
      fox.currentState == fox.STATES[2] && !audioRoger.isPlaying() &&
      waitToRoger < 300) {
      // Fox is sitting
      fox.isFacingRight = false;
      waitToRoger++;
    } else if (fox.posX >= 1000 && fox.posY >= 635 &&
      fox.currentState == fox.STATES[2] && !audioRoger.isPlaying() &&
      waitToRoger >= 300 && !audioRogerHasPlayed) {
      // Cue Roger
      audioRoger.play();
      audioRogerHasPlayed = true;
    } else if (fox.currentState != fox.STATES[2]) {
      // If Fox is no longer sitting
      audioRoger.stop();
      audioRogerAmp = 0.01;
      waitToRoger = 0;
      imageRogerOpacity = 0;
      audioRogerHasPlayed = false;
    } else if (audioRoger.isPlaying()) {
      // Ease-in audio transition
      audioRoger.amp(audioRogerAmp);
      audioRogerAmp += 0.005;
      audioRogerAmp = min(0.5, audioRogerAmp);

      // Fade in image and text transition
      imageRogerOpacity += 1;
      imageRogerOpacity = min(255, imageRogerOpacity);
      push();
      {
        translate(0, 0, 99);
        tint(255, imageRogerOpacity);
        image(imageRoger, 0, 0);

        translate(0, 0, 1);
        textSize(128);
        textAlign(CENTER);
        fill(255, 255, 255, imageRogerOpacity);
        text("ROGER SUMATERA", width / 2, height - 64);
      }
      pop();
    }
  }
}
