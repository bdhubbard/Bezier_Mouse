// bezier start segment

void bz1 (PVector p0, PVector p1, PVector p2) {
  //println ("Bz1: ", p0, p1, p2);
  // midline L0-L1
  PVector m01 =  midPoint (p0, p1);
  PVector m12 =  midPoint (p1, p2);
  
  //proportion along the midline
  float R_L0L1 = tangentRatio(p0, p1, p2);
  
  // ratio point q1 on m01-m12
  PVector q1 =  tangentPoint (m01, m12, R_L0L1);

  // point c0
  PVector c0 = new PVector (m01.x, m01.y);

  // point c1
  PVector c1 = tr(m01, q1, p1);
  
  // bezier (p0.x, p0.y, c0.x, c0.y, c1.x, c1.y, p1.x, p1.y);
    bzDraw (p0, c0, c1, p1);
}



