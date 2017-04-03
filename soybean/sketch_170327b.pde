import processing.pdf.*;

Table data;

void setup() {
  size(1000, 500, PDF, "soybean.pdf");
  background(255);
  
  
  data = loadTable("crops.csv", "header");
  
  int numRows = data.getRowCount();
  float w = width / numRows;
  
  // create array for values
  int[] values = new int[numRows];
  int i = 0;
  
  // looping through table rows
  for (TableRow row : data.rows()) {
    values[i] = row.getInt("Value");
    i++;
  }
  
  float minimum = min(values);
  float maximum = max(values);
  
  println(minimum+", "+maximum);
  
  for (TableRow row : data.rows()) {
    int year = row.getInt("Year");
    int value = row.getInt("Value");
    float radius = map(value, minimum, maximum, 0, w);
    
    noStroke();
    fill(0, 255, 0);
    ellipse(0, height/2, radius, radius);  
    translate(w, 0);
  }  
  
  exit();
}