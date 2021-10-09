import controlP5.*;

int iteration = 0;
String result = "";
String input;
long valinput;
PrintWriter output;
Textarea Textarea;

ControlP5 cp5;
PFont font;

void setup() {
  surface.setTitle("3n + 1 task");
  size(300, 150);
  cp5 = new ControlP5(this);
  font = createFont("arial", 15);
  //cp5 = new ControlP5(this);
  cp5.addTextfield("val").setCaptionLabel("value").setSize(width - 20, 16).setPosition(10, 5).setFont(font).setAutoClear(true);
  cp5.addButton("savefile").setPosition(220, 25).setCaptionLabel("save...").setSize(70, 20).setFont(font);
  Textarea = cp5.addTextarea("values").setPosition(10,50).setSize(width - 20, height - 60).setFont(font).setLineHeight(14).setColor(color(0)).setColorBackground(color(255)).setColorForeground(color(255,100));
}

void draw() {
  clear();
  background(200);
}

void keyPressed() {
  if(key == ENTER) {
    result = "";
    iteration = 0;
    input = cp5.get(Textfield.class,"val").getText();
    valinput = int(input);
    println("Input value: " + input);
    println("Inner input value: " + valinput);
    if (!(valinput < 1)) {
      println("Status: " + valinput + " Good value");
      task(valinput);
    } else {
      println("Status: " + valinput + " Bad value (value less than 1 or not a number)");
    }
  }
}

void task(long value) {
  println("Input number: " + value);
  long fv = value;
  while(value > 1) {
    if (value % 2 == 0) {
      value = value / 2;
    } else {
      value = value * 3 + 1;
      }
    println(value);
    iteration = iteration + 1;
    if (value > 1) {
      result = result + value + ", ";
    } else {
      result = result + value;
    }
  }
  println("Iterations: " + iteration);
  Textarea.setText("Input number: " + fv + "\r \n" + result + "\r \n Iterations: " + iteration);
}

/*
void savefile() {
  output = createWriter("output.txt"); 
  output.println(cp5.get(Textarea.class,"values").getText());
  output.flush();  //  записываем оставшиеся данные в файл
  output.close();
}
*/
