class Fox {
  // Fox state animations
  final String[] STATES = {
    "idle",
    "walking",
    "sitting",
  };

  // Variabel pengatur rubah
  int speed = 4;
  int defaultSpeed = 4;
  boolean isFacingRight = true;

  // Variabel untuk posisi rubah pada kanvas
  int posX = 0;
  int posY = 0;
  int posZ = 2;
  String currentState = STATES[1];
  
  // Variabel untuk posisi rubah tanpa mengubah posisi aslinya
  int relativePosY = 0;

  // Variabel untuk animasi gerakan tangan
  float rightArmRotate = 0;
  float leftArmRotate = 0;
  boolean rightArmRotationIsClockwise = true;

  // Variabel untuk animasi gerakan kaki
  float rightKneePosX = 10;
  float rightKneePosY = 20;
  float rightFootPosX = 20;
  float rightFootPosY = 40;
  float rightLegRotate = 0;

  float leftKneePosX = 0;
  float leftKneePosY = 20;
  float leftFootPosX = 0;
  float leftFootPosY = 40;
  float leftLegRotate = 0;

  int rightWalkCycle = 0;
  int leftWalkCycle = 0;

  // Variabel untuk animasi gerakan kepala mengangguk
  float headRadians = 0;
  boolean headRotationIsClockwise = true;

  // Variabel untuk animasi gerakan naik-turun badan
  float bodyPosYRelative = 0;
  boolean bodyIsGoingDownward = true;

  // Variabel untuk animasi kedipan mata
  int timeToWink = 0; // Waktu yang berjalan sebelum proses kedipan
  boolean isWinking = false; // Jika sedang melakukan kedipan
  boolean eyeIsClosing = false; // Apabila mata akan menutup
  int eyeHeight = 25; // Tinggi mata untuk animasi kedipan

  // Kontrol gerakan rubah dari inputan user
  void control() {
    if (keyPressed) {
      if (keyCode == RIGHT) {
        posX += speed;
        currentState = STATES[1];
        isFacingRight = true;
      } else if (keyCode == LEFT) {
        posX -= speed;
        currentState = STATES[1];
        isFacingRight = false;
      } else if (keyCode == UP) {
        posY -= speed;
        currentState = STATES[1];
      } else if (keyCode == DOWN) {
        posY += speed;
        currentState = STATES[1];
      } else if (key == 32) { // Space
        rightArmRotate = 0;
        leftArmRotate = 0;
        currentState = STATES[2];
      }
    } else if (currentState != STATES[2]) {
      rightWalkCycle = 0;
      leftWalkCycle = 0;
      bodyPosYRelative = 0;
      currentState = STATES[0];
    }
  }
  
  // Menghentikan posisi jalan rubah
  void stopWalk() {
    speed = 0;
  }

  // Menampilkan rubah sesuai state
  void display() {
    pushMatrix();
    {
      translate(posX, posY, posZ); // Posisi rubah
      scale(0.7); // Ukuran rubah
      // Arah jalan rubah
      if (isFacingRight) {
        scale(1, 1);
      } else {
        scale(-1, 1);
      }

      if (currentState == STATES[0]) {
        // Status: diam berdiri
        rightKneePosX = 0;
        rightKneePosY = 20;
        rightFootPosX = 0;
        rightFootPosY = 40;
        rightLegRotate = 0;

        leftKneePosX = 0;
        leftKneePosY = 20;
        leftFootPosX = 0;
        leftFootPosY = 40;
        leftLegRotate = 0;

        bodyPosYRelative = 0;

        blinking();
        idle();
      } else if (currentState == STATES[1]) {
        // Status: berjalan
        rightLegRotate = 0;
        leftLegRotate = 0;

        blinking();
        walk();
      } else if (currentState == STATES[2]) {
        // Status: duduk
        sitting();
      }
    }
    popMatrix();
  }

