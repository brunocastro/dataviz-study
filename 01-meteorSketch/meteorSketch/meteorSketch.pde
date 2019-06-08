//Libraries
import processing.pdf.*;

//global variables
PShape baseMap;
String csv[];
String myData[][];
PFont fontFace;
PFont fontFaceBold;

//Setup
void setup() {
  size(1800,900);
  noLoop();
  smooth(4);
  baseMap = loadShape("../data/WorldMap.svg");
  fontFace = createFont("Teko Light", 16);
  fontFaceBold = createFont("Teko Medium", 24);
  csv = loadStrings("../data/MeteorStrikes.csv");
  myData = new String[csv.length][6];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  } 
}

// Data columns: #,name,mass,fall,year,reclat,reclong

//Draw
void draw() {
  beginRecord(PDF, "output.pdf"); 
  shape(baseMap, 0, 0, width, height);
    for (int i=1; i<myData.length; i++) {
    noStroke();
    float graphLong = map(float(myData[i][6]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][5]), 90, -90, 0, height);
    float mass = 0.04*sqrt(float(myData[i][2]))/PI;
    fill(255,0,0,75);
    ellipse(graphLong,graphLat,int(mass),int(mass));
    
    //Plot text on bigest marks
    if (mass > 50) {
      fill(0);
      if(graphLong > width/2) {
        textAlign(LEFT);
        textFont(fontFaceBold);
        text(myData[i][1],graphLong + mass, graphLat);
        textFont(fontFace);
        text(myData[i][4],graphLong + mass, graphLat+15);
        noFill();
        stroke(0);
        line(graphLong, graphLat, graphLong+mass, graphLat);
      } if (graphLong <= width/2) {
        textAlign(RIGHT);
        textFont(fontFaceBold);
        text(myData[i][1],graphLong - mass, graphLat);
        textFont(fontFace);
        text(myData[i][4],graphLong - mass, graphLat+15);
        noFill();
        stroke(0);
        line(graphLong, graphLat, graphLong-mass, graphLat);
      } 
    } 
  }
  endRecord();  
}
