import processing.sound.*;

// Audio
SoundFile audioMenu;
SoundFile audioMenuClick;
SoundFile audioMenuMove;
SoundFile audioRoger;
SoundFile audioSpring;

// Images
PImage imageRoger;

// Fonts
PFont font;

// Character
Fox fox = new Fox();

// Others
Hujan[] hujan = new Hujan[100];
Icon icon = new Icon();
Sign sign = new Sign();

// Scene
Menu menu = new Menu();
Taman taman = new Taman(fox, icon, hujan);
Danau danau = new Danau(fox, icon, hujan);

// Initialization
void setup() {
  size(1280, 720, P3D);
  smooth();
  textMode(SHAPE); // To smoothen texts

  // Font initialization
  font = createFont("./fonts/Akshar-Bold.ttf", 72);
  textFont(font);

  // Audio initialization
  audioMenu = new SoundFile(this, "./audio/sunny-day.mp3");
  audioMenuClick = new SoundFile(this, "./audio/clicked1.wav");
  audioMenuMove = new SoundFile(this, "./audio/menuchange.wav");
  audioRoger = new SoundFile(this, "./audio/roger.mp3");
  audioSpring = new SoundFile(this, "./audio/spring.mp3");

  // Audio volume
  audioMenu.amp(0.5);
  audioRoger.amp(0.5);
  audioSpring.amp(0.5);

  // Class audio assignments
  danau.audioSpring = audioSpring;
  menu.audioMenu = audioMenu;
  menu.audioMenuClick = audioMenuClick;
  menu.audioMenuMove = audioMenuMove;
  taman.audioRoger = audioRoger;
  taman.audioSpring = audioSpring;

  // Image initializaion
  imageRoger = loadImage("./images/roger.jpg");
  taman.imageRoger = imageRoger;

  // Rain initialization
  for (int i = 0; i < 100; i++) {
    hujan[i] = new Hujan(int(random(0, width)),
      int(random(0, height)),
      int(random(6, 10)));
  }

  // Fox initial position
  fox.posX = 490;
  fox.posY = 540;
}

void draw() {
  if (SceneControl.currentScene == 0) {
    // Menu
    menu.start();
  } else if (SceneControl.currentScene == 1) {
    // Park
    taman.begin();
    fox.control();
    fox.display();
  } else if (SceneControl.currentScene == 2) {
    // Lake
    danau.begin();
    fox.control();
    fox.display();
  }
  
  // Mouse coordinate (Delete when completed)
  pushMatrix();
  {
    translate(0, 0, 15);
    fill(0);
    text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY);
    textSize(20);
  }
  popMatrix();
}

// Non-continuous key presses
void keyPressed() {
  menu.keyPressed();
}
