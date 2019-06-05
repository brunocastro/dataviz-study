//Libraries
import processing.pdf.*;

//global variables
PShape baseMap;
String csv[];
String myData[][];
PFont fontFace;

//Setup
void setup() {
  size(1200,600);
  noLoop();
  smooth(4);
  baseMap = loadShape("../data/WorldMap.svg");
  fontFace = createFont("Montserrat", 14);
  csv = loadStrings("../data/MeteorStrikes.csv");
  myData = new String[csv.length][6];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
  
}

//Draw
void draw() {
  beginRecord(PDF, "output.pdf"); 
  shape(baseMap, 0, 0, width, height);
  for (int i=0; i<myData.length; i++) {
    noStroke();
    float originMass = float(myData[i][2]);
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float mass = 0.04*sqrt(originMass)/PI;
    fill(255,0,0,75);
    ellipse(graphLong,graphLat,int(mass),int(mass));
    if (originMass < 8600000) {
      fill(0);
      textFont(fontFace);
      text(myData[i][0],graphLong + mass, graphLat);
      noFill();
      stroke(0);
      line(graphLong, graphLat, graphLong+mass, graphLat);
    } 
  }
  endRecord();  
}
