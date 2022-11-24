//boolean tamandimulai = false;

class Taman{
  
  void begin(){
    
    //if (tamandimulai == true){
      hujan();
      jalanan(); 
      //kubangan();
      
      batangPohonKecil(200,-250,#876445,0.5);
      batangPohonKecil(600,-250,#876445,0.5); 
      batangPohonKecil(800,-250,#876445,0.5);      
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
      semak(600, -80,#5BB318,1);
      semak(520, -80,#69c722,1);
      semak(680, -80,#69c722,1);
      semak(720, -80,#69c722,1);

      semak(-180, 150,#69c722,2);
      semak(-140, 150,#69c722,2);

      pagar(0,0);

      lampu(50,0);
      lampu(500,-160);

      semak(950, 60,#5BB318,2);
      semak(800, 60,#69c722,2);
      
      batangPohonBesar(1100,-240,#876445,1);
    //} else {
      
    //}
  }
  void hujan(){
    pushMatrix();
      for (int k = 0; k < 75; k++) {
  
        float random1= random(width);
        float random2= random(height);
        float kecepatan = random(2,10);
        random2 += kecepatan/10;
        stroke(#4A9FF5);
        strokeWeight(3);
        line(random1, random2, random1, random2+10);
      }
    popMatrix();
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
  void kubangan(){
    pushMatrix();
      fill(#B2FCFF);
      
      bezier(100, 450, 90, 400, 125, 375, 175, 400);
      bezier(175, 400, 150, 350, 225, 325, 250, 350);
      //line(175, 400, 250, 350);
      bezier(250, 350, 250, 275, 375, 300, 350, 375);
      //line(250, 350, 350, 375);
      bezier(350, 375, 400, 375, 425, 400, 400, 450);
      //line(350, 375, 400, 450);
      bezier(100, 450, 100, 475, 400, 475, 400, 450);
      //line(100, 450, 400, 450);
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

  void lampu(int x, int y){
    push();
      translate(x,y);
      stroke(#0F0E0E);
      strokeWeight(15);
      line(0, 300, 0, 480);  
    pop();
    pushMatrix();
      translate(x,y);
      fill(#0F0E0E);
      rect(0, 290, 40, 60, 20);
      rectMode(CENTER);
      fill(#FFFF00);
      rect(0, 290, 20, 40, 10);
    popMatrix();

  }
}
