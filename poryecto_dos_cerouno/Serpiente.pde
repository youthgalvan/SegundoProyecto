class Serpiente
{
Body body;
float r;
float col;
 float veloz = 5;
  int estado = 0;
Serpiente (float x, float y, float r_)
{
 r = r_;
 makeBody(x,r,y);
 body.setUserData(this);
 col = color (175);
}

void killBody()
{
mundo.destroyBody(body);
}

void change()
{
col = color (255);
}
 boolean done()
 {
 Vec2 pos = mundo.getBodyPixelCoord(body);
 if (pos.y > height+r*2)
  {
   killBody();
   return true;
  }
   return true;
 }

void display()
{

Vec2 pos = mundo.getBodyPixelCoord(body);
float a = body.getAngle();
pushMatrix();
//translate(pos.x, pos.y);
rotate (a);
fill (col);
ellipse(pos.x, pos.y, r*2,r*2);

  
}
void makeBody (float x, float y, float r)
{
  {
    x += veloz;
    if (x >= width - 20)
     {
     estado = 1;
     }
  } if (estado == 1)
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
BodyDef bd = new BodyDef();
bd.position = mundo.coordPixelsToWorld(x, y);
bd.type = BodyType.DYNAMIC;
body=mundo.createBody(bd);

CircleShape cs = new CircleShape();
cs.m_radius = mundo.scalarPixelsToWorld(r);

FixtureDef fd = new FixtureDef();
fd.shape = cs;

fd.density =1;
fd.friction = 0.01;
fd.restitution = 03;

body.createFixture(fd);
body.setAngularVelocity (random(-10,10));

 }

}
