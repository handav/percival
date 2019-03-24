import rita.*;
import ddf.minim.* ;
import ddf.minim.signals.* ;
import ddf.minim.effects.* ;

Minim minim;
// SAMPLES 
AudioSample PianoC2;
AudioSample PianoEb2;
AudioSample PianoAb2;
AudioSample PianoG2;
AudioSample PianoB3;
AudioSample PianoC3;
AudioSample PianoEb3;
AudioSample PianoD3;
AudioSample PianoG3;
String typed_text = "";
int vertical = 25;
int horizontal = 25;
String[] allText;
ArrayList<Line> allLines=new ArrayList();
int wordCounter =0 ;
int lineCounter = 0;
boolean over = false;

Line currentLine;
int iterateThroughLines = 0;

void setup() {
  size(1200, 700);
  smooth();
  minim = new Minim(this) ;

  PianoC2 = minim.loadSample("PianoC2.aiff", 512);
  PianoEb2 = minim.loadSample("PianoEb2.aiff", 512);
  PianoAb2 = minim.loadSample("PianoAb2.aiff", 512);
  PianoG2 = minim.loadSample("PianoG2.aiff", 512);
  PianoB3 = minim.loadSample("PianoB3.aiff", 512);
  PianoC3 = minim.loadSample("PianoC3.aiff", 512);
  PianoEb3 = minim.loadSample("PianoEb3.aiff", 512);
  PianoD3 = minim.loadSample("PianoD3.aiff", 512);
  PianoG3 = minim.loadSample("PianoG3.aiff", 512);

  loadWords();
  frameRate(2);
  textSize(30);
  textAlign(CENTER);
}

void draw() {
  if (over == false) {
    frameRate(2);
    background(50);
    fill(255);
    String tag = currentLine.taggedLine[wordCounter];
    text(currentLine.lineText, 30, 30, width-60, height-60);
    currentLine.playNotes(tag);
    wordCounter+=1;
    if (wordCounter>= currentLine.taggedLine.length-1) {
      noLoop();
    }
  }else{
   noLoop(); 
  }
}


void loadWords() {
  allText=loadStrings("percival_text.txt");
  for (int i=0; i<allText.length; i++) {
    Line l = new Line(allText[i], i);
    if (i==0) {
      currentLine = l;
    }
    allLines.add(l);
  }
}

void keyTyped() {
  if (key == ENTER) {
    println(lineCounter);
    println(allLines.size());
    if (lineCounter < allLines.size()-1) {
      println("KEY IS ENTER");
      loop();
      lineCounter += 1;
      wordCounter = 0;
      println("Linecounter");
      println(lineCounter);
      currentLine = allLines.get(lineCounter);
      draw();
    } else {
      over = true;
      noLoop();
    }
  }
  //if (key == ' ') {
  //  typed_text = typed_text + " ";
  //}
  //typed_text = typed_text + str(key);
  // println("typed " + String(key) + " " + key);
}
