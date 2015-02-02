// assume p0 -> p3 motion
// All distance ratios should product the smaller number when traveling from L1 -> L2
// The Lerp point then starts at Line 1 and lerps towards Line 2
// bezier continue

void bz2 (PVector p0, PVector p1, PVector p2, PVector p3) {
  //println ("BZ2: ", p0, p1, p2, p3);
  // midline L0-L1
  PVector m01 =  midPoint (p0, p1);
  PVector m12 =  midPoint (p1, p2);
  
  //proportion along the midline
  float R_L0L1 = tangentRatio(p0, p1, p2);

  // ratio point q1 on m01-m12
  PVector q1 =  tangentPoint (m01, m12, R_L0L1);

  // control points c1, c2
  PVector c1 = tr(m01, q1, p1);
  PVector c2 = tr(m12, q1, p1);

  // midline m2-m3
  PVector m23 =  midPoint (p2, p3);

  //proportion along the midline
  float R_L1L2 = tangentRatio(p1, p2, p3);

  // ratio point q2 on m12-m23
  PVector q2 =  tangentPoint (m12, m23, R_L1L2); 
  
  // control points c3 and c4
  PVector c3 = tr(m12, q2, p2);

  // bezier (p1.x, p1.y, c2.x, c2.y, c3.x, c3.y, p2.x, p2.y);
  bzDraw (p1, c2, c3, p2);
}



