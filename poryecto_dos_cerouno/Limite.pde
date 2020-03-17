class Limite
{
 float x,y;
 float w;
 float h;
 Body b;
 
 Limite(float x_, float y_, float w_, float h_)
 {
  w = w_;
  y = y_;
  h = h_;
  x = x_;
  
  BodyDef bd = new BodyDef();
  Vec2 posicionInicial = new Vec2(x_,y_);
  Vec2 posicionEnMundo = mundo.coordPixelsToWorld(posicionInicial);
  bd.position.set(posicionEnMundo);
  bd.type = BodyType.STATIC;
  
  b = mundo.createBody(bd);
  b.setLinearVelocity(new Vec2(random(-5,5),random(10)));
  b.setAngularVelocity(random(-5,5));
  
  PolygonShape ps = new PolygonShape();
  float ancho = mundo.scalarPixelsToWorld(w_);
  float alto = mundo.scalarPixelsToWorld(h_);
  ps.setAsBox(ancho/2,alto/2);
 
 FixtureDef fd = new FixtureDef();
 fd.shape = ps;
 fd.friction = 0.3;
 fd.restitution = 0.4;
 fd.density = 1;
 
 b.createFixture(fd);
 }
  void display()
  {
    pushMatrix();
    translate(x,y);
    rectMode(CENTER);
    noStroke();
    fill(0);
    rect (1,1,w,h);
    popMatrix();
  }

}
