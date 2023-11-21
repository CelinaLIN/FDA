import controlP5.*;
ControlP5 cp5;
import ddf.minim.*;
Minim minim;
AudioPlayer music;
AudioPlayer sound;

PFont font1,font2;
PImage logo;
int cellsize = 2;
int cols,rows;

PImage img;
PImage play,pause,next,previous;
int now = 1;
boolean line;
boolean arc;
boolean triangle;
boolean rect;
ArrayList<Integer> angle;
int blockSize = 50;
int b;
int d;





void setup(){
  size(1200,900);
  background(240);
  fill(255);
  noStroke();
  rect(50,50,800,800);
  
  //cols = 2200/3/cellsize;
  //rows = 1700/3/cellsize;
   logo(); 

  //font1 = loadFont("AGaramondPro-Bold-48.vlw");
  //fill(0);
  //textFont(font1);
  //textSize(100);
  //text("Processing", 60,250);
  //text("Patterns", 60,350);
  font2 = loadFont("AvenirNext-Regular-20.vlw");
  fill(0);
  textFont(font2);
  textSize(20);
  text("Step 1, Click and pick a design", 60, 600);
  text("Step 2, Choose background and design color from the colour wheel", 60, 650);
  text("Step 3, Using the",60,700);
  img = loadImage("keys.png");
  image (img,230,650,100,100);
  text("keys on your keyboard to generate pattern sequence", 350,700);
  text("Step 4, Press the start button to start generating pattern", 60, 750);
  text("Step 5, Press the clear button to clear the canva and start again", 60, 800);
  text("1. Pick a design", 900,65);
  text("2. Choose color combination", 900, 400);
  text("3. Enter arrow keys for sequence", 900, 565);
  cp5 = new ControlP5( this );
  cp5.addColorWheel("b" , 900 , 420 , 100 ).setRGB(color(7,42,200));
  cp5.addColorWheel("d" , 1050 , 420 , 100 ).setRGB(color(255,198,0));
  cp5.addSlider("volume")
     .setPosition(900,830)
     .setSize(250,20)
     .setRange(-60,60)
     .setValue(0)
     ;
  minim = new Minim(this);   
  music = minim.loadFile("1.wav");
  music.play();
  music.loop();
  fill(255);
  rect(1000,770,50,50);
  play = loadImage("play.png");
  image (play,1000,770,50,50);
 
  angle = new ArrayList<>();
}


void draw(){
 
//button 1
fill(255);
noStroke();
rect(900,100,100,100);
stroke(0);
line(902,102,998,198);
noStroke();
//button 1 grey when mouse move over
if(pmouseX > 900 & pmouseX < 1000 & pmouseY > 100 & pmouseY <200){
  fill(0,100);
  rect(900,100,100,100);
}

//button 2
fill(255);
noStroke();
rect(1050,100,100,100);
fill(0);
arc(1050,100,200,200,0,HALF_PI);
//button 2 grey when mouse move over
if(pmouseX > 1050 & pmouseX < 1150 & pmouseY > 100 & pmouseY <200){
  fill(0,100);
  rect(1050,100,100,100);
}

//button 3
fill(255);
rect(900,250,100,100);
fill(0);
triangle(900,250,1000,250,900,350);
if(pmouseX > 900 & pmouseX < 1000 & pmouseY > 250 & pmouseY <350){
  fill(0,100);
  rect(900,250,100,100);
}

//button 4
fill(255);
noStroke();
rect(1050,250,100,100);
fill(0);
rect(1050,250,50,100);
//button 4 grey when mouse move over
if(pmouseX > 1050 & pmouseX < 1150 & pmouseY > 250 & pmouseY <350){
  fill(0,100);
  rect(1050,250,100,100);
}

//Enter button
fill(255);
noStroke();
rect(900,600,250,50);
fill(0);
text("Press to start", 960,630);
if(pmouseX > 900 & pmouseX < 1150 & pmouseY > 600 & pmouseY <650){
  fill(0,100);
  rect(900,600,250,50);    
}
  


//Delete button
fill(255);
noStroke();
rect(900,690,250,50);
fill(0);
text("Press to clear", 960,720);
if(pmouseX > 900 & pmouseX < 1150 & pmouseY > 690 & pmouseY <740){
  fill(0,100);
  rect(900,690,250,50);   
}

//Music player
float gain;
//float vol = map(mouseX,0,width,-60,0);
gain = cp5.getController("volume").getValue();
music.setGain(gain);
println(music.getGain());

//println(gain);

fill(255);
rect(900,770,50,50);
previous = loadImage("previous.png");
image (previous, 900,770,50,50);

fill(255);
rect(1100,770,50,50);
next = loadImage("next.png");
image (next, 1100,770,50,50);
}

