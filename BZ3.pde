// bezier end segment

void bz3 (PVector p0, PVector p1, PVector p2) {
  //println ("BZ3: ", p0, p1, p2);
  // midline L0-L1
  PVector m01 =  midPoint (p0, p1);
  PVector m12 =  midPoint (p1, p2);

  //proportion along the midline
  float R_L0L1 = tangentRatio(p0, p1, p2);

  // ratio point q1 on m01-m12
  PVector q1 =  tangentPoint (m01, m12, -R_L0L1);

  // control points c1, c2 (end point)
  PVector c1 = tr(m01, q1, p1);
  PVector c2 = new PVector (m12.x, m12.y);

  //bezier (p1.x, p1.y, c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
  bzDraw (p1, c1, c2, p2);
}



