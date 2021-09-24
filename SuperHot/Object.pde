class Object
{
  PVector pos;
  PVector dir;
  PVector acc;

  float speed; 
  float topSpeed;

  float w, h;


  Object()
  {
    pos = new PVector(400, 400);
    dir= new PVector(0, 0);
    acc= new PVector(0, 0);
    w= 50;
    h = 50;
  }

  void Render()
  {
    ellipse(pos.x, pos.y, w, h);
  }

  void Update()
  {
  }

  void Move()
  {
  }
}