  // Animasi berkedip
  void blinking() {
    if (!isWinking) {
      timeToWink++;
      if (timeToWink >= 180) {
        // Memberi tahu bahwa rubah sedang berkedip
        isWinking = true;
        // Mengaktifkan animasi menutup mata
        eyeIsClosing = true;
        // Mereset waktu untuk berkedip
        timeToWink = 0;
      }
    }

    // Apabila isWinking aktif,
    // rubah akan melakukan animasi berkedip
    if (isWinking) {
      // Bila menutup, tinggi matanya berkurang dan sebaliknya
      eyeHeight += !eyeIsClosing ? 5 : -5;

      // Apabila mata sudah menutup, akan dilakukan
      // animasi untuk membuka mata
      if (eyeHeight <= 0) {
        eyeIsClosing = false;
      }

      // Apabila sudah membuka mata, akan menunggu waktu
      // untuk kedipan selanjutnya
      if (!eyeIsClosing && eyeHeight >= 25) {
        isWinking = false;
      }
    }
  }

  // Status: diam
  void idle() {
    _idleController();
    _body();

    // Menggeser kepala, dan animasi menggerakkan kepala
    pushMatrix();
    {
      translate(0, -120);
      rotate(radians(headRadians));
      _head();
    }
    popMatrix();
  }

  // Pengatur animasi diam
  private void _idleController() {
    // Pengatur animasi gerakan kepala
    headRadians += headRotationIsClockwise ? 0.1 : -0.1;
    if (headRadians > 2.5) {
      headRotationIsClockwise = false;
    } else if (headRadians < -2.5) {
      headRotationIsClockwise = true;
    }

    // Pengatur animasi gerakan tangan
    rightArmRotate += rightArmRotationIsClockwise ? 0.3 : -0.3;
    leftArmRotate += !rightArmRotationIsClockwise ? 0.3 : -0.3;
    if (rightArmRotate > 10) {
      rightArmRotationIsClockwise = false;
    } else if (rightArmRotate < -10) {
      rightArmRotationIsClockwise = true;
    }
  }

  // Status: berjalan
  void walk() {
    _walkController();
    _body();

    // Menggeser kepala dan animasi menggerakkan kepala
    pushMatrix();
    {
      translate(0, -120);
      rotate(radians(headRadians));
      _head();
    }
    popMatrix();
  }

