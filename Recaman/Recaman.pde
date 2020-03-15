import java.util.HashSet; 
import java.util.Set; 

Set<Integer> visited = new HashSet<Integer>(); 
int current = 0; 
int counter = 1; 
int MAX = 1000; 

void setup() {
  size(1000, 1000); 
  background(0); 
  visited.add(0); 
}

void Recaman() {
    int new_num = current - counter; 
    
    if (new_num < 0 || visited.contains(new_num)) {
      new_num = current + counter; 
    }      
    
    int diameter = abs(current - new_num); 
    int middle = diameter / 2; 
    
    float start = PI; 
    float end = TWO_PI; 
    
    if (new_num < current) {
      start = 0; 
      end = PI; 
    }
    
    arc(middle, height/2, diameter, diameter, start, end); 
    
    visited.add(new_num); 
    current = new_num; 
    counter += 1; 
}

void draw() {   
  stroke(255); 
  noFill(); 
  
  if (counter > MAX) {
    noLoop();
  }
  Recaman(); 
}
