import processing.sound.*;

int ChemicalCount= 500;
Bubbles []Bubs= new Bubbles [100];

PImage smoke;
PImage poison;
PImage flaskgood;
PImage match;
PImage flaskbad;
PImage fire;
int poisonx= -300;
int poisony= 150;
int poisonwidth= 200;
int poisonheight= 200;

PFont MS;
PFont Danger;

boolean drawBubbles= false;

Chemical[] Rush = new Chemical[ChemicalCount];


SoundFile file;

void setup()
{
  textAlign(CENTER);
  MS= createFont("MadScience.ttf", 100);
  Danger=createFont("Danger.ttf", 40);
  fullScreen();
  noStroke();
  smoke=loadImage("smoke.jpg");
  smoke.resize(width, height);
  poison=loadImage ("poison.png");
  flaskgood=loadImage ("flaskgood.png");
  match= loadImage ("match.png");
  flaskbad=loadImage("flaskbad.png");
  fire=loadImage ("fire.jpeg");

  file = new SoundFile(this, "Feeling.mp3");
  file.play();
  file.jump(22);

  noCursor();

  for (int i=0; i < ChemicalCount; i++)
  {
    Rush[i] = new Chemical();
  }

  for (int i=0; i<100; i++)
  {
    Bubs[i]=new Bubbles();
  }
}

void draw ()


{
  SetBackground();
  InsertFont();
  PoisonSkull();
  Bubbles();
  FlaskAction();
  BubbleMore();
}
void SetBackground ()
{


  background (smoke);
}
void InsertFont ()
{
  fill(86, 155, 83);
  textFont(MS);
  text("toxic", width/2, height/2);

  fill(250, 3, 110);
  textFont(Danger);
  text("explore the lab if you dare", width/2, height/2-100);
}

void PoisonSkull ()
{
  tint(0);
  image(poison, poisonx, poisony, poisonwidth, poisonheight); 
  poisonx= poisonx+ 3;
  noTint();
}

void Bubbles ()
{
  if (drawBubbles==true)
  {
    for (int i=0; i<100; i++)
    {
      Bubs [i]. Render();
    }
  }
}

void FlaskAction ()
{
  image(flaskgood, 200, height-250, 200, 250);

  image(match, mouseX, mouseY, 100, 100);
  image(flaskbad, 950, height-250, 200, 250);

  if (dist(mouseX, mouseY, 1000, height-150)< 25+100)
    ///BOOOOOMMM!
  {
    image(fire, 0, 0, width, height);
    textFont(MS);
    fill(250, 3, 110);
    text("you failed", 300, 300, width/2+150, height/2+100);
  }
  if (poisonx>width)
  {
    poisonx=-200;
  }
  for (int i=0; i < ChemicalCount; i++)
  {
    Rush[i].Fall();
    Rush[i].Render();
  }
}

void BubbleMore()
{
  if (dist(250, height-250, mouseX, mouseY)<200)
  {
    drawBubbles=true;
  }

  if (dist(250, height-250, mouseX, mouseY)>200)
  {
    drawBubbles=false;
  }
}