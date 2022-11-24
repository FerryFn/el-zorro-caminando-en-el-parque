menu Menu = new menu();
Fox fox = new Fox();
Hujan[] hujan = new Hujan[100];
Taman taman = new Taman(hujan);

void setup() {
  size(1280, 720, P3D);
  for (int i = 0; i < 100; i++) {
    hujan[i] = new Hujan(int(random(0, width)),
      int(random(0, height)),
      int(random(6, 10)));
  }
}

void draw() {
  //background(#A4DFFA);
  background(#552F12);
  //menu.display();


  taman.begin();
  fox.control();
  fox.display();
  fill(0);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY);
  textSize(20);
}
