class Bubbles
{
  float x;
  float y;
  float speed; 

  Bubbles()
  {
    x= 300;
    y= height- height/4;
    speed = random(0.9, 2.5);
  }

  void Render()
  {
    stroke(0);
    strokeWeight(0.3);
    fill(119, 194, 206, 75);
    ellipse(x, y, 20, 20);

    y-=speed;
    x+=random(-3, 3);

    if (y<0)
    { 
      y=height- height/4;
      x=300;
    }
  }
}