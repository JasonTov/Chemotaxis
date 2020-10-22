 //declare bacteria variables here   
 Bacteria[] colony;
 float strength = 10;
color randColor()
 {
   return color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
 }
 void setup()   
 {     
   size(300,300);
   colony = new Bacteria[25];
   color groupColor = randColor();
   for(int i=0;i<colony.length;i++)
   {
     colony[i]=new Bacteria(groupColor);
   }
   //initialize bacteria variables here   
 }   
 void mouseClicked()
 {
   colony = new Bacteria[25];
   color groupColor = randColor();
   for(int i=0;i<colony.length;i++)
   {
     colony[i]=new Bacteria(groupColor);
   }
 }
 void keyTyped()
 {
   if(key=='e')
   {
     strength +=0.5;
   }
   if(key=='q')
   {
     strength -=0.5;
   }
 }
 void draw()   
 {    
   //move and show the bacteria  
   background(255,255,255,255);
   for(int i=0;i<colony.length;i++)
   {
     colony[i].show();
     colony[i].walk();
   }
   text(strength,15,15);
 }  
 float bias(char type, float loc)
 {
   float out = 0;
   if(type=='x')
   {
     out = (mouseX-loc)/300;
   }
   if(type=='y')
   {
     out = (mouseY-loc)/300;
   }
   return strength/10*out;
 }
 class Bacteria    
 {     
   //lots of java!   
   float x,y;
   color c;
   Bacteria(color stroke)
   {
     x = (float)(Math.random()*300);
     y = (float)(Math.random()*300);
     c = stroke;
   }
   void show()
   {
     stroke(c);
     fill(c);
     ellipse(x,y,4,4);
   }
   void walk()
   {
     x+=((Math.random()*2-1)+bias('x',x));
     y+=((Math.random()*2-1)+bias('y',y));
   }
 }    
