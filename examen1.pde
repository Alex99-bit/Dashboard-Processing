
class Dashboard{
  int[] c = new int[4];
  float per[] = new float[4], grad[] = new float[4];
  boolean porcentaje;
  
  Dashboard(){
    c[0] = 25;
    c[1] = 30;
    c[2] = 45;
    c[3] = 15;
    porcentaje = false;
  }
  
  void DashRect(int x,int y){
     fill(25);
     rect(x,y,15,c[0]*3);
     rect(x+25,y-15,15,c[1]*3);
     rect(x+50,y-60,15,c[2]*3);
     rect(x+75,y+30,15,c[3]*3);
     
     fill(255);
     
     rect(x-10,y+80,120,3);
     rect(x-10,y-150,3,100*2.5);
     
     textSize(18);
     text("C1",x,y+100);
     text(c[0],x,y);
     
     text("C2",x+25,y+100);
     text(c[1],x+25,y-15);
     
     text("C3",x+50,y+100);
     text(c[2],x+50,y-60);
     
     text("C4",x+75,y+100);
     text(c[3],x+75,y+30);
  }
  
  void DashCake(int x,int y,int radio){
    if(!porcentaje){
      Porcentajes();
    }
    
    fill(#E515E5);
    arc(x,y,radio,radio,radians(0),radians(grad[0]),PIE);
    fill(#156DE5);
    arc(x,y,radio,radio,radians(grad[0]),radians(grad[1]+grad[0]),PIE);
    fill(#8BFF83);
    arc(x,y,radio,radio,radians(grad[1]+grad[0]),radians(grad[2]+grad[1]+grad[0]),PIE);
    fill(#FFA283);
    arc(x,y,radio,radio,radians(grad[2]+grad[1]+grad[0]),radians(grad[3]+grad[2]+grad[1]+grad[0]),PIE);
  }
  
  void DashDonut(int x,int y,int radio,int radonut){
    if(!porcentaje){
      Porcentajes();
    }
    
    fill(#E515E5);
    arc(x,y,radio,radio,radians(0),radians(grad[0]),PIE);
    fill(#156DE5);
    arc(x,y,radio,radio,radians(grad[0]),radians(grad[1]+grad[0]),PIE);
    fill(#8BFF83);
    arc(x,y,radio,radio,radians(grad[1]+grad[0]),radians(grad[2]+grad[1]+grad[0]),PIE);
    fill(#FFA283);
    arc(x,y,radio,radio,radians(grad[2]+grad[1]+grad[0]),radians(grad[3]+grad[2]+grad[1]+grad[0]),PIE);
    
    fill(100);
    circle(x,y,radonut);
  }
  
  void Porcentajes(){
    //En este metodo se hacen los porcentajes para cada C
    float suma = 0;
    for(int i=0;i<4;i++){
      suma += c[i];
    }
    
    for(int i=0;i<4;i++){
      per[i] = (c[i]*100)/suma;
      print(" >>C"+i+": "+per[i]+"%<< ");
    }
    
    print("/n");
    
    // aqui saca los grados equivalentes de los porcentajes
    for(int i=0;i<4;i++){
      grad[i] = (per[i]*360)/100;
      print(" >>C"+i+": "+grad[i]+"<< ");
    }
    
    porcentaje = true;
  }
}

Dashboard graph = new Dashboard();

void setup(){
  size(1920,1080);
}

void draw(){
  background(100);
  graph.DashRect(100,250);
  graph.DashCake(550,250,200);
  graph.DashDonut(550,600,200,100);
}