//println(pmouseX);
//println(pmouseY);
void keyPressed() {
  if (key == CODED){
  if (keyCode == UP) {
    angle.add(1);
    sound = minim.loadFile("177954__ubikphonik__eb1.wav");
    sound.rewind();
    sound.play();
  }
  else if (keyCode == RIGHT) {
    angle.add(2);
    sound = minim.loadFile("177954__ubikphonik__eb1.wav");
    sound.rewind();
    sound.play();
  }
  else if (keyCode == DOWN) {
    angle.add(3);
    sound = minim.loadFile("177954__ubikphonik__eb1.wav");
    sound.rewind();
    sound.play();
  }
  else if (keyCode == LEFT) {
    angle.add(4);
    sound = minim.loadFile("177954__ubikphonik__eb1.wav");
    sound.rewind();
    sound.play();
  }
int angleTotal = angle.size();
println("angle size :" + angleTotal);


}
}

void mouseReleased(){
  //select design 1 line
  if(pmouseX > 900 & pmouseX < 1000 & pmouseY > 100 & pmouseY <200){
    line = true;
    arc = false;
    triangle = false;
    rect = false;
    sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
    sound.rewind();
    sound.play();
  
    
  }
//select design 2 acr  
  if(pmouseX > 1050 & pmouseX < 1150 & pmouseY > 100 & pmouseY <200){
    line = false;
    arc = true;
    triangle = false;
    rect = false;
    sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
    sound.rewind();
    sound.play();
  }
    
//sellect design 3
 if(pmouseX > 900 & pmouseX < 1000 & pmouseY > 250 & pmouseY <350){
   line = false;
    arc = false;
    triangle = true;
    rect = false;
    sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
    sound.rewind();
    sound.play();
  }
  
//select design 4
if(pmouseX > 1050 & pmouseX < 1150 & pmouseY > 250 & pmouseY <350){
 line = false;
    arc = false;
    triangle = false;
    rect = true;
    sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
    sound.rewind();
    sound.play();
} 

// select enter button
if(pmouseX > 900 & pmouseX < 1150 & pmouseY > 600 & pmouseY <650){
  drawPattern();
  sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
  sound.rewind();
  sound.play();
}
  
// delete canvas
  if(pmouseX > 900 & pmouseX < 1150 & pmouseY > 690 & pmouseY <740){  
  noStroke();
  fill(240);
  rect(0,0,850,850);
  fill(255);
  rect(50,50,800,800);
  angle.clear();
  sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
  sound.rewind();
  sound.play();
  }
  
//play previous music
if(pmouseX > 900 & pmouseX < 950 & pmouseY > 770 & pmouseY <820){ 
  now--;
 if(now < 1)
 now = 5;
 music.pause();
 //music.rewind();
 music = minim.loadFile(now+ ".wav");
 music.loop();
 sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
 sound.rewind();
 sound.play();
  
}

//pause music
if(pmouseX > 1000 & pmouseX < 1050 & pmouseY > 770 & pmouseY <820){ 
  
  if(music.isPlaying()){ 
    fill(255);
    rect(1000,770,50,50);
    pause = loadImage("pause.png");
    image (pause,1000,770,50,50);
    sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
    sound.rewind();
    sound.play();
   
    music.pause();
     
  }else{
    music.loop();
    fill(255);
    rect(1000,770,50,50);
    play = loadImage("play.png");
    image (play,1000,770,50,50);
     //music.setGain(gain);
  }
  
}

//play next music
if(pmouseX > 1100 & pmouseX < 1150 & pmouseY > 770 & pmouseY <820){ 
  now++;
 if(now > 5)
 now = 1;
 music.pause();
 music.rewind();
 music = minim.loadFile(now+ ".wav");
 music.loop();
 sound = minim.loadFile("658266__matrixxx__retro-inspect-sound-ui-or-in-game-notification.wav");
 sound.rewind();
 sound.play();
    
  
}  
}
 

