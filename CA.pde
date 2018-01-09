class CA {
  
  //Arrays for the Cells
  int[] thisGen;
  int[] nextGen;
  
  //Total Numbe rof Generations
  int generations;
  
  //Cellsize to Display
  int cellSize = 2;
  
  //The Rulesets of the Wolfram CA
  //Not all, but selected nice ones
  
  //int ruleset[] = {0, 1, 0, 1, 1, 0, 1, 0};
  //int ruleset[] = {0, 1, 1, 1, 1, 1, 1, 0};
  
  //RandomRule
  int ruleset[] = {(int)random(0,2),(int)random(0,2),(int)random(0,2),(int)random(0,2),(int)random(0,2),(int)random(0,2),(int)random(0,2),(int)random(0,2),};
  
 
  CA(){
    
    //Initializes the Array with the Window Length divided by the Cellsize
    //This way the Cells (the Array) scales WITH the window, if resized
    thisGen = new int[width/cellSize];
    
    for (int i = 0; i < thisGen.length; i++){    
      thisGen[i] = 0; 
      
      //thisGen[i] = (int)random(0,2); 

    }
      thisGen[thisGen.length/2] = 1;
      generations = 0;
  
  }

  //Calculates a new Generation
  void calculateCells(){
    
    int[] nextGen = new int[thisGen.length];
    
    for(int i = 1; i < thisGen.length - 1; i++){
      
      int left = thisGen[i -1];
      int middle = thisGen[i];
      int right = thisGen[i + 1];
      
      nextGen[i] = rules (left, middle, right);
    } 
    thisGen = nextGen;
    generations++;
    
  }
  
  int rules( int left, int middle, int right){
    
    if (left == 1 && middle == 1 && right == 1) return ruleset[0];
    if (left == 1 && middle == 1 && right == 0) return ruleset[1];
    if (left == 1 && middle == 0 && right == 1) return ruleset[2];
    if (left == 1 && middle == 0 && right == 0) return ruleset[3];
    if (left == 0 && middle == 1 && right == 1) return ruleset[4];
    if (left == 0 && middle == 1 && right == 0) return ruleset[5];
    if (left == 0 && middle == 0 && right == 1) return ruleset[6];
    if (left == 0 && middle == 0 && right == 0) return ruleset[7];
    return 0;
    
  }
  
  void display(){
    
    for(int i = 0; i < thisGen.length; i++){
      
      noStroke();

      //Determines the color of the cell.
      //White for 1, Black for 0
      if (thisGen[i] == 1) fill(0);
      else fill(200);
      
      //Draws the Cells.
      //Cellsize multiplied by I fills the rows (first Cell @ X axis + 5, second @ X axis + 10 etc)     
      rect(cellSize * i,cellSize * generations,cellSize,cellSize);    
    }
  } 
}