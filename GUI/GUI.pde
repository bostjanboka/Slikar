PImage source;       // Source mask image
PImage destination;  // Destination image
PImage upload; //image uploaded by user
PImage originalImage;
PImage mask;
PImage empty;

color osnova=color(40);
color [] barva ={
  color(0),
  color(40),
  color(80),
  color(120),
  color(160),
  color(200)

};
int fillColor=0;
float opacity = 0.7;

//spremeljivke za array filtriranih slik
PImage [] filters=new PImage[7];


//velikosti copicev
int big=25;
int middle=15;
int small=5;

int[] sizeF = new int[]{small, middle, big};
int[] filterOrder;

//intenzivnosti uporabljenega filtra - oz stopnja uporabe stila
int low=0;
int mid=1;
int high=2;

//margin za nalaganje slike
int margin=50;
int indexFilter = -1;
int indexSizeF = 1;

//dimenzije nalozene slike
int uploadX;
int uploadY;

String imageLoc2="";
String imageName="";
boolean imageLoaded = false;

//naslovi nalozenih slik
String [] imageLoc=new String[6];

PImage test;
//lokacija osnovne slike;

void setup() {
    size(1000,1000);
  selectInput("Select a file to process:", "fileSelected");
  print("select input called");
}



void draw() {  
  clear();
  background(220);
  if(imageLoaded){
      image(upload,margin,margin);
  }
  //shrani sliko
  fill(200);
  stroke(0,60,0);
  rect(21, 10, 78, 40);
  fill(0);
  text("Open new", 60, 35);
  
  //naloži novo
  fill(200);
  stroke(0,60,0);
  rect(150, 10, 78, 40);
  fill(0);
  text("Save", 190, 35);
  
  //narisi gumbe pri strani
  for(int i=0; i<7; i++){
      int y=height-margin-(i+1)*120;
      if(i == indexFilter){
        fill(0, 0, 255);
        stroke(0,60,0);
        rect(width-150-2, y-2, 114, 114);
      }
      
      fill(200);
      stroke(0,60,0);
      rect(width-150, y, 110, 110);
       if(imageLoaded){
         test=filters[i].copy();
       test.resize(110,110);
       image(test, width-150, y);
       }
  }  
  //gumbi za copice
  for(int i=0; i < 3; i++){
   int x = margin + 70*i;
   if(i == indexSizeF){
     fill(0, 0, 255);
     rect(x-30-2,height-70-2, 64,64);
   }
   fill(250);
   rect(x-30,height-70, 60,60);
   fill(200);
   stroke(0,60,0);
   ellipse(x, height-sizeF[2]-15, sizeF[i]*2, sizeF[i]*2);
  }
  //scroll bar za opacity
  rect(300, height-50, 210, 15);
  rect(300-20, height-50, 15, 15);
  rect(300+210+5, height-50, 15, 15);
  fill(0);
  rect(300+200*opacity, height-50, 10, 15);
  textSize(15);
  textAlign(CENTER);
  text("-",300-20+7, height-50+12);
  text("+",300+210+5+7, height-50+12);
  
  for(int i=0; i < 21; i++){
  int y=height-50;
  int x=300+10*i;
  fill(50,50,50,50);
  rect(x, y, 10, 15);
  }
  //copic za celoten zaslon
  rect(300+210+50,height-70, 60,60);
  fill(250);
  rect(300+210+50+4,height-70+4, 60-8,60-8);
}

//resizes the image from given location on disk 
//max 300x300 px
PImage uploadImage(String location, PImage goal, int alpha){
  goal=loadImage(location);
  if(goal.height<goal.width){
    goal.resize(0,500);  
  }
  else{
    goal.resize(500,0);
  }
  
  uploadX=goal.width;
  uploadY=goal.height;
  
  for (int x = 0; x < goal.width; x++) {
    for (int y = 0; y < goal.height; y++ ) {
      int loc = x + y*goal.width;
      color r = (int)red(goal.pixels[loc]);
      color g = (int)green(goal.pixels[loc]);
      color b = (int)blue(goal.pixels[loc]);
      goal.pixels[loc]  = color(r,g,b,alpha);
    }
  }
  goal.updatePixels();
  return goal.copy();
}


void transferStyle(){
  
  String commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out1/ " + dataPath("")+"/models/nejka/";
  File workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out2/ " + dataPath("")+"/models/rain_princess.ckpt";
  workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out3/ " + dataPath("")+"/models/boka/";
  workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out4/ " + dataPath("")+"/models/udnie.ckpt";
  workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out5/ " + dataPath("")+"/models/wave.ckpt";
  workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  commandToRun = "python skripta.py "+imageLoc2 + " "+dataPath("")+"/out6/ " + dataPath("")+"/models/dali/";
  workingDir = new File(sketchPath("")+"/../"); 
  try {
      Process p = Runtime.getRuntime().exec(commandToRun, null, workingDir);
      int i = p.waitFor();
      if (i == 0) {
      }
      else {
      }
  }
  catch (Exception e) {
    println("Error running command!"); 
    println(e);
  }
  imageLoc[0] = dataPath("")+"\\out1\\"+ imageName;
  imageLoc[1] = dataPath("")+"\\out2\\"+ imageName;
  imageLoc[2] = dataPath("")+"\\out3\\"+ imageName;
  imageLoc[3] = dataPath("")+"\\out4\\"+ imageName;
  imageLoc[4] = dataPath("")+"\\out5\\"+ imageName;
  imageLoc[5] = dataPath("")+"\\out6\\"+ imageName;
  //String icon=dataPath("")+"\\castle_osnova.jpg";

  println("iscm lokacijo fajla");
  println(sketchPath(""));
  println(dataPath(""));
  println("running try cach");
  println("done");
  //zamenjaj filter ozadja
  filters[0]=uploadImage(imageLoc2, filters[0], 255);
  for(int i=1; i<7; i++){
    filters[i]=uploadImage(imageLoc[i-1], filters[i], 1);
    filters[i].resize(filters[0].width, filters[0].height);
  }
  filterOrder = new int[filters.length];
  for(int i=0; i < filterOrder.length; i++){
    filterOrder[i] = i; 
  }
  
  upload = filters[0].copy();
  mask = upload.copy();
  imageLoaded = true;
  
  for(int x=0; x < upload.width; x++){
   for(int y=0; y < upload.height; y++){
      int loc = x + y*mask.width;
      mask.pixels[loc]  = color(0,0,0);
     }
    }
  empty = mask.copy();
}

