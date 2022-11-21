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
  void rumput(){
    pushMatrix();
    
    popMatrix();
  }

  //rencana dirumah nanti kalo sempat jadi fungsi jadinya manggil 3 fungsi langsung
  void semaksemak(){
    //dibungkus pake quad    
    pushMatrix();
      fill(#5BB318);
      circle(90, 210+50, 60);
      circle(120, 190+50, 60+15);
      circle(150, 185+50, 60+15);
      circle(180, 205+50, 60+10);
      quad(110,210+50,
      165,200+50,
      180,240+50,
      95,240+50);
    popMatrix();
    pushMatrix();
      fill(#69c722);
      circle(90-100, 210+50, 60);
      circle(120-100, 190+50, 60+15);
      circle(150-100, 185+50, 60+15);
      circle(180-100, 205+50, 60+10);
      quad(110-100,210+50,
      165-100,200+50,
      180-100,240+50,
      95-100,240+50);
    popMatrix();
    pushMatrix();
      fill(#69c722);
      circle(90+75, 210+50, 60);
      circle(120+75, 190+50, 60+15);
      circle(150+75, 185+50, 60+15);
      circle(180+75, 205+50, 60+10);
      quad(110+75,210+50,
      165+75,200+50,
      180+75,240+50,
      95+75,240+50);
    popMatrix();
  }
}
