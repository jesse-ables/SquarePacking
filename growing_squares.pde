ArrayList<Square> squares;

//size that squares start off at
float initial_size = 1;

//distance that a square can spawn and/or grow from another square
float distance = 1;

//boolean used to know when packing is complete
boolean not_finished = true;

void setup(){
  squares = new ArrayList<Square>();
  size(600, 400);
  background(0);
}

void draw(){
  
  //attempt to create 10 squares per frame
  if(not_finished){
    for(int i = 0; i < 10; i++){
      not_finished = newSquare();
    }
  }
  
  
  //update each square
  for(Square s : squares){
    packSquares(s);
    s.grow();
    s.show();
  }
  
  //stop draw loop when no space is available
  if(!not_finished){
     print("Done");
     noLoop();
  }
}

//checks for a valid location, and creates a square
boolean newSquare(){
  
  boolean space_available = false;
  int acc = 0;
  
  while(!space_available){
    float x = random(width);
    float y = random(height);
    
    boolean check = true;
    
    //check to make sure that a new square isn't created in an already existing square
    for(Square s : squares){
      
      if((abs(x - s.xpos) * 2 - distance <= (initial_size + s.size)) && (abs(y - s.ypos) * 2 - distance <= (initial_size + s.size))){
         check = false; 
         
      }
    }
    
    //if the previous loop finishes without changing check, create a new square
    if(check == true){
      squares.add(new Square(x, y, initial_size));
      space_available = true;
    }
    
    acc++;
    
    //return false if a space isn't found after 1000 attempts
    if(acc == 1000){
       return space_available;
    }
    
  }
   //<>// //<>//
  return space_available;
}

//collision detection to tell a square to stop growing
void packSquares(Square square){
  
  for(Square s : squares){
    //make sure we are not comparing the same square
    if(square.xpos == s.xpos && square.ypos == s.ypos){
      continue; 
    }
    
    //collision detection for two squares
    if((abs(square.xpos - s.xpos) * 2 - distance <= (square.size + s.size)) && (abs(square.ypos - s.ypos) * 2 - distance <= (square.size + s.size))){
       square.growing = false; 
    }
  }
  
}
