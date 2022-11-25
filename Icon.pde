class Icon {
  int iconX = 0;
  int iconY = 0;
  boolean iconIsMovingDown = true;
  boolean iconIsMovingRight = true;
  
  void arrowIcon(int x, int y, int z, boolean facingRight) {
    leftRightAnimationControl();
    
    push();
    {
      translate(x + iconX, y, z);
      if (!facingRight) {
        scale(-1, 1);
      }
      fill(#FEC368);
      textSize(128);
      textAlign(CENTER);
      text(">", 0, 0);
    }
    pop();
    
  }
  
  void exclamationIcon(int x, int y, int z, boolean facingRight) {
    upDownAnimationControl();
    
    push();
    {
      translate(x, y + iconY, z);
      if (!facingRight) {
        scale(-1, 1);
      }
      fill(#FEC368);
      textSize(128);
      textAlign(CENTER);
      text("!", 0, 0);
    }
    pop();
    
  }
  
  void leftRightAnimationControl() {
    iconX += iconIsMovingRight ? 1 : -1;
    
    if (iconX >= 10) {
      iconIsMovingRight = false;
    } else if (iconX <= -10) {
      iconIsMovingRight = true;
    }
  }
  
  void upDownAnimationControl() {
    iconY += iconIsMovingDown ? 1 : -1;
    
    if (iconY >= 10) {
      iconIsMovingDown = false;
    } else if (iconY <= -10) {
      iconIsMovingDown = true;
    }
  }
}