void PaintImage(){
  if(indexFilter == -1){
   return; 
  }
  int startX = mouseX-margin-sizeF[indexSizeF];
  int startY = mouseY-margin-sizeF[indexSizeF];
  if(startX < 0)
    startX = 0;
  if(startY < 0)
    startY = 0;

  for (int x = startX; x < filters[indexFilter].width && x < mouseX -margin+ sizeF[indexSizeF]; x++) {
      for (int y = startY; y < filters[indexFilter].height-2 && y < mouseY -margin+ sizeF[indexSizeF]; y++ ) {
        PVector rad = new PVector(x - (mouseX-margin), y - (mouseY-margin));
        int loc = x + y*filters[indexFilter].width;
        if(rad.mag() > sizeF[indexSizeF] || red(mask.pixels[loc])==1){
         continue; 
        }
  
        float opac = opacity;
        float iopac = 1- opacity;
        
        color r = (int)(red(filters[indexFilter].pixels[loc])*opac);
        color g = (int)(green(filters[indexFilter].pixels[loc])*opac);
        color b = (int)(blue(filters[indexFilter].pixels[loc])*opac);
        
        color r_ = (int)(red(upload.pixels[loc])*iopac);
        color g_ = (int)(green(upload.pixels[loc])*iopac);
        color b_ = (int)(blue(upload.pixels[loc])*iopac);
        
        mask.pixels[loc] = color(1,0,0);      
        upload.pixels[loc]  = color(r+r_,g+g_,b+b_);
      }
  }
  boolean startMoving=false;
  upload.updatePixels(); 
  for(int i=0; i < filterOrder.length; i++){
    if(filterOrder[i]==indexFilter){
       startMoving = true; 
    }
    else if(startMoving){
       filterOrder[i-1] = filterOrder[i];
    }
  }
  filterOrder[filterOrder.length-1] = indexFilter;
}

void mouseDragged(){
  PaintImage();
}

void mouseClicked() {
  //nove vrednosti
  if(mouseX > 300+210+5 && mouseX < 300+210+5+15 && height-50 > 300 && mouseY < height-50+15){
   if(opacity < 1){
      opacity += 0.05; 
   }
 }
 if(mouseX > 300-20 && mouseX < 300-20+15 && height-50 > 300 && mouseY < height-50+15){
   if(opacity > 0){
      opacity -= 0.05; 
   }
 }
  
 //klik na gumb za celoten zaslon
 rect(300+210+50,height-70, 60,60);
 if(mouseX >300+210+50 && mouseX < 300+210+50+60 && mouseY > height-70 && mouseY < height-70+60){
     for(int x=0; x < upload.width; x++){
       for(int y=0; y < upload.height; y++){
          int loc = x + y*upload.width;
          upload.pixels[loc]  = filters[indexFilter].pixels[loc];
         }
      }
      upload.updatePixels();
   } 
   
   //klik na open new
   if(mouseX > 21 && mouseX < 99 && mouseY > 10 && mouseY < 50){
       selectInput("Select a file to process:", "fileSelected");
   }
   
   //klik na save
   if(mouseX > 150 && mouseX < 230 && mouseY > 10 && mouseY < 50){
       
   }
}

void mousePressed(){
   for(int i=0; i< 7; i++){
     int y=height-margin-(i+1)*120;
     // rect(width-150, y, 110, 110);
      if(mouseX>width-150&&mouseX<width-40&&mouseY<y+110&&mouseY>y){
           fillColor=40*i;
           indexFilter =i;
     }   
  }
  for(int i=0; i < 3; i++){
     int x = margin + 70*i;
     fill(250);
     rect(x-30,height-70, 60,60);

     if(mouseX >x-30 && mouseX < x-30+60 && mouseY > height-70 && mouseY < height-70+60){
       indexSizeF = i;
     }
  }
  //pobarvaj sliko ob kliku z misko
  if(mouseX<uploadX+margin&&mouseX>margin&&mouseY>margin&&mouseY<uploadY+margin){
      fill(fillColor);
      noStroke();
      ellipse(mouseX, mouseY, big,big);
   }
  if(mouseX<60&&mouseX>0&&mouseY>0&&mouseY<50 || true){
      //dobi sliko na ekranu
      source=get(50,50,filters[0].width,filters[0].height);
      destination = createImage(source.width, source.height, RGB);
      println(destination.pixels[15]);
    
      source.loadPixels();
      destination.loadPixels();
    
      mask = empty.copy();
      PaintImage();
      destination.save("slika2");
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    imageLoc2 = selection.getAbsolutePath();
    String[] list = split(selection.getAbsolutePath(), '\\');
    imageName = list[list.length-1];
    print(imageName);
    print("getting selected file");
    transferStyle();
  }
}