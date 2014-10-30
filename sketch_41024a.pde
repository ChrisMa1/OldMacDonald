PImage bg;
//Duck blah;
Animal[] livestock= new Animal[10];
void setup(){
    size(800,800);
    bg= loadImage("ground.jpg");
    //blah = new Duck();
    for(int i=0; i<livestock.length; i++){
      if(i<=4){ 
        livestock[i]=new Duck();
      }else{
        livestock[i]=new Fox();
      }  
    }
}
interface Animal{
  public void speak();
  public void show();
  public void move();
}
abstract class Model implements Animal{
  protected int x=(int)(Math.random()*(width-80)+40);
  protected int y=(int)(Math.random()*(height-80)+40);
  protected int tX=(int)(Math.random()*(width-80)+40);
  protected int tY=(int)(Math.random()*(height-80)+40);
  protected String say;
  protected PImage img;
  public void speak(){
    textSize(10);
    stroke(255);
    if((millis()/1000)%2==0){
      text(say, x+50, y+30);
    }
  }
  public void move(){
    if(x!=tX && y!=tY){
      x+=(tX-x)*(2/dist(x,y, tX,tY)); 
      y+=(tY-y)*(2/dist(x,y, tX,tY));   
    }else{
      tX=(int)(Math.random()*width);
      tY=(int)(Math.random()*height);  
    }
  }
  public void show(){
      image(img,x,y,50,75);
  }
}
class Duck extends Model{
  Duck(){
      say= "Quack";
      img= loadImage("duck.png");
  }  
}
class Fox extends Model{
  Fox(){
      say= "Ring-ding-ding-ding-dingeringeding!";
      img= loadImage("fox.png");
  }  
}
void draw(){
  image(bg, 0,0, width, height);
  for(int i=0; i<livestock.length; i++){
    livestock[i].show();
    livestock[i].move();
    livestock[i].speak();
  }
}

