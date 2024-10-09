void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
}

void dash() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(300);
  digitalWrite(LED_BUILTIN, LOW);
  delay(100);
}

void dot() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(100);
  digitalWrite(LED_BUILTIN, LOW);
  delay(100);
}

void space() {
  digitalWrite(LED_BUILTIN, LOW);
  delay(500);
}

void loop() {
  // A
  dot();
  dash();
  space();
  // R
  dot();
  dash();
  dot();
  space();
  // D
  dash();
  dot();
  dot();
  space();
  // U
  dot();
  dot();
  dash();
  space();
  // I
  dot();
  dot();
  space();
  // N
  dash();
  dot();
  space();
  // O
  dash();
  dash();
  dash();
  space();
  space();
}