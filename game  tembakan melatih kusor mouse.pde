int Score = 0;  //memasukan untuk menampilkan score
PFont fontA;  //menampilkan PFont
   int sphereDiameter = 10; //mendeklarasikan values 10
   boolean shoot = false;  // mendeklarasikan boolean
   
   
int randx()  //isi int randx yang isisnya random
  {
    return int(random(600));
  }
  
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  
  int[] sphereYCoords = { 0, 0, 0, 0, 0 };
  
  
  void setup()
  {
    size(600,620);
  }
  
  void draw()
  {
    
    background(0);
    fill(225);
    textSize(20);
    text("Score : "+Score, 15, 30); 
    fill(color(5,600,5));
  
  
    stroke(color(5,255,5));
    
    
    triangle(mouseX-8, 580, mouseX+8, 580,mouseX, 565);
    fill(color(255,5,5));
    
    stroke(color(255,5,5));
    
    if(shoot==true)
    {
      
      
      spherekiller(mouseX);
      shoot = false;
    }
    
    sphereDropper();
    gameEnder();
  }
  
  void mousePressed()
  {
   
    shoot = true;
  }
  
  void sphereDropper()
  {
     
    stroke(255);
    fill(255);
    for (int i=0; i<5; i++)
    {
      ellipse(sphereXCoords[i], sphereYCoords[i]++,
              sphereDiameter, sphereDiameter);
    }
  }
  
  void spherekiller(int shotX)
  {
  
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (sphereXCoords[i]-sphereDiameter/2)) &&
         (shotX <= (sphereXCoords[i]+sphereDiameter/2)))
      {
          Score = Score + 1;
        hit = true;
        line(mouseX, 565, mouseX, sphereYCoords[i]);
        ellipse(sphereXCoords[i], sphereYCoords[i],
                sphereDiameter+25, sphereDiameter+25);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;
      }
    }
    
    if(hit == false)
    {
      line(mouseX, 565, mouseX, 0);
    }
    
  }
  
  void gameEnder()
  {
    for (int i=0; i< 5; i++)
    {
      if(sphereYCoords[i]==600)
      {
        fill(color(255,0,0));
        noLoop();
      }
    }
  }
  
  
    
