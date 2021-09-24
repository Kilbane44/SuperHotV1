class Enemy extends Object
{
  int lastShot = 0;
  int reload = 1000;
  
  Enemy()
  {
    pos = new PVector(random(width), random(height));
  }
  
  
  void Render()
  {
    fill(255,0,0);
    ellipse(pos.x, pos.y, 40, 40);
  }
  
  
  
  void Fire()
  {
    PVector bulletDirection = p.pos.copy().sub(pos.copy());
    if(millis() - lastShot > reload)
    {
      lastShot = millis();
      bullets.add(new Bullet(pos,bulletDirection));
    }
  }
}
