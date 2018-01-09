
//Initializes a new CA Variable named ca
CA ca;

void setup(){
  
  size(1600,900);
  background(220);
  
  //Calls the Constructor to instantiate a new CA
  ca = new CA();
  
}

void draw(){
  
//Onscreen Stats 
  fill(255);
  textSize(22);
  text("Wolfram Cellular Automata ", 30, 60);
  textSize(18);
  text("Ruleset:  " + ca.ruleset[0] + ca.ruleset[1] + ca.ruleset[2] + ca.ruleset[3] + ca.ruleset[4] + ca.ruleset[5] + ca.ruleset[6] + ca.ruleset[7]  , 30, 80);
  
  ca.display();
  
  if (ca.generations < height/ca.cellSize) {
    ca.calculateCells(); 
  }
  else{
    ca = new CA();
  }
  
  ca.display();


}