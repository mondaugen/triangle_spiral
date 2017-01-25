// Print out the points that draw a spiral on an equilateral triangle made of
// smaller equilateral triangles.
// Useful if you want to navigate a triangle with a single parameter.
//size(400,400,P3D);
//translate(200,200,200);
PrintWriter output;
output = createWriter("/tmp/pts.txt");

int Ls = 10; // Length of side of triangle.
ArrayList<Integer> mvs = new ArrayList<Integer>();
Integer[] d = {0,Ls};
ArrayList<Integer[]> d_pts = new ArrayList<Integer[]>();
int d_i = 0;
float h = 1.;

int L_ = Ls;
int i = 0;
while (L_ > 0) {
  int j;
  for ( j = 0; j < 3; j++ ) {
    if (j == 2) {
      mvs.add(1);
    } else {
      mvs.add(L_);
    }
  }
  L_ -= 2;
}

// If Ls odd, last move not necessary
if ((Ls % 2) == 1) {
  mvs.remove(mvs.size()-1);
}

float phi = 0;
d_pts.add(d.clone());
for (i = 0; i < mvs.size(); i++) {
  if ((i % 3) == 2) {
    if (d_i == 0) {
      d[0] += 1;
    } else if (d_i == 1) {
      d[0] -= 1;
      d[1] += 1;
    } else {
      d[1] -= 1;
    }
    d_pts.add(d.clone());
  } else {
    int k;
    k = mvs.get(i);
    while (k-- > 0) {
      if (d_i == 0) {
        d[0] += 1;
      } else if (d_i == 1) {
        d[0] -= 1;
        d[1] += 1;
      } else {
        d[1] -= 1;
      }
      d_pts.add(d.clone());
    }
    d_i = (d_i + 1) % 3;
  }
}

println(d_pts.size());

float[] pts_0 = new float[3];
for (i = 0; i < (d_pts.size()); i++) {
  Integer[] d_0;
  d_0 = d_pts.get(i);
  int k;
  float[] v1 = {-1,1,0};
  float[] v2 = {-1,0,1};
  float[] q = {2,0,-1};
  float s1 = ((float)d_0[0]/Ls);
  float s2 = ((float)d_0[1]/Ls);
  for (k = 0; k < 3; k++) {
    pts_0[k] = s1 * v1[k] + s2 * v2[k] + q[k];
  }
  output.println(pts_0[0] + " " + pts_0[1] + " " + pts_0[2]);
}

output.flush();
output.close();

//println(d_pts.size());
//for (i = 0; i < d_pts.size(); i++) {
//  Integer[] d_0;
//  d_0 = d_pts.get(i);
//  println(d_0[0],d_0[1]);
//}
//camera(10,10,10,0,0,0,0,0,0);