  private void _walkController() {

    // Pengatur animasi gerakan kepala
    headRadians += headRotationIsClockwise ? 0.3 : -0.3;
    if (headRadians > 3) {
      headRotationIsClockwise = false;
    } else if (headRadians < -3) {
      headRotationIsClockwise = true;
    }

    // Pengatur animasi gerakan badan saat berjalan
    bodyPosYRelative += bodyIsGoingDownward ? 0.25 : -0.25;
    if (bodyPosYRelative > 3) {
      bodyIsGoingDownward = false;
    } else if (bodyPosYRelative < -3) {
      bodyIsGoingDownward = true;
    }

    // Pengatur animasi gerakan tangan
    rightArmRotate += rightArmRotationIsClockwise ? 2 : -2;
    leftArmRotate += !rightArmRotationIsClockwise ? 2 : -2;
    if (rightArmRotate > 25) {
      rightArmRotationIsClockwise = false;
    } else if (rightArmRotate < -45) {
      rightArmRotationIsClockwise = true;
    }

    // Pengatur animasi siklus berjalan untuk kaki kanan
    if (rightWalkCycle == 0) {
      // Arah kaki di depan
      rightKneePosX = 10;
      rightKneePosY = 20;
      rightFootPosX = 20;
      rightFootPosY = 40;

      rightWalkCycle = 1; // Ke siklus berjalan selanjutnya
    } else if (rightWalkCycle == 1) {
      // Animasi menggerakkan kaki ke belakang
      rightKneePosX -= 0.4;
      rightKneePosY += 0.1;
      rightFootPosX -= 1.2;
      rightFootPosY += 0.2;
      rightFootPosY = min(40, rightFootPosY);

      if (rightFootPosX <= -10) {
        rightWalkCycle = 2;  // Ke siklus berjalan selanjutnya
      }
    } else if (rightWalkCycle == 2) {
      // Animasi menarik kaki ke atas
      rightKneePosY -= 0.5;
      rightFootPosY -= 1;

      if (rightFootPosY <= 30) {
        rightWalkCycle = 3;  // Ke siklus berjalan selanjutnya
      }
    } else if (rightWalkCycle == 3) {
      // Animasi menggerakkan kaki ke depan
      rightKneePosX += 0.4;
      rightKneePosY += 0.5;
      rightFootPosX += 1.2;
      rightFootPosY += 0.2;
      rightKneePosX = min(10, rightKneePosX);
      rightKneePosY = min(20, rightKneePosY);

      if (rightFootPosX >= 20) {
        rightWalkCycle = 0;  // Mereset siklus berjalan
      }
    }

    // Pengatur animasi siklus berjalan untuk kaki kiri
    if (leftWalkCycle == 0) {
      // Arah kaki di belakang
      leftKneePosX = 0;
      leftKneePosY = 20;
      leftFootPosX = -10;
      leftFootPosY = 35;

      leftWalkCycle = 1; // Ke siklus berjalan selanjutnya
    } else if (leftWalkCycle == 1) {
      // Animasi menggerakkan kaki ke depan
      leftKneePosX += 0.4;
      leftKneePosY += 0.5;
      leftFootPosX += 1.2;
      leftFootPosY += 0.2;
      leftKneePosX = min(10, leftKneePosX);
      leftKneePosY = min(20, leftKneePosY);

      if (leftFootPosX >= 20) {
        leftWalkCycle = 2; // Ke siklus berjalan selanjutnya
      }
    } else if (leftWalkCycle == 2) {
      // Animasi menggerakkan kaki ke belakang
      leftKneePosX -= 0.4;
      leftKneePosY += 0.1;
      leftFootPosX -= 1.2;
      leftFootPosY += 0.2;
      leftFootPosY = min(40, leftFootPosY);

      if (leftFootPosX <= -10) {
        leftWalkCycle = 3; // Ke siklus berjalan selanjutnya
      }
    } else if (leftWalkCycle == 3) {
      // Animasi menarik kaki ke atas
      leftKneePosY -= 0.5;
      leftFootPosY -= 1;

      if (leftFootPosY <= 30) {
        leftWalkCycle = 0; // Mereset siklus berjalan
      }
    }
  }
  
  // Status: duduk
  void sitting() {
    pushMatrix();
    {
      translate(0, relativePosY, 0);
      _body();

      // Menggeser kepala, dan animasi menggerakkan kepala
      pushMatrix();
      {
        translate(0, -120);
        rotate(radians(headRadians));
        _head();
      }
      popMatrix();
    }
    popMatrix();

    rightLegRotate = -60;
    leftLegRotate = -60;
    relativePosY = 40;
    _idleController();
  }
  
