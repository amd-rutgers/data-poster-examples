PShape maleGerm;
PShape femaleGerm;

void setup() {
 size(1000, 1000);
 background(255);
 
 maleGerm = loadShape("male.svg");
 femaleGerm = loadShape("female.svg");
 
 // counters
 int male = 0;
 int female = 0;
 
 // import table data
 Table data = loadTable("influenza.csv", "header");

  
 for(TableRow row : data.rows()) {
    // get the value
    String sex = trim(row.getString("Sex"));
    
    // check if it's female
    if (sex.equals("F")) {
      female = female + 1; 
    
    // check if it's male
    } else if (sex.equals("M")) {
      male = male + 1; 
    }
  }

  // drawing a shape for each male
  for(int i = 0; i < male; i++) {
   shape(maleGerm, random(width), random(height), 50, 50);  // Draw at coordinate (110, 90) at size 100 x 100  
  }
  
  for(int i = 0; i < female; i++) {
   shape(femaleGerm, random(width), random(height), 50, 50);  // Draw at coordinate (110, 90) at size 100 x 100  
  }
}