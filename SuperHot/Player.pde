class Player extends Object
{
  Player()
  {
    speed = 4;
  }


  void Render()
  {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, w, h);
  }

  void Move()
  {
    if (up == true)
    {
      slow = false;
      pos.y -= speed*TIME;
    }
    if (down == true)
    {
      slow = false;
      pos.y += speed*TIME;
    }
    if (left == true)
    {
      slow = false;
      pos.x -= speed*TIME;
    }
    if (right == true)
    {
      slow = false;
      pos.x += speed*TIME;
    }
  }
}
