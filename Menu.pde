Loading loading = new Loading();

// Menu scene
class Menu {
  // Audio
  SoundFile audioMenu;
  SoundFile audioMenuClick;
  SoundFile audioMenuMove;
  
  // Menu control
  int pilih = 1;
  int scene = 0;
  int putar = 1;

  void start() {
    // To start the audio
    bgmControl();
  
    background(#D6A447);
    judul();
    pushMatrix();
    {
      scale(1.5);
      pushMatrix();
      {
        translate(-200, -25);
        displayTextMenu();
        textSize(30);
        if (pilih==1) {
          //box1
          fill(#FFB20A);
          rect(290, 180+0*70, 220, 50);
          fill(0);
          text("Start", 365, 215+0*70);
          //box2
          fill(255);
          rect(290, 180+1*70, 220, 50);
          fill(0);
          text("Credit", 360, 215+1*70);
          //box3
          fill(255);
          rect(290, 180+2*70, 220, 50);
          fill(0);
          text("Exit", 370, 215+2*70);
          if (key == 32) {
            audioMenu.stop();
            scene=1;
          }
        } else if (pilih == 2) {
          fill(255);
          rect(290, 180+0*70, 220, 50);
          fill(0);
          text("Start", 365, 215+0*70);
          //box2
          fill(#FFB20A);
          rect(290, 180+1*70, 220, 50);
          fill(0);
          text("Credit", 360, 215+1*70);
          //box3
          fill(255);
          rect(290, 180+2*70, 220, 50);
          fill(0);
          text("Exit", 370, 215+2*70);
          if (key == 32)
            scene=2;
        } else if (pilih == 3) {
          fill(255);
          rect(290, 180+0*70, 220, 50);
          fill(0);
          text("Start", 365, 215+0*70);
          //box2
          fill(255);
          rect(290, 180+1*70, 220, 50);
          fill(0);
          text("Credit", 360, 215+1*70);
          //box3
          fill(#FFB20A);
          rect(290, 180+2*70, 220, 50);
          fill(0);
          text("Exit", 370, 215+2*70);
          if (key == 32)
            scene=3;
        } else if (pilih > 3) {
          pilih = 1;
        } else if (pilih < 1) {
          pilih = 3;
        }

        if (scene==1)
        {
          pushMatrix();
          {
            translate(0,-50,0);
            loading.load();
          }
          popMatrix();
        }
        if (scene==2)
        {
          background(#935762);
          text("Scene #2", 350, 50);
          if (keyCode==BACKSPACE)
            scene=0;
        }
        if (scene==3)
        {
          exit();
        }
        popMatrix();
      }
    }
    popMatrix();
    putar++;
  }

  void bgmControl() {
    if (!audioMenu.isPlaying()) {
      audioMenu.play();
    }
  }

  void keyPressed() {
    if (SceneControl.currentScene != 0) {
      return;
    }

    if (key==CODED)
    {
      if (keyCode==UP) {
        pilih-=1;
      } else if (keyCode==DOWN) {
        pilih+=1;
      }
    } else {
      fill(255);
    }

    if (key == CODED && (keyCode == UP || keyCode == DOWN)) {
      audioMenuMove.play();
    }

    if (key == CODED && keyCode == ENTER) {
      audioMenuClick.play();
    }
  }

  void displayTextMenu() {
    pushMatrix();
    {
      translate(70, 25);
      pushMatrix();
      {
        translate(200, 100);
        scale(0.3);
        pushMatrix();
        {
          translate(300, 100);
          scale(0.3);
          //huruf M
          pushMatrix();
          {
            translate(80, -39);
            rotateZ(radians(-45));
            box(200, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-30, -39);
            rotateZ(radians(45));
            box(200, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(150, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(410, 100);
          scale(0.3);
          //huruf E
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(490, 100);
          scale(0.3);
          //huruf N
          pushMatrix();
          {
            rotateZ(radians(47.5));
            box(300, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(580, 100);
          scale(0.3);
          //huruf U
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

  void judul() {
    pushMatrix();
    {
      translate(width/2, height/2, 0);
      fill(255);
      noStroke();
      translate(-30, -50);
      pushMatrix();
      {
        lights();
      }
      popMatrix();
      rotateY(radians(map(mouseX, 0, width, -30, 30)));
      //baris ke-1
      pushMatrix();
      {
        translate(-52, -145);
        scale(0.2);
        pushMatrix();
        {
          //huruf E
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(200, 0);
          //huruf L
          pushMatrix();
          {
            translate(-80, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
      //baris ke-2
      pushMatrix();
      {
        translate(-15, -50);
        scale(0.8);
        pushMatrix();
        {
          //huruf Z
          scale(0.6);
          pushMatrix();
          {
            translate(0, -100);
            box(250, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            rotateZ(radians(-41));
            box(290, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(250, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(175, 0);
          scale(0.6);
          //huruf O
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(350, 0);
          scale(0.6);
          //huruf R
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(80, -50);
            box(50, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 50);
            rotateZ(radians(30));
            box(200, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(510, 0);
          scale(0.6);
          //huruf R
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(80, -50);
            box(50, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 50);
            rotateZ(radians(30));
            box(200, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(675, 0);
          scale(0.6);
          //huruf O
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
      //baris ke-3
      pushMatrix();
      {
        translate(-43, 50);
        scale(0.45);
        pushMatrix();
        {
          scale(0.6);
          //huruf C
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(150, 0);
          scale(0.6);
          //huruf A
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(335, 0);
          scale(0.6);
          //huruf M
          pushMatrix();
          {
            translate(80, -39);
            rotateZ(radians(-45));
            box(200, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-30, -39);
            rotateZ(radians(45));
            box(200, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(150, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(490, 0);
          scale(0.6);
          //huruf I
          pushMatrix();
          {
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(615, 0);
          scale(0.6);
          //huruf N
          pushMatrix();
          {
            rotateZ(radians(47.5));
            box(300, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(810, 0);
          scale(0.6);
          //huruf A
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(1010, 0);
          scale(0.6);
          //huruf N
          pushMatrix();
          {
            rotateZ(radians(47.5));
            box(300, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(1215, 0);
          scale(0.6);
          //huruf D
          pushMatrix();
          {
            translate(0, -100);
            box(125, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(125, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 150, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(1420, 0);
          scale(0.6);
          //huruf O
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
      //baris ke-4
      pushMatrix();
      {
        translate(-52, 115);
        scale(0.2);
        pushMatrix();
        {
          //huruf E
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(220, 0);
          //huruf N
          pushMatrix();
          {
            rotateZ(radians(47.5));
            box(300, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(600, 0);
          //huruf E
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(800, 0);
          //huruf L
          pushMatrix();
          {
            translate(-80, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
      //baris ke-5
      pushMatrix();
      {
        translate(-33, 195);
        scale(0.6);
        pushMatrix();
        {
          scale(0.6);
          //huruf P
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(80, -50);
            box(50, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(150, 0);
          scale(0.6);
          //huruf A
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(325, 0);
          scale(0.6);
          //huruf R
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(80, -50);
            box(50, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 50);
            rotateZ(radians(30));
            box(200, 50, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(490, 0);
          scale(0.6);
          //huruf Q
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-50, 100);
            box(100, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, -25);
            box(50, 200, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(40, 75);
            rotateZ(radians(-45));
            box(75, 150, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(670, 0);
          scale(0.6);
          //huruf U
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
        pushMatrix();
        {
          translate(860, 0);
          scale(0.6);
          //huruf E
          pushMatrix();
          {
            translate(0, -100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(0, 100);
            box(150, 50, 50);
          }
          popMatrix();
          pushMatrix();
          {
            translate(-100, 0);
            box(50, 250, 50);
          }
          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}
