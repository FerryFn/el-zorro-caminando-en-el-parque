// Show sign scene
class Sign {
  // Color palette
  color colorWood1 = #DEB887;
  color colorWood2 = #A55B53;
  
  // Use this to show the scene
  void showSign(String textToBeShown) {
    _showSignBackground();
    _showText(textToBeShown);
  }
  
  // Sign background
  private void _showSignBackground() {
    push();
    {
      noStroke();
      translate(0, 0, 13);
      pushMatrix();
      {
        fill(colorWood2);
        rect(0, 0, width, height);
        fill(colorWood1);
        rect(50, 50, width-100, height-100, 30);
        rectMode(CENTER);
      }
      popMatrix();
    }
    pop();
  }
  
  // Text on the sign
  private void _showText(String textToBeShown) {
    push();
    {
      translate(width / 2, height / 2, 15);

      fill(#352E3D);
      rectMode(CENTER);
      textSize(72);
      textAlign(CENTER, CENTER);

      text(textToBeShown, 0, 0, 1000, 720);
    }
    pop();
  }
}
