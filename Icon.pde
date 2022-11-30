// Icon for interactables
class Icon {
  // Icon relative coordinate for animation
  int iconX = 0;
  int iconY = 0;
  
  // Move loop animation
  boolean iconIsMovingDown = true;
  boolean iconIsMovingRight = true;
  
  // Arrow icon (to change place)
  void arrowIcon(int x, int y, int z, boolean facingRight) {
    _leftRightAnimationControl();
    
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
  
  // Exclamation sign icon (for interactables)
  void exclamationIcon(int x, int y, int z, boolean facingRight) {
    _upDownAnimationControl();
    
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
  
  // Icon left and right movement loop
  private void _leftRightAnimationControl() {
    iconX += iconIsMovingRight ? 1 : -1;
    
    if (iconX >= 10) {
      iconIsMovingRight = false;
    } else if (iconX <= -10) {
      iconIsMovingRight = true;
    }
  }
  
  // Icon up and down movement loop
  private void _upDownAnimationControl() {
    iconY += iconIsMovingDown ? 1 : -1;
    
    if (iconY >= 10) {
      iconIsMovingDown = false;
    } else if (iconY <= -10) {
      iconIsMovingDown = true;
    }
  }
}
