// Tangent point ratio of 2 lines p1-p2  and p2-p3
// there has been a certain amount of hand tuning here to prevent
// serious zeros and infinities.
float tangentRatio (PVector p1, PVector p2, PVector p3) {
  float D1 = max(dist(p1.x, p1.y, p2.x, p2.y), 2.0);
  float D2 = max(dist(p2.x, p2.y, p3.x, p3.y), 2.0);
  float DR;

  // we want a ratio < 1 
  if (D1 >= D2)
    DR = D2/D1;
  else
    DR = D1/D2;
    
  // one-sided conterols should be equalized
  if (DR > 0.75) DR = 0.5;
  
  // works for some reason (probably L->R drawing)
  if (D1 > D2) DR = 1.0 - DR;
  
  return DR; // could judt be 0.5, too
}

// Tangent point location from m01 to m12
// as a fraction given by tRatio (from 0 to 1)
PVector tangentPoint (PVector m01, PVector m12, float tRatio) {
  float tpX = lerp(m01.x, m12.x, tRatio);
  float tpY = lerp(m01.y, m12.y, tRatio);
  return new PVector (tpX, tpY);
}

// midpoint of two points
PVector midPoint (PVector p1, PVector p2) {
  float mX = max ((p1.x+p2.x)/2.0, 0.1);
  float mY = max ((p1.y+p2.y)/2.0, 0.1);
  return new PVector (mX, mY);
}

// translate p3 in the same direction as 
// would folow translating p1 to p2
PVector tr (PVector p3, PVector p1, PVector p2) {
  float dx = p2.x-p1.x;
  float dy = p2.y-p1.y;
  PVector pv = new PVector (p3.x+dx, p3.y+dy);
  //println("TR: ", p3, " to ", pv, " as ", p1, " to ", p2, dx, dy);
  return pv;
}

// line between points
void pVline (PVector p1, PVector p2) {
  line (p1.x, p1.y, p2.x, p2.y);
}

// ellipse at a point
void pVellipse (PVector cp, int w, int h) {
  ellipse (cp.x, cp.y, w, h);
}

// true if the PVector p is close to null.
boolean pNull (PVector p) {
  boolean value = false;
  if (p.x < 0.1 &&
      p.y < 0.1) value = true;
  return value;
}

// load the current mouseX,Y into a PVector
PVector mousetoPV () {
  return (new PVector (mouseX, mouseY));
}