void drawPattern(){ 
int x ;
int y ;
x=50;
y=50;
int totalBlocks = 256;
int loopNums = totalBlocks / angle.size();

fill(b);
rect(50,50,800,800);

for(int j = 0; j < loopNums+1; j++){
  for( int i = 0; i< angle.size();i++){ 
    int Angle = angle.get(i);
    println(angle.get(i));
    if(line){
      stroke(d);
          if (Angle==1){
            line(x,y,x+blockSize,y+blockSize);
            x += blockSize;
            if(x==850){         
              y += blockSize;
              x = 50;
                           
            }
          } 
          if (Angle== 2){
            line(x+blockSize,y,x,y+blockSize);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
            
            }
          }
          if (Angle==3){
            line(x,y,x+blockSize,y+blockSize);
            x += blockSize;
            if(x==850){              
              y += blockSize;
              x = 50;
           
            }
          }
          if(Angle== 4){
            line(x+blockSize,y,x,y+blockSize);
            x += blockSize;
            if(x==850){              
              y += blockSize;
              x = 50;
          
          }         
        }
  }
  if(arc){
     fill(d);
          if (Angle==1){            
            arc(x,y,100,100,0,HALF_PI);
            x += blockSize;
            if(x==850){         
              y += blockSize;
              x = 50;
             
              }              
            }
           
          if (Angle== 2){  
            arc(x+blockSize,y,100,100,HALF_PI,PI);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
         
            }
          }
          if (Angle==3){            
            arc(x+blockSize,y+blockSize,100,100,PI,PI+HALF_PI);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
           
            }
          }
          if(Angle== 4){          
           arc(x,y+blockSize,100,100,PI+HALF_PI,TWO_PI);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;           
            }      
        }
  }
  
    if(triangle){
     fill(d);
          if (Angle==1){            
            triangle(x,y,x+blockSize,y,x,y+blockSize);
            x += blockSize;
            if(x==850){         
              y += blockSize;
              x = 50;
             
              }              
            }
           
          if (Angle== 2){  
            triangle(x,y,x+blockSize,y,x+blockSize,y+blockSize);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
         
            }
          }
          if (Angle==3){            
            triangle(x+blockSize,y,x+blockSize,y+blockSize,x,y+blockSize);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
           
            }
          }
          if(Angle== 4){          
           triangle(x+blockSize,y+blockSize,x,y+blockSize,x,y);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;           
            }      
        }
  }
  
  if(rect){
     fill(d);
          if (Angle==1){            
            rect(x,y,blockSize/2,blockSize);
            x += blockSize;
            if(x==850){         
              y += blockSize;
              x = 50;
             
              }              
            }
           
          if (Angle== 2){  
            rect(x,y,blockSize,blockSize/2);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
         
            }
          }
          if (Angle==3){            
            rect(x+blockSize/2,y,blockSize/2,blockSize);
            x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;
           
            }
          }
          if(Angle== 4){          
           rect(x,y+blockSize/2,blockSize,blockSize/2);
           x += blockSize;
            if(x==850){                           
              y += blockSize;
              x = 50;           
            }      
        }
  }
} 
}
noStroke();
fill(240);
rect(50,850,800,50);
}

void logo(){
logo = loadImage("logo2.jpg");
image (logo,0,0,2200/3,1700/3);
//loadPixels();
color[] colorList = {color(#f44336), color(#e91e63), '#9c27b0', '#673ab7', '#3f51b5',
      '#2196f3', '#03a9f4', '#00bcd4', '#009688', '#4CAF50',
      '#8BC34A', '#CDDC39', '#FFEB3B', '#FFC107', '#FF9800',
      '#FF5722'};
logo.loadPixels();
  for (int l = 0; l < logo.width; l++){
    for (int g = 0; g < logo.height; g++){
      int loc = l+g*logo.width; 
      color pb = logo.pixels[loc];
     if(red(pb) < 40){
      fill(random(255));
      noStroke();
      circle(l,g,20);
    }
    //printlin(red(pb));
  }
  updatePixels();
}
}

 












  