  // Badan
  private void _body() {
    noStroke();

    _leftLeg(); // Kaki kiri
    pushMatrix();
    {
      translate(0, bodyPosYRelative); // Gerakan tubuh
      _tail(); // Ekor
      _leftArm(); // Tangan kiri
    }
    popMatrix();

    push();
    {
      translate(0, bodyPosYRelative); // Gerakan tubuh

      // Badan
      fill(#FEC368);
      beginShape();
      vertex(0, -115);
      bezierVertex(-20, -115, -20, -90, -30, -60);
      bezierVertex(-30, -40, -10, -30, 0, -30);
      bezierVertex(10, -30, 30, -40, 30, -60);
      bezierVertex(20, -90, 20, -115, 0, -115);
      endShape(CLOSE);

      // Baju
      fill(#383878);
      beginShape();
      vertex(0, -115);
      bezierVertex(-20, -115, -20, -90, -30, -70);
      bezierVertex(-30, -60, -10, -50, 0, -50);
      bezierVertex(10, -50, 30, -60, 30, -70);
      bezierVertex(20, -90, 20, -115, 0, -115);
      endShape(CLOSE);

      // Leher
      fill(#FEC368);
      rectMode(CORNER);
      rect(-5, -120, 10, 10, 20);
    }
    pop();

    _rightLeg(); // Kaki kanan
    pushMatrix();
    {
      // Tangan kanan dan gerakan tubuh
      translate(0, bodyPosYRelative);
      _rightArm();
    }
    popMatrix();
  }

  // Ekor
  private void _tail() {
    fill(#D9A659);
    pushMatrix();
    {
      translate(-10, -45);
      rotate(radians(-headRadians));
      beginShape();
      curveVertex(0, 0);
      curveVertex(0, 0);
      curveVertex(-5, -10);
      curveVertex(-20, -25);
      curveVertex(-30, -65);
      curveVertex(-40, -80);
      curveVertex(-40, -80);
      curveVertex(-55, -55);
      curveVertex(-50, -25);
      curveVertex(-20, -5);
      curveVertex(0, 0);
      curveVertex(0, 0);
      endShape(CLOSE);
    }
    popMatrix();
  }

  // Tangan kiri
  private void _leftArm() {
    pushMatrix();
    {
      translate(10, -109);
      rotate(radians(60 + leftArmRotate));

      // Lengan
      fill(#D9A659);
      quad(-5, -3, 0, 3,
        60, 7, 60, -7);

      // Lengan Baju
      fill(#303064);
      quad(-5, -3, 0, 3,
        30, 5, 30, -5);

      // Tangan
      fill(#D9A659);
      circle(60, 0, 25);
    }
    popMatrix();
  }

  // Tangan kanan
  private void _rightArm() {
    pushMatrix();
    {
      translate(-10, -109);
      rotate(radians(-60 + rightArmRotate));

      // Lengan
      fill(#FEC368);
      quad(0, -3, -5, 3,
        -60, 7, -60, -7);

      // Lengan Baju
      fill(#383878);
      quad(0, -3, -5, 3,
        -30, 5, -30, -5);

      // Tangan
      fill(#FEC368);
      circle(-60, 0, 25);
    }
    popMatrix();
  }

  // Kaki kiri
  private void _leftLeg() {
    pushMatrix();
    {
      translate(10, -45);
      rotate(radians(leftLegRotate));
      fill(#D9A659);

      beginShape();
      curveVertex(-6, bodyPosYRelative);
      curveVertex(-6, bodyPosYRelative);
      curveVertex(6, bodyPosYRelative);
      curveVertex(leftKneePosX + 6, leftKneePosY);
      curveVertex(leftFootPosX + 6, leftFootPosY);
      curveVertex(leftFootPosX, leftFootPosY + 5);
      curveVertex(leftFootPosX - 6, leftFootPosY);
      curveVertex(leftKneePosX - 6, leftKneePosY);
      curveVertex(-6, bodyPosYRelative);
      curveVertex(-6, bodyPosYRelative);
      endShape();

      noStroke();
    }
    popMatrix();
  }

  // Kaki kanan
  private void _rightLeg() {
    pushMatrix();
    {
      translate(-15, -45);
      rotate(radians(rightLegRotate));
      fill(#FEC368);

      beginShape();
      curveVertex(-6, bodyPosYRelative);
      curveVertex(-6, bodyPosYRelative);
      curveVertex(6, bodyPosYRelative);
      curveVertex(rightKneePosX + 6, rightKneePosY);
      curveVertex(rightFootPosX + 6, rightFootPosY);
      curveVertex(rightFootPosX, rightFootPosY + 5);
      curveVertex(rightFootPosX - 6, rightFootPosY);
      curveVertex(rightKneePosX - 6, rightKneePosY);
      curveVertex(-6, bodyPosYRelative);
      curveVertex(-6, bodyPosYRelative);
      endShape();

      noStroke();
    }
    popMatrix();
  }

  // Kepala
  private void _head() {
    pushMatrix();
    {
      translate(0, bodyPosYRelative);
      noStroke();
      // For loop untuk mirroring
      for (int i = 0; i < 2; i++) {
        pushMatrix();
        {
          // Melakukan mirroring
          //translate(0, -120);
          if (i == 1)
            scale(-0.9, 1);

          // Telinga
          pushMatrix();
          {
            if (i == 1) {
              fill(#D9A659);
            } else {
              fill(#FEC368);
            }
            translate(-40, -90);
            rotate(radians(-15));
            for (int j = 0; j < 2; j++) {
              if (j == 1) {
                scale(0.6, 0.9);
                fill(#FEEDE5);
                if (i == 1) {
                  fill(#BFB4AE);
                }
              }

              beginShape();
              vertex(0, 0);
              bezierVertex(25, 0, 30, -15, 30, -35);
              bezierVertex(15, -60, 15, -90, 0, -90);
              bezierVertex(-15, -90, -15, -60, -20, -35);
              bezierVertex(-20, -15, -15, 0, 0, 0);
              endShape(CLOSE);
              noStroke();
            }
          }
          popMatrix();

          // Kepala (dasar)
          fill(#FEC368);
          beginShape();
          vertex(0, -120);
          bezierVertex(-50, -120, -50, -80, -80, -60);
          bezierVertex(-80, -60, -80, -55, -65, -55);
          bezierVertex(-65, -55, -60, -50, -90, -50);
          bezierVertex(-90, -50, -90, -40, -65, -30);
          bezierVertex(-65, -30, -60, -25, -90, -25);
          bezierVertex(-90, -25, -60, 0, 0, 0);
          endShape(CLOSE);

          // Kepala (moncong)
          if (i == 1) {
            fill(#BFB4AE);
          } else {
            fill(#FEEDE5);
          }
          beginShape();
          vertex(0, -60);
          bezierVertex(-35, -50, -20, -30, -90, -50);
          bezierVertex(-90, -50, -90, -40, -65, -30);
          bezierVertex(-65, -30, -60, -25, -90, -25);
          bezierVertex(-90, -25, -60, 0, 0, 0);
          endShape(CLOSE);
        }
        popMatrix();
      }

      // Moncong depan
      fill(#FEEDE5);
      beginShape();
      vertex(0, -60);
      bezierVertex(20, -55, 40, -45, 50, -45);
      bezierVertex(50, -20, 30, -5, 0, 0);
      endShape(CLOSE);

      // Rambut
      fill(#FEC368);
      beginShape();
      curveVertex(-25, -110);
      curveVertex(-25, -110);
      curveVertex(-10, -130);
      curveVertex(0, -140);
      curveVertex(0, -130);
      curveVertex(25, -145);
      curveVertex(20, -125);
      curveVertex(35, -130);
      curveVertex(25, -110);
      curveVertex(25, -110);
      endShape(CLOSE);

      // Hidung
      fill(#2E2E2E);
      beginShape();
      curveVertex(45, -30);
      curveVertex(40, -30);
      curveVertex(30, -40);
      curveVertex(40, -45);
      curveVertex(50, -42);
      curveVertex(45, -30);
      curveVertex(45, -30);
      endShape(CLOSE);

      _eyes(); // Mata
      _mouth(); // Mulut
    }
    popMatrix();
  }

  // Mata
  private void _eyes() {
    fill(#2E2E2E);

    pushMatrix();
    {
      translate(-20, -70);
      ellipse(0, 0, 15, eyeHeight);

      translate(50, 0);
      ellipse(0, 0, 15, eyeHeight);
    }
    popMatrix();
  }

  // Mulut
  private void _mouth() {
    noFill();
    stroke(#2E2E2E);
    strokeWeight(5);
    bezier(-20, -30, -15, -20,
      -5, -15, 10, -15);
  }
}
