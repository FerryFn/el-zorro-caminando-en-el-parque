class Credit{
  // Color palette
  color background1 = #D6A447;
  
  // Use this to show the scene
  void showCredit() {
    _showText();
  }
  
  // Text 
  private void _showText() {
    push();
    {
      background(background1);
      translate(width / 2, height / 2, 15);

      fill(#352E3D);
      rectMode(CENTER);
      // Title
      push();
      textSize(72);
      textAlign(CENTER, CENTER);
      text("Credits", 0, -300, 1000, 720);
      pop();
      push();
      textSize(44);
      // Sub Head title
      textAlign(CENTER, CENTER);
      text("B1 Group 4", 0, -230, 1000, 720);
      pop();
      // Sub titles
      TextSub("Muhammad Nizar", 250, -180);
      TextSub("Leader", -200, -180);
      TextSub("Ferry Fathurrahman", 250, -150);
      TextSub("Member 1", -200, -150);
      TextSub("Muhammad Reyhan Setiawan", 250, -120);
      TextSub("Member 2", -200, -120);
      TextSub("Muhammad Basith Algiffari", 250, -90);
      TextSub("Member 3", -200, -90);
      // sub Head title 1
      push();
      textSize(44);
      textAlign(CENTER, CENTER);
      text("Musics :", 0, -50, 1000, 720);
      pop();
      // Sub titles 1
      TextSub("Harvest Moon BTN", 250, -10);
      TextSub("Spring Theme", -200, -10);
      TextSub("Sekor09", 250, 20);
      TextSub("Sunny Day", -200, 20);
      TextSub("Victorium183", 250, 50);
      TextSub("Menu Changed", -200, 50);
      TextSub("broumbroum", 250, 80);
      TextSub("Menu Validated", -200, 80);
      // sub Head title 2
      push();
      textSize(44);
      textAlign(CENTER, CENTER);
      text("Images :", 0, 120, 1000, 720);
      pop();
      // sub titles 2
      TextSub("WolfsRoad", 250, 160);
      TextSub("Roger Sumatera", -200, 160);
    }
    pop();
  }
  void TextSub(String nama, int x, int y){
    push();
      translate(350, 0);
      textSize(36);
      textAlign(LEFT, CENTER);
      text(nama, x, y, 1000, 720);
    pop();
  }
}