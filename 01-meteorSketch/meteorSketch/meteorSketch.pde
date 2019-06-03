//Libraries



//global variables
PShape baseMap;
String csv[];
String myData[][];

//Setup
void setup() {
  size(1800,900);
  noLoop();
  baseMap = loadShape("../data/WorldMap.svg");
  csv = loadStrings("../data/MeteorStrikes.csv");
  myData = new String[csv.length][6];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
  println(myData[30][4]);
}

//Draw
void draw() {
  shape(baseMap, 0, 0, width, height);
  
}
