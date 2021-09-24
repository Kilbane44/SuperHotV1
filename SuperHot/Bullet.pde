class Bullet extends Object
{
  Bullet(PVector _spawn, PVector _dir)
  {
    speed = 8;
    pos = _spawn.copy();
    dir = _dir.copy();
    dir.normalize();
    dir.mult(speed);
  }
  
  
  void Render()
  {
    ellipse(pos.x, pos.y, 5, 5);
  }
  
  void Move()
  {
    PVector timeWarpDir = dir.copy();
    timeWarpDir.mult(TIME);
    pos.add(timeWarpDir);
  }
}
