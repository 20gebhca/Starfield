//import the photos for the particles
PImage photo;
PImage falcon;
PImage star;
//tell java you are going to use an array of Particle called myparticles
Particle[] myparticles;
void setup()
{
  size(700, 700);
  //name the photos you are going to import from the sketchbook folder
  photo = loadImage("TIEfighter-Fathead.png");
  falcon = loadImage("MillenniumFalconTFA-Fathead.png");
  star = loadImage("Deathstar_negwt.png");
  //initialize the array
  myparticles=new Particle[20];
  //fill the "apartments" 
  for (int nI=0; nI<myparticles.length; nI++) {
    myparticles[nI]=new NormalParticle();
  }
  //create 2 new versions called Oddball and Jumbo
  myparticles[1]=new OddballParticle(); 
  myparticles[2]=new JumboParticle();
}
void draw()
{
  //draw the particles and display them on the screen 
  for (int nI=0; nI<myparticles.length; nI++) {
    myparticles[nI].show();
    myparticles[nI].move();
  }
  myparticles[1].show();
}
//supposed to redraw the screen but it does not work
void mousePressed() {
  redraw();
}
class NormalParticle implements Particle
{
  //NormalParticle values that will be used
  double x;
  double y;
  int mycolor;
  double angle;
  double speed;
  double myy=350;
  double myx=350;
  //Constructor to set the values and their orgin
  NormalParticle() 
  {
    x=width/2;
    y=height/2;
    speed=Math.random()*3;
    angle=Math.random()*Math.PI*2;
  }
  //Move method to make the normal particles move away from the center of the screen in a random speed and direction
  void move()
  {
    x=x+((Math.cos(angle))*speed);
    y=y+(Math.sin(angle)*speed);
  }

  // Show method to draw and display the tie fighers at their random speeds and directions
  void show()
  {
    image(photo, (int)x, (int)y, 25, 25);
  }
}
//Jumbo particle class
class JumboParticle extends NormalParticle
{
  void show()
  {
    //Displays the JumboParticle as the deathstar image at its random values
    myy+=Math.random()*2;
    myx+=Math.random()*-2;
    image(star, (int)myx, (int)myy, 100, 100);
  }
}
//the interface that stores all of the classes
interface Particle
{
  public void show();
  public void move();
}
//OddballParticle class
class OddballParticle implements Particle
{
  //creates custom variables used in the Oddball class
  double x;
  double y;
  int mycolor;
  double angle;
  double speed;
  OddballParticle() {
    x=width/2;
    y=height/2;
    speed=4;
    angle=Math.random()*Math.PI*1;
  }
  //Creates random values throughout the program of where to display the particle
  void move()
  {
    x=x+(random(-1, 1)*speed);
    y=y+(random(-1, 1)*speed);
    background(0);
  }
  //displays the Oddball particle
  void show()
  {
    image(falcon, (int)x, (int)y, 50, 50);
  }
}
