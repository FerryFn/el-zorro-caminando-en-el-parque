//boolean tamandimulai = false;

class Taman{
  Hujan[] hujan;

  public Taman(Hujan[] hjn) {
    hujan = hjn;
  }

  void begin(){
    
    //if (tamandimulai == true){
      hujan();
      jalanan(); 


      push();
        fill(#B2FCFF);
        ellipse(440, 540, 300, 100);
        ellipse(470, 580, 200, 100);
        ellipse(570, 530, 200, 100);
      pop();

      
      batangPohonKecil(200,-250,#876445,0.5);
      batangPohonKecil(600,-250,#876445,0.5); 
      batangPohonKecil(800,-250,#876445,0.5);
      push();
        fill(#5BB318);
        ellipse(40, 30, 100, 100);
        ellipse(70, 30, 100, 100);
        ellipse(110, 50, 100, 100);
        ellipse(150, 40, 100, 100);
        ellipse(190, 30, 120, 100);
        ellipse(230, 30, 100, 100);
        ellipse(270, 20, 100, 100);
        ellipse(310, 10, 100, 100);
        ellipse(350, 30, 120, 100);
        ellipse(390, 40, 100, 100);
        ellipse(430, 30, 120, 100);
      pop();
      
      semak(160,-40,#5BB318,1);
      semak(200,-40,#5BB318,1);
      semak(-20,-35,#5BB318,1);
      semak(20,-35,#5BB318,1);
      semak(280,-35,#69c722,1);
      semak(60,-30,#69c722,1);
      semak(100,-30,#69c722,1);
      semak(-100,-30,#69c722,1);

      batangPohonKecil(1450,-260,#876445,0.5); 
      batangPohonKecil(1750,-280,#876445,0.5);
      push();
        fill(#5BB318);
        ellipse(700, 30, 100, 100);
        ellipse(740, 40, 100, 100);
        ellipse(780, 30, 100, 100);
        ellipse(820, 30, 100, 100);
        ellipse(860, 30, 100, 100);
        ellipse(900, 40, 100, 100);
        ellipse(920, 30, 100, 100);
      pop(); 
      semak(600, -80,#5BB318,1);
      semak(520, -80,#69c722,1);
      semak(680, -80,#69c722,1);
      semak(720, -80,#69c722,1);

      semak(-180, 150,#69c722,2);
      semak(-140, 150,#69c722,2);

      pagar(0,0);

      lampu(50,500,1);
      lampu(500,320,1);

      semak(950, 60,#5BB318,2);
      semak(800, 60,#69c722,2);

      batangPohonBesar(1100,-210,#876445,1);
      pushMatrix();
        fill(#876445);
        quad(1070, 240, 950, 110, 980, 110, 1070, 170);
      popMatrix();
      push();
        fill(#5BB318);
        ellipse(970, 50, 200, 200);
        ellipse(1070, 25, 200, 200);
        ellipse(1170, 60, 200, 200);
        ellipse(1230, 60, 200, 200);
      pop();
      sign(0,0);
    //} else {
      
    //}
  }

  void hujan(){
    for (int i = 0; i < hujan.length; i++) {
    hujan[i].display();
  }
  }

  void jalanan(){
    pushMatrix();
     beginShape();
     noStroke();
     fill(60);
     vertex(0,340);
     vertex(1280,340); 
     vertex(1280,460);
     vertex(0,460);
     endShape(CLOSE);
    popMatrix();
  }

  //rencana dirumah nanti kalo sempat jadi fungsi jadinya manggil 3 fungsi langsung
  void semak(int x, int y, color g, float scale){
    //dibungkus pake quad    
    pushMatrix();
      translate(x,y);
      scale(scale);
      fill(g);
      circle(90, 260, 60);
      circle(120, 240, 60+15);
      circle(150, 235, 60+15);
      circle(180, 255, 60+10);
      quad(110,260,
      165,250,
      180,290,
      95,290);
    popMatrix();
  }

  void batangPohonKecil(int x, int y, color b, float scale){
    pushMatrix();
      scale(scale);
      translate(x,y);
      fill(b);
      //pohon kanan
      beginShape();
        vertex(20, 300); // titik pertama
        bezierVertex(100, 250, 10, 480, 80, 680); // membuat agar baris / garis melengkung
        vertex(20, 680); // titik terakhir
      endShape();
      //pohon kiri
      beginShape();
        vertex(20, 300); // titik pertama
        bezierVertex(-100, 250, -10, 480, -80, 680); // membuat agar baris / garis melengkung
        vertex(20, 680); // titik terakhir
      endShape();       
    popMatrix();
  }

  void batangPohonBesar(int x, int y, color b, float scale){
    pushMatrix();
      scale(scale);
      translate(x,y);
      fill(b);
      //pohon kanan
      beginShape();
        vertex(20, 300); // titik pertama
        bezierVertex(100, 250, 10, 680, 80, 880); // membuat agar baris / garis melengkung
        vertex(20, 880); // titik terakhir
      endShape();
      //pohon kiri
      beginShape();
        vertex(20, 300); // titik pertama
        bezierVertex(-100, 250, -10, 680, -80, 880); // membuat agar baris / garis melengkung
        vertex(20, 880); // titik terakhir
      endShape();       
    popMatrix();
  }

  void pagar(int x, int y){
    push();
      translate(x, y);
      strokeWeight(10);
      stroke(#1B2430);
      for (int i = 0; i < 14; i++) {
        line(20 * i + 20 * i, 170, 20 * i + 20 * i, 270);
      }
      // for (int i = 0; i < 530; i+=40) {
      //   line(i, 170, i, 270);
      // }
      line(0, 170, 525, 170);
      line(0, 270, 525, 270);
    pop();
  }

  void lampu(int x, int y, int z){
    push();
      translate(x,y,z);
      stroke(#0F0E0E);
      strokeWeight(15);
      line(0, 0, 0, -180);
      strokeWeight(4);
      rectMode(CENTER);
      fill(#0F0E0E);
      rect(0, -200, 40, 60, 20);
      fill(#FFFF00);
      rect(0, -200, 20, 40, 10);
    pop();
  }

  void sign(int x, int y){
    push();
      translate(x,y);
      pushMatrix();
      fill(#DEB887);
      rect(690, 275, 20, 60);
      rect(850, 275, 20, 60);
      fill(#A55B53);
      rect(670, 150, 220, 150, 10);
      // beginShape();
      //   vertex(670, 330);
      //   vertex(670, 230);
      //   vertex(870, 230);
      //   vertex(870, 330);
      // endShape(CENTER);
      fill(#DEB887);
      rect(690, 160, 180, 120, 5);
      
      // rect(x, y, width, height);
      rectMode(CENTER);
      popMatrix();
    pop();
  }
}
