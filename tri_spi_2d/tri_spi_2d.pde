// Print out the points that draw a spiral on an equilateral triangle made of
// smaller equilateral triangles.
// Useful if you want to navigate a triangle with a single parameter.
size(400,400);

int Ls = 10; // Length of side of triangle.
ArrayList<Integer> mvs = new ArrayList<Integer>();
float x = 0;
float y = 0;
float h = 30.;

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

ArrayList<Float> x_pts = new ArrayList<Float>();
ArrayList<Float> y_pts = new ArrayList<Float>();
float phi = 0;
x_pts.add(x);
y_pts.add(y);
for (i = 0; i < mvs.size(); i++) {
  if ((i % 3) == 2) {
    x += h * cos(phi);
    y += h * sin(phi);
    x_pts.add(x);
    y_pts.add(y);
  } else {
    int j;
    j = mvs.get(i);
    while (j-- > 0) {
      x += h * cos(phi);
      y += h * sin(phi);
      x_pts.add(x);
      y_pts.add(y);
    }
    phi += PI*2./3. % (2.*PI);
  }
}

float x0, y0, x1, y1;
for (i = 0; i < (x_pts.size() - 1); i++) {
  x0 = x_pts.get(i);
  x1 = x_pts.get(i+1);
  y0 = y_pts.get(i);
  y1 = y_pts.get(i+1);
  line(x0,y0,x1,y1);
}

print(x_pts.size());