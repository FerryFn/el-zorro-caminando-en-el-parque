int pilih=0;
int scene=0;
class menu {
  void start(){
      if(pilih==0){
        //box1
         fill(255);
         rect(290, 180+0*70, 220, 50);
         fill(0);
         text("Start", 330, 215+0*70);
         //box2
         fill(255);
         rect(290, 180+1*70, 220, 50);
         fill(0);
         text("Credit", 330, 215+1*70);
         //box3
         fill(255);
         rect(290, 180+2*70, 220, 50);
         fill(0);
         text("Exit", 330, 215+2*70);
      }else if(pilih < 0){
         fill(#FFB20A);
         rect(290, 180+0*70, 220, 50);
         fill(0);
         text("Start", 330, 215+0*70);
         //box2
         fill(255);
         rect(290, 180+1*70, 220, 50);
         fill(0);
         text("Credit", 330, 215+1*70);
         //box3
         fill(255);
         rect(290, 180+2*70, 220, 50);
         fill(0);
         text("Exit", 330, 215+2*70);
         if(keyCode==ENTER)
            scene=1+1;
      }else if(pilih < 2){
         fill(255);
         rect(290, 180+0*70, 220, 50);
         fill(0);
         text("Start", 330, 215+0*70);
         //box2
         fill(#FFB20A);
         rect(290, 180+1*70, 220, 50);
         fill(0);
         text("Credit", 330, 215+1*70);
         //box3
         fill(255);
         rect(290, 180+2*70, 220, 50);
         fill(0);
         text("Exit", 330, 215+2*70);
         if(keyCode==ENTER)
            scene=1+2;
      }else if(pilih > 1){
         fill(255);
         rect(290, 180+0*70, 220, 50);
         fill(0);
         text("Start", 330, 215+0*70);
         //box2
         fill(255);
         rect(290, 180+1*70, 220, 50);
         fill(0);
         text("Credit", 330, 215+1*70);
         //box3
         fill(#FFB20A);
         rect(290, 180+2*70, 220, 50);
         fill(0);
         text("Exit", 330, 215+2*70);
         if(keyCode==ENTER)
            scene=1+3;
      }

      textSize(40);
      if (scene==1)
      {
        background(#987A48);
        text("Scene #1", 350, 50);
      }
      if (scene==2)
      {
        background(#935762);
        text("Scene #2", 350, 50);
      }
      if (scene==3)
      {
        background(#A53C99);
        text("Scene #3", 350, 50);
      }
      if (scene > 0)
      {
        triangle(10, 10, 20, 0, 20, 20);
        rect(20, 6, 20, 8);
        if (keyCode==BACKSPACE)
        scene=0;
      }
  
  }
  
  void keyPressed(){
    if(key==CODED)
      {
        if(keyCode==UP){
            pilih-=1;
        }else if(keyCode==DOWN){
            pilih+=1;
        }
      }
      else fill(255);
    
  }
}
