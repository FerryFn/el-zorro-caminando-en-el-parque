class Sign{
  color colorWood1 = #DEB887;
  color colorWood2 = #A55B53;
    String texts;

    public void Sign(String text) {
        texts = text;
    }

    void opened(String texts) {
        signs();
        text1(texts);
    }

    void signs() {
    push();
    {
        noStroke();
        translate(0, 0, 0);
        pushMatrix();
        fill(colorWood2);
        rect(0, 0, width, height);
        fill(colorWood1);
        rect(50, 50, width-100, height-100, 30);
        rectMode(CENTER);
        popMatrix();
    }
    pop();
    }

    void text1(String text1) {
    push();
        translate(width / 2, height / 2, 2);
        rectMode(CENTER);
        textSize(72);
        textAlign(CENTER, CENTER);
        fill(#352E3D);
        text(text1, 0, 0, 1000, 720);    
    pop();
    } 
  
}