import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
pantalla1 inicio;
Comida una;
Limite suelo;
 float x =0 ;
  float y = 0;
  float r = 14;
  float veloz = 5;
  int estado = 0;
  int p=0;
 ArrayList <Serpiente> snake;
ArrayList <Comida> comidas;
ArrayList <Limite> suelos;

//ArrayList snake = new ArrayList();
Box2DProcessing mundo;
//Serpiente snake;
void setup()
{
 inicio = new pantalla1();
size (500,500);
smooth();
rectMode(CENTER);
mundo = new Box2DProcessing (this);
mundo.createWorld();
mundo.listenForCollisions();
una = new Comida (200,30,20,10);
suelos = new ArrayList <Limite>();
comidas = new ArrayList <Comida>();
//snake = new ArrayList <Serpiente>();
suelos.add( new Limite(100,500,900,10));
suelos.add(new Limite(width-5,height/2,10,height));
suelos.add(new Limite(5,height/2,10,height));
//snake = new Serpiente(width/2,height/2,snake);
}

//void draw()
//{
//mundo.step();
//background (255);
//for (Comida c:comidas)
//  {
//    c.display();
//  }
// for (Limite w: suelos)
//  {
//   w.display();
//  }
  
//}
void draw ()
{
  
 pushMatrix();
 background (0);
 fill (#F390E1);
 noStroke();
 ellipse(x, y, 20,20);
 popMatrix();
 mundo.step();
 for (Comida c:comidas)
  {
   c.display();
  }
for (Limite w:suelos)
  {
   w.display();
  }
  
 if (p==0)
 {
 inicio.display();
    if (mousePressed)
   {
     p = 1;
   }
  if (p == 1)
  {
    estado = 0;
  }  
 }
 if (estado == 0)
  {
    x += veloz;
    if (x >= width - 20)
     {
     estado = 1;
     }
  }else if (estado == 1)
    {
     y += veloz;
     if(y > height - 20)
      {
        estado = 2;
      }
    }else if (estado == 2)
      {
        x -=veloz;
        if (x < 18)
        {
         estado = 3;
        }
      }else if (estado == 3)
      y -= veloz;
      if (y < 0)
      {
       y = 0;
       estado = 0;
      }
}

void mousePressed()
{
comidas.add(new Comida(mouseX, mouseY, 20,20));
}
