class Chemical
{
  
  float X;
  float Y;
  float Speed;
  float Alpha;
  Chemical()
  {
    X = random(width);
    Y= random(-500,0);
    Speed = random(1,3);
    Alpha = random(255);
  }
  
  void Fall()
  {
    Y += Speed;
    X-=2;
    if(X < 0)
    {
      X=width;
    }
    if(Y > height)
    {
      Y = random(-500,0);
    }
  }
  
  void Render()
  {
    noStroke();
    fill(255,159,144,Alpha);
    ellipse(X,Y,7,7);
  }
}