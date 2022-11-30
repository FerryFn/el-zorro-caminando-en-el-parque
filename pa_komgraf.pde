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
Rain[] rain = new Rain[100];
Icon icon = new Icon();
Sign sign = new Sign();

// Scene
Menu menu = new Menu();
Park park = new Park(fox, icon, rain, sign);
Lake lake = new Lake(fox, icon, rain, sign);

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
  lake.audioSpring = audioSpring;
  menu.audioMenu = audioMenu;
  menu.audioMenuClick = audioMenuClick;
  menu.audioMenuMove = audioMenuMove;
  park.audioRoger = audioRoger;
  park.audioSpring = audioSpring;

  // Image initializaion
  imageRoger = loadImage("./images/roger.jpg");
  park.imageRoger = imageRoger;

  // Rain initialization
  for (int i = 0; i < 100; i++) {
    rain[i] = new Rain(int(random(0, width)),
      int(random(0, height)),
      int(random(6, 10)));
  }

  // Fox initial position
  fox.posX = -100;
  fox.posY = 420;
}

void draw() {
  if (SceneControl.currentScene == 0) {
    // Menu
    menu.start();
  } else if (SceneControl.currentScene == 1) {
    // Park
    park.begin();
    fox.control();
    fox.display();
  } else if (SceneControl.currentScene == 2) {
    // Lake
    lake.begin();
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
