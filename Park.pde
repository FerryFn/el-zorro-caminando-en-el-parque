class Park {
  // Other classes
  Fox fox;
  Icon icon;
  Rain[] rain;
  Sign sign;

  // Interactability: Roger
  PImage imageRoger;
  float imageRogerOpacity = 0;
  
  // Audio
  SoundFile audioRoger; // Roger scene
  float audioRogerAmp = 0.01;
  int waitToRoger = 0;
  boolean audioRogerHasPlayed = false;
  
  SoundFile audioSpring; // BGM

  // Color palette
  color colorBush1 = #4C8F4F;
  color colorBush2 = #36784E;
  color colorFence = #352E3D;
  color colorGround = #7CAB6D;
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

  // make a constructor for park
  public Park(Fox tempFox, Icon tempIcon, Rain[] tempRain, Sign tempSign) {
    fox = tempFox;
    rain = tempRain;
    icon = tempIcon;
    sign = tempSign;
  }

  // Call this to play scene
  void begin() {
    background(colorGround);

    // Scene controlling with the Fox
    firstTimeControl();
    boundaryControl();
    layerControl();
    bgmControl();

    // Interactables in the scene
    interactGoToLake();
    interactRoger();
    interactSign();
    interactPuddle();

    // Calling function Sky
    sky();
    // Calling function Rain
    raining();
    // Calling function Road
    road();

    // puddles
    push();
    {
      fill(colorWater);
      ellipse(440, 540, 300, 100);
      ellipse(470, 580, 200, 100);
      ellipse(570, 530, 200, 100);
    }
    pop();

    // Calling Function of small trunks
    smallTrunk(200, -250, colorTreeTrunk, 0.5);
    smallTrunk(600, -250, colorTreeTrunk, 0.5);
    smallTrunk(800, -250, colorTreeTrunk, 0.5);
    
    // leaf for tree
    push();
    {
      fill(colorBush2);
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
    
    // Calling Function Bushes
    bush(160, -40, 0, colorBush2, 1);
    bush(200, -40, 0, colorBush2, 1);
    bush(-20, -35, 0, colorBush2, 1);
    bush(20, -35, 0, colorBush2, 1);
    bush(280, -35, 0, colorBush1, 1);
    bush(60, -30, 0, colorBush1, 1);
    bush(100, -30, 0, colorBush1, 1);
    bush(-100, -30, 0, colorBush1, 1);

    // Calling Function of sec small trunks
    smallTrunk(1450, -260, colorTreeTrunk, 0.5);
    smallTrunk(1750, -280, colorTreeTrunk, 0.5);
    
    // leaf for tree
    push();
    {
      fill(colorBush2);
      ellipse(700, 30, 100, 100);
      ellipse(740, 40, 100, 100);
      ellipse(780, 30, 100, 100);
      ellipse(820, 30, 100, 100);
      ellipse(860, 30, 100, 100);
      ellipse(900, 40, 100, 100);
      ellipse(920, 30, 100, 100);
    }
    pop();

    // Calling Function of bushes
    bush(600, -80, 0, colorBush2, 1);
    bush(520, -80, 0, colorBush1, 1);
    bush(680, -80, 0, colorBush1, 1);
    bush(720, -80, 0, colorBush1, 1);

    bush(-180, 150, 9, colorBush1, 2);
    bush(-140, 150, 9, colorBush1, 2);

    // Calling Function Fence
    fence(0, 0);

    // Calling Function Park Lamp
    parkLamp(500, 320, 3);
    parkLamp(50, 500, 5);

    // Calling Function Bushes
    bush(950, 60, 7, colorBush2, 2);
    bush(800, 60, 7, colorBush1, 2);

    // Calling Function Big Trunk
    bigTrunk(1100, -210, 7, colorTreeTrunk, 1);
    push();
    {
      translate(0, 0, 8);
      //Trunk Branch
      fill(colorTreeTrunk);
      quad(1070, 240, 950, 110, 980, 110, 1070, 170);
      //Leaf for Tree
      fill(colorBush1);
      ellipse(970, 50, 200, 200);
      ellipse(1070, 25, 200, 200);
      ellipse(1170, 60, 200, 200);
      ellipse(1230, 60, 200, 200);
    }
    pop();
    // Calling Function Sign
    sign(0, 0, 3);
  }

  // display sky
  void sky() {
    push();
    noStroke();
    fill(colorSky);
    rect(0, 0, width, 200);
    fill(colorTreeBackdrop1);
    for (int i = 0; i <= width / 30; i++) {
      arc(i * width / 30, 200, 60, 60, PI, TWO_PI);
    }

    for (int i = 0; i < 10; i++) {
      arc(i * width / 30, 200, 100, 100, PI, TWO_PI);
    }

    pop();
  }
  // display rain
  void raining() {
    for (int i = 0; i < rain.length; i++) {
      // Calling the rain method from rain class and input the length to i
      rain[i].display();
    }
  }

  // display road
  void road() {
    pushMatrix();
    {
      beginShape();
      noStroke();
      fill(colorPath);
      vertex(0, 340);
      vertex(1280, 340);
      vertex(1280, 460);
      vertex(0, 460);
      endShape(CLOSE);
    }
    popMatrix();
  }

  // Display Bush
  void bush(int x, int y, int z, color g, float scale) {
    // wrapped with quad
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

  //Display small trunk
  void smallTrunk(int x, int y, color b, float scale) {
    pushMatrix();
    {
      scale(scale);
      translate(x, y);
      fill(b);
      // right trunk
      beginShape();
      vertex(20, 300); // first point
      bezierVertex(100, 250, 10, 480, 80, 680); // membuat agar baris / garis melengkung
      vertex(20, 680); // last point
      endShape();
      // left trunk
      beginShape();
      vertex(20, 300); // first point
      bezierVertex(-100, 250, -10, 480, -80, 680); // membuat agar baris / garis melengkung
      vertex(20, 680); // titik terakhir
      endShape();
    }
    popMatrix();
  }

  //display big trunk
  void bigTrunk(int x, int y, int z, color b, float scale) {
    pushMatrix();
    {
      scale(scale);
      translate(x, y, z);
      fill(b);
      // right trunk
      beginShape();
      vertex(20, 300); // first point
      bezierVertex(100, 250, 10, 680, 80, 880); // membuat agar baris / garis melengkung
      vertex(20, 880); // last point
      endShape();
      // left trunk
      beginShape();
      vertex(20, 300); // first point
      bezierVertex(-100, 250, -10, 680, -80, 880); // membuat agar baris / garis melengkung
      vertex(20, 880); // last point
      endShape();
    }
    popMatrix();
  }

  // display fence
  void fence(int x, int y) {
    push();
    {
      translate(x, y);
      strokeWeight(10);
      stroke(colorFence);
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

  // display park lamp
  void parkLamp(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      stroke(colorLampStructure);
      strokeWeight(15);
      line(0, 0, 0, -180);
      strokeWeight(4);
      rectMode(CENTER);
      fill(colorLampStructure);
      rect(0, -200, 40, 60, 20);
      fill(colorLampLight);
      rect(0, -200, 20, 40, 10);
    }
    pop();

    if (fox.posY >= y && fox.posZ <= z) {
      fox.posZ = z + 1;
    } else if (fox.posY < y && fox.posZ > z) {
      fox.posZ = z - 1;
    }
  }

  // display sign
  void sign(int x, int y, int z) {
    push();
    {
      translate(x, y, z);
      pushMatrix();
      fill(colorWood1);
      rect(690, 275, 20, 60);
      rect(850, 275, 20, 60);
      fill(colorWood2);
      rect(670, 150, 220, 150, 10);
      fill(colorWood1);
      rect(690, 160, 180, 120, 5);

      // rect(x, y, width, height);
      rectMode(CENTER);

      popMatrix();
      push();
      stroke(colorFence);
      for (int i = 710; i < 860; i += 30){
        int i2 = (i - 710) / 30;
        strokeWeight(7);
        line(710 + i2 * 30, 200, 710 + i2 * 30 + 20, 200);
        strokeWeight(10);
        line(710 + i2 * 30, 220, 710 + i2 * 30 + 20, 220);
        strokeWeight(5);
        line(710 + i2 * 30, 240, 710 + i2 * 30 + 20, 240);
      }
      pop();
    }
    pop();
  }
  
  // For controlling first time play transition
  // (Fox walking into the screen)
  void firstTimeControl() {
    if (SceneControl.isFirstTimePlayed) {
      fox.canControlFox = false;
      fox.currentState = fox.STATES[1];
      fox.posX += 2;
      if (fox.posX >= 100) {
        fox.canControlFox = true;
        SceneControl.isFirstTimePlayed = false;
      }
    }
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
    if (((fox.posX <= 555 && keyCode == LEFT) && fox.posY < 270) ||
    (fox.posX < 555 && (fox.posY <= 275 && keyCode == UP))) {
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
    } else if (((fox.posX >= 480 && keyCode == RIGHT) && fox.posX < 515 && fox.posY < 325 && fox.posY > 315) ||
      (fox.posX > 485 && (fox.posX <= 520 && keyCode == LEFT) && fox.posY < 325 && fox.posY > 315) ||
      (fox.posX > 485 && fox.posX < 515 && (fox.posY <= 330 && keyCode == UP) && fox.posY > 315) ||
      (fox.posX > 485 && fox.posX < 515 && fox.posY < 325 && (fox.posY >= 310 && keyCode == DOWN))) {
      // Back lamp boundary
      fox.stopWalk();
    } else if (((fox.posX >= 0 && keyCode == RIGHT) && fox.posX < 65 && fox.posY < 505 && fox.posY > 485) ||
      (fox.posX > 5 && (fox.posX <= 70 && keyCode == LEFT) && fox.posY < 505 && fox.posY > 485) ||
      (fox.posX > 5 && fox.posX < 65 && (fox.posY <= 510 && keyCode == UP) && fox.posY > 485) ||
      (fox.posX > 5 && fox.posX < 65 && fox.posY < 505 && (fox.posY >= 480 && keyCode == DOWN))) {
      // Front lamp boundary
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
  
  // For controlling bgm
  void bgmControl() {
    // Play BGM
    if (!audioSpring.isPlaying() && !audioRoger.isPlaying()) {
      audioSpring.play();
    }
    
    // Pause BGM when Roger's plays
    if (audioRoger.isPlaying()) {
      audioSpring.pause();
    }
  }

  // Interactable: Go to the lake
  void interactGoToLake() {
    if (fox.posX >= 1200 && fox.posY >= 340 && fox.posY <= 460 && fox.isFacingRight) {
      icon.arrowIcon(1200, 210, 11, true);
      if (key == 32) { // Space
        SceneControl.currentScene = 2; // Go to lake
        fox.posX = 64;
        fox.posY = 440;
        fox.isFacingRight = true;
      }
    }
  }

  // Interactable: Roger
  void interactRoger() {
    if (fox.posX >= 1000 && fox.posY >= 635 &&
      !audioRoger.isPlaying() && waitToRoger < 300) {
      if (fox.currentState == fox.STATES[2] || (keyPressed && key == 32)) { // Space
        // Fox is sitting
        fox.currentState = fox.STATES[2];
        fox.isFacingRight = false;
        waitToRoger++;
      } else {
        icon.exclamationIcon(1015, 460, 11, true);
      }
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

  // Interactable: Sign
  void interactSign() {
    if (fox.posX >= 685 && fox.posX <= 875 &&
      fox.posY >= 330 && fox.posY <= 340) {
      if (key == 32) { // Space
        sign.showSign("DANAU 500M KE ARAH TIMUR");
      } else {
        icon.exclamationIcon(775, 150, 11, true);
      }
    }
  }

  // Interactable: Puddle
  void interactPuddle() {
    if (fox.posX >= 375 && fox.posX <= 570 &&
      fox.posY >= 500 && fox.posY <= 610) {
      if (fox.currentState == fox.STATES[3] || (keyPressed && key == 32)) { // Space
        // Fox is jumping
        fox.currentState = fox.STATES[3];
      } else {
        icon.exclamationIcon(475, 330, 11, true);
      }
    }
  }
}
