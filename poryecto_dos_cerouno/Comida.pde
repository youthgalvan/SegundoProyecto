

class Comida 
{
 float w;
 float h;
 Body b;
  
  Comida(float x_, float y_, float w_, float h_)
  {
   w = w_;
   h = h_;
   BodyDef bd = new BodyDef();
   Vec2 posicionInicial = new Vec2(x_,y_);
   Vec2 posicionEnMundo = mundo.coordPixelsToWorld(posicionInicial);
   bd.position.set(posicionEnMundo);
   bd.type = BodyType.DYNAMIC;
   
   b = mundo.createBody(bd);
   b.setLinearVelocity (new Vec2(random(-5,5), random (10)));
   b.setAngularVelocity(random(-5,5));
   
   PolygonShape ps = new PolygonShape();
   float ancho = mundo.scalarPixelsToWorld(w_);
   float alto = mundo.scalarPixelsToWorld(h_);
   ps.setAsBox(ancho/2,alto/2);
   
   FixtureDef fd = new FixtureDef();
   fd.shape = ps;
   fd.friction = 0.3;
   fd.restitution = 0.4;
   fd.density =1;
   
   b.createFixture(fd);
  }
  
  void display ()
  {
  Vec2 posicion = mundo.getBodyPixelCoord(b);

   pushMatrix();
    translate (posicion.x,posicion.y);
   // rotate (-angulo);
    rectMode(CENTER);
    noStroke();
    fill(#F390E1);
    ellipse(0,0,w,h);
   popMatrix();
  }

//void alimenta()
//{
// if (x==b.get(x) && y==b.y)
//  {
//  fill (0,255,0); 
//  rectMode(CENTER);
//  rect (0,0,20,30);
//  }
// }
}
