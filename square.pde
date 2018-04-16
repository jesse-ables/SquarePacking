class Square{
  color c;
  float size;
  float xpos;
  float ypos;
  boolean growing;
  
  
  //constructor
  Square(float xpos_, float ypos_, float size_){

    float c1 = random(255); //random red value
    float c2 = random(255); //random green value
    float c3 = random(255); //random blue value
    
    growing = true;
    
    //color of the square
    c = color(c1, c2, c3);
    
    //height and length of square
    size = size_;
    
    //location of the center of the square
    xpos = xpos_;
    ypos = ypos_;
    
  }
  
  //makes the square grow by a certain amount
  void grow(){
    //make sure the square doesn't go off screen
    if(xpos + (size/2) > width || xpos - (size/2) < 0 || ypos + (size/2) > height || ypos - (size/2) < 0){
       growing = false; 
    }
    
    //grow square by 1
    if(growing){
      size += 1; 
    }
  }
  
  //draws the square
  void show(){
   rectMode(CENTER);
   strokeWeight(1);
   stroke(c);
   fill(0);
   rect(xpos, ypos, size, size);
  }
}
