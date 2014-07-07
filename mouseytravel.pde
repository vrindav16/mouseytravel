/*make a class called point with x, y, used or not (boolean)
array of points (the class)
then do for loops to compare distances from a set city (not in setup, make a new function call in setup)
check whether each point is used or not BEFORE calculating distance
classname.trait to access it
class Car {
  int color;
}
Car one = new Car;
one.color = 34;

update min or repeat for loop
store endpoint of minimum distance into array
as for loop ends, draw the line */


int min = 0; //keeps track of current shortest path
int[] currentPt;
int[] nextPt;
int j;
/*@pjs preload="map.jpg";*/

void setup (){
  size (1200, 715);
  PImage b = loadImage("map.jpg");
  background(b);
  frameRate(1);
  int[][] coordinates = {
    {158,325},
    {157,328},
    {157,332},
    {301,326},
    {153,319},
    {299,324},
    {309,318},
    {302,323},
    {819,368},
    {658,316},
    {937,387},
    {941,386},
    {962,383},
    {964,381}
  };
  
  findShortestPath(coordinates);
}

void findShortestPath(int[][] coordinates) {
  for (int i = 0; i < 14; i++) {
    currentPt = coordinates[i];
  
    for (int j=i+1; j<13; j++) {
       int[] nextPoint = coordinates[j];
       int distance = calculateDistance(currentPt, nextPoint);
       
       if ((distance < min) || (min==0)) {
         min=distance;
         nextPt = nextPoint;
      }        
    }
    //line ();
  
  }
   /*
  int xpos = point[0];
  int ypos = point[1];
  println(xpos, ypos);*/

}

int calculateDistance(int[] a, int[] b) {
  int distance = 0;
  
  /* calculate with pythagorean theorem */
  int a_xpos = a[0];
  int a_ypos = a[1];
  int b_xpos = b[0];
  int b_ypos = b[1];
  distance = abs(((a_xpos-b_xpos)^2+(a_ypos-b_ypos)^2)^(1/2));
  return distance;
}


void draw() {
  fill(255,0,0);
  ellipse (158,325,5,5);
  ellipse (157,328,5,5);
  ellipse (157,332,5,5);
  ellipse (301,326,5,5);
  ellipse (153,319,5,5);
  ellipse (299,324,5,5);
  ellipse (309,318,5,5);
  ellipse (302,323,5,5);
  ellipse (819,368,5,5);
  ellipse (658,316,5,5);
  ellipse (960,355,5,5);
  ellipse (937,387,5,5);
  ellipse (941,386,5,5);
  ellipse (962,383,5,5);
  ellipse (964,381,5,5);
  
  if (j == 12) {
   // println
    line (currentPt[0], currentPt[1], nextPt[0], nextPt[1]);
    println("HIIIIII");
    
  }
 /* line (158,325,157,328);
  line (157,328,157,332);
  line (157,332,153,319);
  line (153,319,299,324);
  line (299,324,301,326);
  line (301,326,302,323);
  line (302,323,309,318);
  line (309,318,658,316);
  line (658,316,819,368);
  line (819,368,937,387);
  line (937,387,941,386);
  line (941,386,960,355);
  line (960,355,962,383);
  line (962,383,964,381);
  line (964,381, 158,325);*/


}

