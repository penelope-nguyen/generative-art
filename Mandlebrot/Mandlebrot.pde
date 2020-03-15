int MAX_ITER = 50; 

class Complex {
  float x; 
  float y; 
  
  Complex(float x, float y) {
    this.x = x; 
    this.y = y; 
  }
}

int mandlebrot(Complex c) {
  
  // formula zn = (z0)^2 + c 
  // suppose c is in form (x + yi) 
  // then z1 = 0 + (x + yi)^2 
  // (x + yi) ^ 2 = x^2 + 2xyi + yi^2 
  // simplifies to x^ 2 + 2xyi -y^2 
  // next round 
  Complex z = new Complex(0, 0); 
  int stop = 0; 
  
  for (stop = 0; stop < MAX_ITER; stop++) {
    
    float new_real = (z.x * z.x) - (z.y * z.y) + c.x; 
    float new_imag = 2 * z.x * z.y + c.y; 
    
    z.x = new_real; 
    z.y = new_imag; 
    
    if (abs(z.x + z.y) > 2) {
      break; 
    }
   }
   
   return stop; 

}

void setup() {
  colorMode(HSB, 80, 255, 100); 
  size(500, 500); 
  background(255); 
}

void draw() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      float a = map(x, 0, width, -2, 2); 
      float b = map(y, 0, height, -2, 2);  
      
      Complex c = new Complex(a, b); 
      stroke(50, 100, mandlebrot(c)); 
      point(x, y); 
    }
  }
}
