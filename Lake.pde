class Lake {
  // Other classes
  Fox fox;
  Rain[] hujan;
  Icon icon;
  
  // Audio
  SoundFile audioSpring;

  // Color palette
  color colorBush1 = #4C8F4F;
  color colorBush2 = #36784E;
  color colorFence = #352E3D;
  color colorLampLight = #FCC88D;
  color colorLampStructure = #24222E;
  color colorPath = #5A5A70;
  color colorRock = #828886;
  color colorSky = #AFCFC2;
  color colorTreeTrunk = #844344;
  color colorTreeBackdrop1 = #2D434D;
  color colorTreeBackdrop2 = #385450;
  color colorWater = #6A8A99;
  color colorWood1 = #DEB887;
  color colorWood2 = #A55B53;

  public Lake(Fox tempFox, Icon tempIcon, Rain[] hjn) {
    fox = tempFox;
    hujan = hjn;
    icon = tempIcon;
  }

  void begin() {

    background(#7CAB6D);

    // Scene controlling with the Fox
    boundaryControl();
    layerControl();
    bgmControl();

    // Interactables in the scene
    interactGoToCentralPark();
    interactBench();
    interactGazebo();
    interactSign();

    langit();
    hujan();
    jalanan();
    batu(0, 0, 30, 30);
    batu(20, 0, 50, 50);
    batu(50, 0, 40, 40);

    batu(-20, 40, 30, 30);
    batu(-40, 40, 50, 50);
    batu(-90, 60, 40, 40);

    batu(-80, 440, 30, 30);
    batu(-100, 440, 50, 50);
    batu(-140, 460, 40, 40);

    lake();

    semak(160, -40, 0, colorBush2, 1);
    semak(200, -40, 0, colorBush2, 1);
    semak(-20, -35, 0, colorBush2, 1);
    semak(20, -35, 0, colorBush2, 1);
    semak(60, -30, 0, colorBush1, 1);
    semak(100, -30, 0, colorBush1, 1);
    semak(-100, -30, 0, colorBush1, 1);

    batangPohonKecil(200, -320, colorTreeTrunk, 0.8);

    push();
    fill(colorTreeTrunk);
    quad(190, 120, 260, 0, 290, 0, 190, 140);
    fill(colorBush2);
    ellipse(40, 20, 100, 100);
    ellipse(70, 20, 100, 100);
    ellipse(110, 40, 100, 100);
    ellipse(150, 30, 100, 100);
    ellipse(190, 20, 120, 100);
    ellipse(230, 20, 90, 100);
    ellipse(270, 10, 100, 100);
    ellipse(310, 30, 100, 100);
    pop();

    semak(50, 60, 9, colorBush2, 2);
    semak(-100, 60, 9, colorBush1, 2);

    semak(-180, 150, 9, colorBush2, 2);
    semak(-140, 150, 9, colorBush2, 2);

    semak(0, 150, 9, colorBush1, 2);
    semak(40, 150, 9, colorBush1, 2);

    sign(0, 0, 5);
    gazebo(660, 250, 3);
    bench(650, 580, 7);
  }

  void langit() {
    push();
    {
      noStroke();
      fill(colorSky);
      rect(0, 0, width, 200);
      fill(colorTreeBackdrop1);
      for (int i = 0; i <= width / 30; i++) {
        arc(i * width / 30, 200, 60, 60, PI, TWO_PI);
      }
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
      fill(colorPath);
      vertex(0, 390);
      vertex(750, 390);
      vertex(750, 490);
      vertex(0, 490);
      endShape(CLOSE);
    }
    popMatrix();
  }
  void lake() {
    push();
    {
      fill(colorWater);
      ellipse(1250, 480, 850, 560);
    }
    pop();
  }

  void sign(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      pushMatrix();
      fill(colorWood1);
      rect(240, 305, 20, 60);
      rect(400, 305, 20, 60);
      fill(colorWood2);
      rect(220, 180, 220, 150, 10);
      fill(colorWood1);
      rect(240, 190, 180, 120, 5);

      // rect(x, y, width, height);
      rectMode(CENTER);
      popMatrix();
      push();
      stroke(colorFence);
      for (int i = 260; i < 410; i += 30){
        int i2 = (i - 260) / 30;
        strokeWeight(7);
        line(260 + i2 * 30, 230, 260 + i2 * 30 + 20, 230);
        strokeWeight(10);
        line(260 + i2 * 30, 250, 260 + i2 * 30 + 20, 250);
        strokeWeight(5);
        line(260 + i2 * 30, 270, 260 + i2 * 30 + 20, 270);
      }
      pop();
    }
    pop();
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

  void batu(int x, int y, int w, int h) {
    pushMatrix();
    {
      translate(x, y);
      fill(colorRock);
      arc(970, 235, w, h, PI, TWO_PI);
    }
    popMatrix();
  }

  void gazebo(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      scale(1.3);

      // Floor
      fill(colorWood1);
      ellipse(0, 0, 260, 60);

      // Back wall
      fill(colorTreeTrunk);
      beginShape();
      vertex(-130, 0);
      bezierVertex(-80, -25, -75, -30, 0, -30);
      bezierVertex(75, -30, 80, -25, 130, 0);
      vertex(130, -60);
      bezierVertex(80, -85, 75, -90, 0, -90);
      bezierVertex(-75, -90, -80, -85, -130, -60);
      endShape(CLOSE);

      for (int i = 0; i < 2; i++) {
        if (i == 1) {
          scale(-1, 1);
        }

        // Support columns
        fill(colorWood1);
        rect(-140, -160, 20, 220);
        rect(-80, -160, 20, 200);

        // Back columns shadow
        fill(0, 0, 0, 36);
        rect(-80, -160, 20, 200);

        // Front walls
        fill(colorWood2);
        beginShape();
        vertex(-130, 5);
        bezierVertex(-110, 22, -80, 25, -40, 30);
        vertex(-40, -30);
        bezierVertex(-80, -35, -110, -38, -130, -60);
        endShape(CLOSE);

        // Front support columns
        fill(colorWood1);
        rect(-70, -160, 20, 240);
      }

      // Darker-color stair
      fill(colorTreeTrunk);
      rect(-40, 25, 80, 20);
      rect(-60, 65, 120, 20);

      // Lighter-color stair
      fill(colorWood2);
      rect(-50, 45, 100, 20);

      // Roof
      fill(colorTreeTrunk);
      ellipse(0, -160, 280, 60);
      arc(0, -160, 280, 200, PI, TWO_PI);
    }
    pop();
  }

  void bench(int x, int y, int z) {
    push();
    {
      rectMode(CENTER);
      translate(x, y, z);

      // Sit area
      fill(colorWood1);
      rect(0, -10, 70, 100);

      // To recline
      fill(colorWood2);
      rect(-35, -60, 20, 100);

      // Support
      fill(colorTreeTrunk);
      rect(-35, 35, 20, 90);
      rect(25, 60, 20, 40);
      rect(0, 40, 70, 10);
    }
    pop();
  }

  // For controlling which object is in front of other objects
  void layerControl() {
    // Gazebo layer control
    if (fox.posY >= 295 && fox.posZ <= 3) {
      fox.posZ = 4;
    } else if (fox.posY < 300 && fox.posZ > 3) {
      fox.posZ = 2;
    }

    // Sign layer control
    if (fox.posY >= 355 && fox.posZ <= 5) {
      fox.posZ = 6;
    } else if (fox.posY < 360 && fox.posZ > 5) {
      fox.posZ = 4;
    }

    // Bench layer control
    if (fox.posY >= 550 && fox.posZ <= 7) {
      fox.posZ = 8;
    } else if (fox.posY < 555 && fox.posZ > 7) {
      fox.posZ = 6;
    }

    // Front bushes layer control
    if (fox.posY >= 595 && fox.posZ <= 9) {
      fox.posZ = 10;
    } else if (fox.posY < 600 && fox.posZ > 9) {
      fox.posZ = 8;
    }
  }

  // For controlling areas that isn't passable by the Fox
  void boundaryControl() {
    if (((fox.posX <= 350 && keyCode == LEFT) && fox.posY < 295) ||
      (fox.posX < 345 && (fox.posY <= 300 && keyCode == UP))) {
      // Top left boundary
      fox.stopWalk();
    } else if ((fox.posY <= 220 && keyCode == UP) || (fox.posY >= height - 50 && keyCode == DOWN)) {
      // Canvas boundary vertically
      fox.stopWalk();
    } else if ((fox.posX <= 50 && keyCode == LEFT) || (fox.posX >= 815 && keyCode == RIGHT)) {
      // Canvas boundary horizontally
      fox.stopWalk();
    } else if (((fox.posX <= 485 && keyCode == LEFT) && fox.posY > 555) ||
      (fox.posX < 480 && (fox.posY >= 550 && keyCode == DOWN))) {
      // Front bushes boundary
      fox.stopWalk();
    } else if (((fox.posX >= 450 && keyCode == RIGHT) && fox.posY < 360) ||
      (fox.posX > 455 && (fox.posY <= 365 && keyCode == UP))) {
      // Gazebo boundary
      fox.stopWalk();
    } else if (((fox.posX >= 205 && keyCode == RIGHT) && fox.posX < 445 && fox.posY < 375 && fox.posY > 335) ||
      (fox.posX > 210 && (fox.posX <= 450 && keyCode == LEFT) && fox.posY < 375 && fox.posY > 335) ||
      (fox.posX > 210 && fox.posX < 445 && (fox.posY <= 380 && keyCode == UP) && fox.posY > 335) ||
      (fox.posX > 210 && fox.posX < 445 && fox.posY < 375 && (fox.posY >= 330 && keyCode == DOWN))) {
      // Sign boundary
      fox.stopWalk();
    } else if (((fox.posX >= 580 && keyCode == RIGHT) && fox.posX < 705 && fox.posY < 660 && fox.posY > 535) ||
      (fox.posX > 585 && (fox.posX <= 710 && keyCode == LEFT) && fox.posY < 660 && fox.posY > 535) ||
      (fox.posX > 585 && fox.posX < 705 && (fox.posY <= 665 && keyCode == UP) && fox.posY > 535) ||
      (fox.posX > 585 && fox.posX < 705 && fox.posY < 660 && (fox.posY >= 530 && keyCode == DOWN))) {
      // Bench boundary
      fox.stopWalk();
    } else {
      fox.speed = fox.defaultSpeed;
    }
  }
  
  // For controlling background music
  void bgmControl() {
    if (!audioSpring.isPlaying()) {
      audioSpring.play();
    }
  }

  // Interactable: Go to the central park
  void interactGoToCentralPark() {
    if (fox.posX <= 60 && fox.posY >= 385 && fox.posY <= 500 && !fox.isFacingRight) {
      icon.arrowIcon(80, 240, 11, false);
      if (keyPressed && key == 32) { // Space
        SceneControl.currentScene = 1; // Go to central park
        fox.posX = 1200;
        fox.posY = 380;
        fox.isFacingRight = false;
      }
    }
  }
  
  // Interactable: Bench
  void interactBench() {
    if (fox.posX >= 690 && fox.posX <= 710 &&
      fox.posY >= 550 && fox.posY <= 670 && !fox.isFacingRight) {
      icon.exclamationIcon(630, 450, 13, true);
    }
  }
  
  // Interactable: Gazebo
  void interactGazebo() {
    if (fox.posX >= 600 && fox.posX <= 720 &&
      fox.posY >= 350 && fox.posY <= 375) {
      icon.exclamationIcon(660, 150, 13, true);
    }
  }
  
  // Interactable: Sign
  void interactSign() {
    if (fox.posX >= 240 && fox.posX <= 420 &&
      fox.posY >= 360 && fox.posY <= 380) {
      icon.exclamationIcon(330, 170, 13, true);
    }
  }
}
