class Danau {
  Fox fox;
  Hujan[] hujan;
  Icon icon;

  color bush1 = #4C8F4F;
  color bush2 = #36784E;
  color fence = #352E3D; 
  color lampLight = #FCC88D;
  color lampStructure = #24222E;
  color path = #5A5A70;
  color sky1 = #AFCFC2;
  color treeTrunk = #844344;
  color treeBackdrop1 = #2D434D;
  color treeBackdrop2 = #385450;
  color water = #6A8A99;

  public Danau(Fox tempFox, Icon tempIcon, Hujan[] hjn){
    fox = tempFox;
    hujan = hjn;
    icon = tempIcon;
  }
  
  void begin(){

    background(#7CAB6D);
    
    interactGoToCentralPark();
    
    langit();
    hujan();
    jalanan();
    batu(0,0,30,30);
    batu(20,0,50,50);
    batu(50,0,40,40);

    batu(-20,40,30,30);
    batu(-40,40,50,50);
    batu(-90,60,40,40);

    batu(-80,440,30,30);
    batu(-100,440,50,50);
    batu(-140,460,40,40);

    lake();

    semak(160,-40,0,bush2,1);
    semak(200,-40,0,bush2,1);
    semak(-20,-35,0,bush2,1);
    semak(20,-35,0,bush2,1);
    semak(60,-30,0,bush1,1);
    semak(100,-30,0,bush1,1);
    semak(-100,-30,0,bush1,1);

    batangPohonKecil(200,-320,treeTrunk,0.8);
    
    push();
      translate(0, 0, 8);
      fill(treeTrunk);
      quad(190, 120, 260, 0, 290, 0, 190, 140);
      fill(bush2);
      ellipse(40, 20, 100, 100);
      ellipse(70, 20, 100, 100);
      ellipse(110, 40, 100, 100);
      ellipse(150, 30, 100, 100);
      ellipse(190, 20, 120, 100);
      ellipse(230, 20, 90, 100);
      ellipse(270, 10, 100, 100);
      ellipse(310, 30, 100, 100);
    pop(); 

    semak(50, 60,7,bush2,2);
    semak(-100, 60,7,bush1,2);

    semak(-180, 150,9,bush2,2);
    semak(-140, 150,9,bush2,2);

    semak(0, 150,9,bush1,2);
    semak(40, 150,9,bush1,2);

    sign(0,0,3);
  }

  void langit() {
    push();
      noStroke();
      fill(sky1);
      rect(0, 0, width, 200);
      fill(treeBackdrop1);
      for (int i = 0; i <= width / 30; i++) {
        arc(i * width / 30, 200, 60, 60, PI, TWO_PI);
      }
        
    pop(); 
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
     fill(path);
     vertex(0,390);
     vertex(750,390); 
     vertex(750,490);
     vertex(0,490);
     endShape(CLOSE);
    popMatrix();
  }
  void lake(){
    push();
      fill(water);
      ellipse(1250, 480, 850, 560);
    pop();
  }

  void sign(int x, int y, int z){
    push();
      translate(x,y,z);
      pushMatrix();
      fill(#DEB887);
      rect(240, 305, 20, 60);
      rect(400, 305, 20, 60);
      fill(#A55B53);
      rect(220, 180, 220, 150, 10);
      fill(#DEB887);
      rect(240, 190, 180, 120, 5);
      
      // rect(x, y, width, height);
      rectMode(CENTER);
      popMatrix();
    pop();
  }

  void semak(int x, int y, int z, color g, float scale){
    //dibungkus pake quad    
    pushMatrix();
      translate(x,y,z);
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
  void batu(int x, int y, int w, int h){
    pushMatrix();
    translate(x, y);
      fill(#828886);
      arc(970, 235, w, h, PI, TWO_PI);
    popMatrix();

  }
  
  // Interactable: Go to the central park
  void interactGoToCentralPark() {
    if (fox.posX <= 60 && fox.posY >= 385 && fox.posY <= 500 && !fox.isFacingRight) {
      icon.arrowIcon(80, 240, 11, false);
      if (keyPressed && key == 32) { // Space
        SceneControl.currentScene = 1; // Go to central park
        fox.posX = 1200;
        fox.posY = 380;
        fox.isFacingRight = false;
      }
    }
  }
}
