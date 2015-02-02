// Draws a bezier connected curve between mouse points
// uses the bezier function and tangent segment joints
// Has 3 bezier functions (for now) -
// bz1 to start a run
// bz2 for the middle points
// bz3 for the last point
//
// Makes heavy use of PVector to make point handling more convenient, 
// but no attention has been put towards allocating these efficiently
//
// Bruce Hubbard 2015/02/01 
// V1.0 from http://www.benknowscode.com/2012/09/path-interpolation-using-cubic-bezier_9742.html
// V1.4 - remove most debugging statements


// 4 successive mouse points for bezier
// mp1 and mp2 are the actul drawing points
// mp0 and mp3 are used to calculate tangent handles
// between bezier segments.
PVector mp0 = new PVector (0, 0);
PVector mp1 = new PVector (0, 0);
PVector mp2 = new PVector (0, 0);
PVector mp3 = new PVector (0, 0);

void setup () {
  size (800, 800, P3D);
  stroke (255, 255, 0);
  noFill();
  strokeWeight(2);
  smooth(2);
  // assumes RGB color space in stroke commands.
}

boolean mouseValid = false; // true when mouse points are usable

// draw just collects mouse points
// mousePressed event handler actually does the drawing
void draw () {
  // fill mp0-mp4 if empty or mouse distance is large enough
  // mouse distance increases the distance between bz points
  // a mouse distance of 10 is usually good
  float mouseDistance = 10.0;
  if (pNull(mp0) || dist(mp3.x, mp3.y, mouseX, mouseY) > mouseDistance) {
    // true wjen ready to draw
    if (!pNull(mp0)) mouseValid = true;
    // bezier required 4 mouse points to draw a continus line
    mp0 = mp1; //oldest 
    mp1 = mp2;
    mp2 = mp3;
    mp3 = mousetoPV (); // latest mouse point
  }

  // wait for 4 mouse points to fill
}

// Main entry point to the low level bezier routine
// this is called from bz1, bz2, and bz3
// It is here to allow playing with it, such as add little mouse dropping
void bzDraw (PVector p0, PVector c0, PVector c1, PVector p1) {
  // *v* Testing
  //stroke (255, 255, 0);
  //strokeWeight(3);
  //point (p1.x, p1.y);
  //pVline (p0, p1);
  stroke (0, 0, 255);
  pVellipse (p0, 4, 4); // mouse dropping
  //stroke (0,255,0);
  //pVellipse (p1, 3, 3);
  // *^* Testing
  
  // main code
  stroke (255, 255, 0); // stroke color (optional)
  bezier (p0.x, p0.y, c0.x, c0.y, c1.x, c1.y, p1.x, p1.y);
}

// start bezier on first 3 points
void mousePressed () {
  if (mouseValid) bz1 (mp0, mp1, mp2);
}

// draw continuous bezier segments between mp1 and mp2
// mp0 and mp3 are used to compute tagent connection handles
void mouseDragged () {
  //println (dist(pmouseX, pmouseY, mouseX, mouseY));
  if (mouseValid) bz2 (mp0, mp1, mp2, mp3);
}

// end bezier on last 3 points
void mouseReleased () {
  if (mouseValid) bz3 (mp1, mp2, mp3);
}

void keyPressed () {
  if (key ==' ') {
    background (200);  // erase
    mouseValid = false;
    println("*");
  }
}

