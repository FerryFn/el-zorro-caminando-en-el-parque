//boolean tamandimulai = false;

class Taman{
  
  void begin(){
    //if (tamandimulai == true){
      hujan();
      jalanan(); 
      //kubangan();
      semaksemak();
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
        //if (random2 > height){
        //  random2 = random(-100,0);
        //}
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
     fill(#552F12);
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
  void rumput(){
    pushMatrix();
    fill(#69c722);
    popMatrix();
  }
  void semaksemak(){
    //dibungkus pake quad
    pushMatrix();
      semak(90, 260, 60);
      semak(120, 240, 75);
      semak(150, 235, 75);
      semak(190, 253, 75);
      quad(110,257,
      163,249,
      181,290,
      94,290);
    popMatrix();
  }
  void semak(int x, int y, int luas){
    pushMatrix();
    fill(#5BB318);
    circle(x,y,luas);
    circle(x,y,luas);
    popMatrix();
  }
}
