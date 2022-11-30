// The Fox character
class Fox {
  // Fox animation states
  final String[] STATES = {
    "idle",
    "walking",
    "sitting",
    "jumping",
  };

  // Fox control
  int speed = 4;
  int defaultSpeed = 4;
  boolean isFacingRight = true;
  boolean canControlFox = true;

  // Fox position on canvas
  int posX = 0;
  int posY = 0;
  int posZ = 2;
  String currentState = STATES[0];

  // Fox position relative to its original position
  int relativePosY = 0;

  // Fox's arms rotation animation control
  float rightArmRotate = 0;
  float leftArmRotate = 0;
  boolean rightArmRotationIsClockwise = true;

  // Fox's legs animation control
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

  // Fox's nodding animation control
  float headRadians = 0;
  boolean headRotationIsClockwise = true;

  // Fox's torso animation control
  float bodyPosYRelative = 0;
  boolean bodyIsGoingDownward = true;

  // Fox blinking animation control
  int timeToBlink = 0; // Waiting before winking
  boolean isBlinking = false;
  boolean eyeIsClosing = false;
  int eyeHeight = 25;

  // Fox jump animation control
  boolean isFalling = false;

  // Input from user control
  void control() {
    if (keyPressed && canControlFox) {
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
      } else if (key == 's') {
        rightArmRotate = 0;
        leftArmRotate = 0;
        currentState = STATES[2];
      }
    } else if (currentState != STATES[2] && currentState != STATES[3] && canControlFox) {
      rightWalkCycle = 0;
      leftWalkCycle = 0;
      bodyPosYRelative = 0;
      currentState = STATES[0];
    }
  }

  // Stop Fox from walking
  void stopWalk() {
    speed = 0;
  }

  // Display Fox according to its state
  void display() {
    pushMatrix();
    {
      translate(posX, posY, posZ); // Fox's position
      scale(0.7); // Fox's size
      // Fox's walking direction
      if (isFacingRight) {
        scale(1, 1);
      } else {
        scale(-1, 1);
      }

      if (currentState == STATES[0]) {
        // Status: idling
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
        // Status: walking
        rightLegRotate = 0;
        leftLegRotate = 0;

        blinking();
        walk();
      } else if (currentState == STATES[2]) {
        // Status: sitting
        blinking();
        sitting();
      } else if (currentState == STATES[3]) {
        // Status: jumping
        jump();
      }
    }
    popMatrix();
  }

  // Blinking animation
  void blinking() {
    if (!isBlinking) {
      timeToBlink++;
      if (timeToBlink >= 180) {
        // Informs that Fox is still blinking
        isBlinking = true;
        // Cue closing eyes animation
        eyeIsClosing = true;
        // Resets the time to blink again
        timeToBlink = 0;
      }
    }

    // If isBlinking is active, Fox will do the blink animation
    if (isBlinking) {
      // If Fox want to close his eyes,
      // the eyes' height will decrease and vice-versa
      eyeHeight += !eyeIsClosing ? 5 : -5;

      // If Fox's eyes is closed, cue opening eyes animation
      if (eyeHeight <= 0) {
        eyeIsClosing = false;
      }

      // If Fox has opened his eyes, waits until next blink
      if (!eyeIsClosing && eyeHeight >= 25) {
        isBlinking = false;
      }
    }
  }

  // Status: idling
  void idle() {
    _idleController();
    _body();

    // Menggeser kepala, dan animasi menggerakkan kepala
    pushMatrix();
    {
      translate(0, -120);
      rotate(radians(headRadians));
      _head(false);
    }
    popMatrix();
  }

  // Idling animation controller
  private void _idleController() {
    // Head movement animation controller
    headRadians += headRotationIsClockwise ? 0.1 : -0.1;
    if (headRadians > 2.5) {
      headRotationIsClockwise = false;
    } else if (headRadians < -2.5) {
      headRotationIsClockwise = true;
    }

    // Arms animation controller
    rightArmRotate += rightArmRotationIsClockwise ? 0.3 : -0.3;
    leftArmRotate += !rightArmRotationIsClockwise ? 0.3 : -0.3;
    if (rightArmRotate > 10) {
      rightArmRotationIsClockwise = false;
    } else if (rightArmRotate < -10) {
      rightArmRotationIsClockwise = true;
    }
  }

  // Status: walking
  void walk() {
    _walkController();
    _body();

    // Moves head, and head nodding animation
    pushMatrix();
    {
      translate(0, -120);
      rotate(radians(headRadians));
      _head(false);
    }
    popMatrix();
  }

  // Walking animation controller
  private void _walkController() {
    // Head movement animation controller
    headRadians += headRotationIsClockwise ? 0.3 : -0.3;
    if (headRadians > 3) {
      headRotationIsClockwise = false;
    } else if (headRadians < -3) {
      headRotationIsClockwise = true;
    }

    // Body movement animation controller
    bodyPosYRelative += bodyIsGoingDownward ? 0.25 : -0.25;
    if (bodyPosYRelative > 3) {
      bodyIsGoingDownward = false;
    } else if (bodyPosYRelative < -3) {
      bodyIsGoingDownward = true;
    }

    // Arms animation controller
    rightArmRotate += rightArmRotationIsClockwise ? 2 : -2;
    leftArmRotate += !rightArmRotationIsClockwise ? 2 : -2;
    if (rightArmRotate > 25) {
      rightArmRotationIsClockwise = false;
    } else if (rightArmRotate < -45) {
      rightArmRotationIsClockwise = true;
    }

    // Right leg walk cycle animation controller
    if (rightWalkCycle == 0) {
      // Leg position is in the front
      rightKneePosX = 10;
      rightKneePosY = 20;
      rightFootPosX = 20;
      rightFootPosY = 40;

      rightWalkCycle = 1; // Next walking phase
    } else if (rightWalkCycle == 1) {
      // Moves leg backwards
      rightKneePosX -= 0.4;
      rightKneePosY += 0.1;
      rightFootPosX -= 1.2;
      rightFootPosY += 0.2;
      rightFootPosY = min(40, rightFootPosY);

      if (rightFootPosX <= -10) {
        rightWalkCycle = 2;  // Next walking phase
      }
    } else if (rightWalkCycle == 2) {
      // Moves foot upwards
      rightKneePosY -= 0.5;
      rightFootPosY -= 1;

      if (rightFootPosY <= 30) {
        rightWalkCycle = 3;  // Next walking phase
      }
    } else if (rightWalkCycle == 3) {
      // Moves leg forwards
      rightKneePosX += 0.4;
      rightKneePosY += 0.5;
      rightFootPosX += 1.2;
      rightFootPosY += 0.2;
      rightKneePosX = min(10, rightKneePosX);
      rightKneePosY = min(20, rightKneePosY);

      if (rightFootPosX >= 20) {
        rightWalkCycle = 0;  // Reset the walk cycle
      }
    }

    // Left leg walk cycle animation controller
    if (leftWalkCycle == 0) {
      // Leg position is in the back
      leftKneePosX = 0;
      leftKneePosY = 20;
      leftFootPosX = -10;
      leftFootPosY = 35;

      leftWalkCycle = 1; // Next walking phase
    } else if (leftWalkCycle == 1) {
      // Moves leg forwards
      leftKneePosX += 0.4;
      leftKneePosY += 0.5;
      leftFootPosX += 1.2;
      leftFootPosY += 0.2;
      leftKneePosX = min(10, leftKneePosX);
      leftKneePosY = min(20, leftKneePosY);

      if (leftFootPosX >= 20) {
        leftWalkCycle = 2; // Next walking phase
      }
    } else if (leftWalkCycle == 2) {
      // Move leg backwards
      leftKneePosX -= 0.4;
      leftKneePosY += 0.1;
      leftFootPosX -= 1.2;
      leftFootPosY += 0.2;
      leftFootPosY = min(40, leftFootPosY);

      if (leftFootPosX <= -10) {
        leftWalkCycle = 3; // Next walking phase
      }
    } else if (leftWalkCycle == 3) {
      // Move foot upwards
      leftKneePosY -= 0.5;
      leftFootPosY -= 1;

      if (leftFootPosY <= 30) {
        leftWalkCycle = 0; // Reset the walk cycle
      }
    }
  }

  // Status: sitting
  void sitting() {
    pushMatrix();
    {
      translate(0, relativePosY, 0);
      _body();

      // Moves head, and head nodding animation
      pushMatrix();
      {
        translate(0, -120);
        rotate(radians(headRadians));
        _head(false);
      }
      popMatrix();
    }
    popMatrix();

    rightLegRotate = -60;
    leftLegRotate = -60;
    relativePosY = 40;
    _idleController();
  }


  // Status: jumping
  void jump() {
    _jumpController();
    pushMatrix();
    {
      translate(0, relativePosY, 0);
      _body();

      // Moves head, and head nodding animation
      pushMatrix();
      {
        translate(0, -120);
        _head(true);
      }
      popMatrix();
    }
    popMatrix();
  }

  // Jumping animation controller
  private void _jumpController() {
    // Jumping animation
    if (!isFalling) {
      // If jumping upwards
      rightArmRotate += 5;
      leftArmRotate -= 5;
      rightLegRotate += 3;
      leftLegRotate -= 3;
      relativePosY -= 4;

      rightArmRotate = min(90, rightArmRotate);
      leftArmRotate = max(-90, leftArmRotate);
      rightLegRotate = min(45, rightLegRotate);
      leftLegRotate = max(-45, leftLegRotate);
      relativePosY = max(-90, relativePosY);
    } else {
      // If falling downwards after jumping
      rightArmRotate -= 5;
      leftArmRotate += 5;
      rightLegRotate -= 3;
      leftLegRotate += 3;
      relativePosY += 5;

      rightArmRotate = max(0, rightArmRotate);
      leftArmRotate = min(0, leftArmRotate);
      rightLegRotate = max(0, rightLegRotate);
      leftLegRotate = min(0, leftLegRotate);
      relativePosY = min(0, relativePosY);
    }

    // Jumping cycle
    if ((relativePosY <= -90 && !isFalling) ||
      (relativePosY >= 0 && isFalling)) {
      isFalling = !isFalling;
    }
  }

  // Body
  private void _body() {
    noStroke();

    _leftLeg(); // Left leg
    pushMatrix();
    {
      translate(0, bodyPosYRelative); // Body movement
      _tail(); // Tail
      _leftArm(); // Left arm
    }
    popMatrix();

    push();
    {
      translate(0, bodyPosYRelative); // Body movement

      // Body
      fill(#FEC368);
      beginShape();
      vertex(0, -115);
      bezierVertex(-20, -115, -20, -90, -30, -60);
      bezierVertex(-30, -40, -10, -30, 0, -30);
      bezierVertex(10, -30, 30, -40, 30, -60);
      bezierVertex(20, -90, 20, -115, 0, -115);
      endShape(CLOSE);

      // T-shirt
      fill(#383878);
      beginShape();
      vertex(0, -115);
      bezierVertex(-20, -115, -20, -90, -30, -70);
      bezierVertex(-30, -60, -10, -50, 0, -50);
      bezierVertex(10, -50, 30, -60, 30, -70);
      bezierVertex(20, -90, 20, -115, 0, -115);
      endShape(CLOSE);

      // Neck
      fill(#FEC368);
      rectMode(CORNER);
      rect(-5, -120, 10, 10, 20);
    }
    pop();

    _rightLeg(); // Right leg
    pushMatrix();
    {
      // Right arm and body movement
      translate(0, bodyPosYRelative);
      _rightArm();
    }
    popMatrix();
  }

  // Tail
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

  // Left arm
  private void _leftArm() {
    pushMatrix();
    {
      translate(10, -109);
      rotate(radians(60 + leftArmRotate));

      // Arm
      fill(#D9A659);
      quad(-5, -3, 0, 3,
        60, 7, 60, -7);

      // T-shirt sleeve
      fill(#303064);
      quad(-5, -3, 0, 3,
        30, 5, 30, -5);

      // Hand
      fill(#D9A659);
      circle(60, 0, 25);
    }
    popMatrix();
  }

  // Right Arm
  private void _rightArm() {
    pushMatrix();
    {
      translate(-10, -109);
      rotate(radians(-60 + rightArmRotate));

      // Arm
      fill(#FEC368);
      quad(0, -3, -5, 3,
        -60, 7, -60, -7);

      // T-shirt sleeve
      fill(#383878);
      quad(0, -3, -5, 3,
        -30, 5, -30, -5);

      // Hand
      fill(#FEC368);
      circle(-60, 0, 25);
    }
    popMatrix();
  }

  // Left leg
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

  // Right leg
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

  // Head
  private void _head(boolean happyEyes) {
    pushMatrix();
    {
      translate(0, bodyPosYRelative);
      noStroke();
      // For loop for mirroring
      for (int i = 0; i < 2; i++) {
        pushMatrix();
        {
          // Mirroring
          if (i == 1)
            scale(-0.9, 1);

          // Ears
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

          // Head (base)
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

          // Head (muzzle)
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

      // Muzzle
      fill(#FEEDE5);
      beginShape();
      vertex(0, -60);
      bezierVertex(20, -55, 40, -45, 50, -45);
      bezierVertex(50, -20, 30, -5, 0, 0);
      endShape(CLOSE);

      // Hair
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

      // Nose
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

      if (happyEyes) {
        _happyEyes(); // Happy eyes
      } else {
        _eyes(); // Eyes
      }
      _mouth(); // Mouth
    }
    popMatrix();
  }

  // Eyes
  private void _eyes() {
    push();
    {
      fill(#2E2E2E);

      translate(-20, -70);
      ellipse(0, 0, 15, eyeHeight);

      translate(50, 0);
      ellipse(0, 0, 15, eyeHeight);
    }
    pop();
  }

  // Happy eyes
  private void _happyEyes() {
    push();
    {
      noFill();
      stroke(#2E2E2E);
      strokeWeight(7);

      translate(-20, -80);
      beginShape();
      vertex(-15, 15);
      vertex(0, 0);
      vertex(15, 15);
      endShape();

      translate(50, 0);
      beginShape();
      vertex(-15, 15);
      vertex(0, 0);
      vertex(15, 15);
      endShape();
    }
    pop();
  }

  // Mouth
  private void _mouth() {
    noFill();
    stroke(#2E2E2E);
    strokeWeight(5);
    bezier(-20, -30, -15, -20,
      -5, -15, 10, -15);
  }
}
