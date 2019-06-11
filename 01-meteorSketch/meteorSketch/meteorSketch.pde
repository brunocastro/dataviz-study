//Libraries
import processing.pdf.*;

//global variables
PShape baseMap;
String csv[];
String name;
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
  //PDF recorder
  beginRecord(PDF, "output.pdf");
  
  // print map on background
  shape(baseMap, 0, 0, width, height);
  
  // plot eliptical marks  
  for (int i=1; i<myData.length; i++) {
    noStroke();
    // Format size and position Mark  
    float graphLong = map(float(myData[i][6]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][5]), 90, -90, 0, height);
    float mass = 0.04*sqrt(float(myData[i][2]))/PI;
    // Format color
    float markColor = map(float(myData[i][2]),0,60000000,220,0);
    fill(255,markColor,0,154);
    // Make mark
    ellipse(graphLong,graphLat,int(mass),int(mass));
    
    //Plot text on bigest marks
    if (mass > 50) {
      name = myData[i][1];
      fill(0);
      if((graphLong > width/2) || (name.equals("Chupaderos"))) {
        textAlign(LEFT);
        textFont(fontFaceBold);
        text(name,graphLong + mass, graphLat);
        textFont(fontFace);
        text(myData[i][4],graphLong + mass, graphLat+15);
        noFill();
        stroke(0);
        line(graphLong, graphLat, graphLong+mass, graphLat);
      } else {
        textAlign(RIGHT);
        textFont(fontFaceBold);
        text(name,graphLong - mass, graphLat);
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
