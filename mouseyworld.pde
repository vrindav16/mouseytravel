/*@pjs preload="map.jpg";*/
Point[] cities = {
    new Point(158,325, false),
    new Point(157,328, false),
    new Point(157,332, false),
    new Point(301,326, false),
    new Point(153,319, false),
    new Point(299,324, false),
    new Point(309,318, false),
    new Point(302,323, false),
    new Point(819,368, false),
    new Point(658,316, false),
    new Point(937,387, false),
    new Point(941,386, false),
    new Point(962,383, false),
    new Point(964,381, false)
};
Point start;
Point end;
int min = 0;
int i;

class Point {
  int x,y;
  boolean used;
  Point (int tempx, int tempy, boolean tempValue) {
    x = tempx;
    y = tempy;
    used = tempValue;
  }
}

void setup () {
  size (1200, 715);
  PImage b = loadImage("map.jpg");
  background(b); 
  start = cities[0];
  shortestDistance(cities);
}

void shortestDistance (Point[] cities) {
  while (start.used == false) {
    println("enters loop");
    for (i = 0; i < cities.length; i++) {
      Point next = cities[i];
      println(next.used);
      
      // if next is not the current city and next has not been visited
      if ((next != start) && (next.used == false)) {
        int distance = calculateDistance(start, next);
        if ((distance < min) || (min == 0)) {
          min = distance;
          println(min);
          end = next;
        }
      }
      
    }
    
  start.used = true;
  start = end;
  min = 0;
  println(start.used);
  }
}


int calculateDistance(Point a, Point b) {
  int distance = 0;
  
  /* calculate with pythagorean theorem */
  int a_xpos = a.x;
  int a_ypos = a.y;
  int b_xpos = b.x;
  int b_ypos = b.y;
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
  lines();
}



void lines(){
  if (i == 15) {
    stroke(5);
    line(start.x, start.y, end.x, end.y);
   //println(end.x + " is x. " + end.y + " is y");
  }
}
