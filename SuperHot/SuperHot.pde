import processing.sound.*;


SoundFile bgMusic;
SoundFile pew;


Player p;
boolean up, down, left, right, slow = false;
float TIME = 1;


ArrayList<Bullet> bullets = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();

int lastMouseCheck =0;
int startTime=0;
Enemy e;


void setup()
{
  size(800, 800);
  p = new Player();
  e = new Enemy();
  bgMusic = new SoundFile(this, "rickroll.mp3");
  bgMusic.jumpFrame(100);
  pew = new SoundFile(this, "pew.mp3");
  startTime = millis();
  
  imageMode(CENTER);
}

void draw()
{
  background(0);
  p.Move();
  p.Render();

  e.Render();

  pew.rate(TIME);
  bgMusic.rate(TIME);
  UpdateBullets();
  ManageTime();

    text("The time: " +((millis() - startTime)/1000), 50, 50);
}



void ManageTime()
{
  
  if (millis() - lastMouseCheck > 100)
  {
    lastMouseCheck = millis();
    boolean xSame = false;
    boolean ySame = false;
    if (pmouseX == mouseX)
    {
      xSame = true;
    }

    if (pmouseY == mouseY)
    {
      ySame = true;
    }


    if (xSame && ySame)
    {
      slow = true;
    } else
    {
      slow = false;
    }
  }


  if (slow)
  {
    if (TIME > 0.15)
    {
      TIME -= 0.01;
    }
  } else
  {
    if (TIME < 1)
    {
      TIME += 0.01;
    }
    if (TIME > 1)
    {
      TIME = 1;
    }
  }
}
void UpdateBullets()
{
  for ( int i=bullets.size()-1; i >= 0; i--)
  {
    bullets.get(i).Move();
    bullets.get(i).Render();
  }
}




void mousePressed()
{
  PVector mouse = new PVector(mouseX, mouseY);
  PVector bullDir = mouse.copy().sub(p.pos.copy());
  bullets.add(new Bullet(p.pos, bullDir));
}
void keyPressed()
{

  if (key == 'w')
  {
    up = true;
  }
  if (key == 's')
  {
    down = true;
  }
  if (key == 'a')
  {
    left = true;
  }
  if (key == 'd')
  {
    right = true;
  }
  if (key == ' ')
  {
    slow = true;
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    up = false;
  }
  if (key == 's')
  {
    down = false;
  }
  if (key == 'a')
  {
    left = false;
  }
  if (key == 'd')
  {
    right = false;
  }
  if (key == ' ')
  {
    slow = false;
  }
}


void mouseReleased()
{
  pew.play();
}
