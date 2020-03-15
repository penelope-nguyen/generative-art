
public class Drop {
  
  PVector location; 
  
  Drop() {
    location= new PVector(random(width), random(height)); 
  }
  
  void fall() {
    location.add(0, 5); 
  }
  
  void show() {
    strokeWeight(2);
    stroke(170, 240, 209);
    line(location.x, location.y, location.x, location.y + random(5, 15)); 
    stroke(0);
    line(location.x, location.y, location.x, location.y - random(5, 151)); 
  }
}

Drop [] drops;
void setup() {
  size(500,500);
  background(0); 
   drops = new Drop[100]; 
   for (int i = 0; i < 100; i++) {
     drops[i] = new Drop(); 
   }
}

void draw() {
  for (int i = 0; i < 100; i++) {
    drops[i].fall();
    drops[i].show(); 
    if (drops[i].location.y > height) {
      drops[i].location = new PVector(random(width), 0.0);
    }
  }
}
