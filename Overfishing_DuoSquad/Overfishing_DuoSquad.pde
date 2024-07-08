// Variabel untuk menyimpan posisi Budi
float budiX, budiY;

// Variabel untuk menyimpan posisi ikan
float fish1X, fish1Y;
float fish2X, fish2Y;
float fish3X, fish3Y;

// Variabel untuk menyimpan posisi kapal dan orang-orang
float ship1X, ship1Y;
float ship2X, ship2Y;
float person1X, person1Y;
float person2X, person2Y;

// Data populasi ikan (contoh data)
int[] fishPopulation = {1000, 800, 600, 400, 200, 100};
int[] predatorPopulation = {500, 400, 300, 200, 100, 50};
int[] fishPopulationIncrease = {1000, 1200, 1400, 1600, 1800, 2000};

// Kecepatan animasi
float fishSpeed = 2.0;
float shipSpeed = 1.5;
float animationSpeed = 1.5;
boolean movingRight = true;

int scene = 0;
int sceneDuration = 20 * 60; // 20 detik dalam frame (1 detik = 60 frame)
int frameCountScene = 0;

void setup() {
  size(800, 600);
  budiX = 100;
  budiY = height - 150;
  
  fish1X = 200;
  fish1Y = height - 100;
  fish2X = 400;
  fish2Y = height - 80;
  fish3X = 600;
  fish3Y = height - 120;
  
  ship1X = -200;
  ship1Y = height / 2 - 50;
  ship2X = -400;
  ship2Y = height / 2 - 100;
}

void draw() {
  frameCountScene++;
  if (frameCountScene > sceneDuration) {
    frameCountScene = 0;
    scene = (scene + 1) % 5;
  }

  switch (scene) {
    case 0:
      drawScene1();
      break;
    case 1:
      drawScene2();
      break;
    case 2:
      drawScene3();
      break;
    case 3:
      drawScene4();
      break;
    case 4:
      drawScene5();
      break;
  }
}

void drawScene1() {
  // Menggambar latar belakang laut yang indah
  background(135, 206, 235); // Langit biru
  drawSeaScene1();
  
  // Menggambar ikan berenang
  drawFish(fish1X, fish1Y, color(255, 0, 0));
  drawFish(fish2X, fish2Y, color(0, 255, 0));
  drawFish(fish3X, fish3Y, color(0, 0, 255));
  
  // Menggerakkan ikan
  moveFish();
  
  // Menggambar karakter utama, Budi
  drawBudi(budiX, budiY);
  
  // Menampilkan narasi
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Hai, namaku Budi. Aku sangat menyukai laut dan segala kehidupan di dalamnya.", width / 2, 50);
}

void drawSeaScene1() {
  noStroke();
  fill(0, 191, 255); // Warna laut
  rect(0, height / 2, width, height / 2);
  
  // Menggambar beberapa awan
  fill(255);
  ellipse(100, 100, 100, 60);
  ellipse(300, 150, 120, 70);
  ellipse(500, 80, 90, 50);
  
  // Menggambar pulau di pojok kiri bawah
  fill(34, 139, 34); // Warna hijau pulau
  ellipse(0, height, 300, 150);
}

void drawFish(float x, float y, color c) {
  fill(c);
  ellipse(x, y, 60, 30); // Badan ikan
  triangle(x - 30, y, x - 50, y - 20, x - 50, y + 20); // Ekor ikan
}

void drawBudi(float x, float y) {
  fill(255, 224, 189); // Warna kulit Budi
  ellipse(x, y - 60, 40, 40); // Kepala Budi
  
  fill(0); // Warna pakaian Budi
  rect(x - 20, y - 40, 40, 80); // Badan Budi
  
  fill(255, 224, 189); // Warna kulit tangan dan kaki Budi
  rect(x - 30, y - 40, 10, 50); // Tangan kiri
  rect(x + 20, y - 40, 10, 50); // Tangan kanan
  rect(x - 20, y + 40, 10, 50); // Kaki kiri
  rect(x + 10, y + 40, 10, 50); // Kaki kanan

  // Menggambar ekspresi muka jahat
  fill(0); // Warna hitam untuk ekspresi
  ellipse(x - 10, y - 70, 5, 5); // Mata kiri
  ellipse(x + 10, y - 70, 5, 5); // Mata kanan
  stroke(0);
  line(x - 15, y - 80, x - 5, y - 70); // Alis kiri
  line(x + 5, y - 70, x + 15, y - 80); // Alis kanan
  noFill();
  arc(x, y - 60, 20, 10, 0, PI); // Senyum jahat
}

void moveFish() {
  // Menggerakkan ikan dari kiri ke kanan
  fish1X += fishSpeed;
  fish2X += fishSpeed;
  fish3X += fishSpeed;
  
  // Jika ikan keluar dari layar, kembalikan ke kiri
  if (fish1X > width) fish1X = -60;
  if (fish2X > width) fish2X = -60;
  if (fish3X > width) fish3X = -60;
}

void drawScene2() {
  // Menggambar latar belakang lebih gelap untuk menunjukkan masalah overfishing
  background(0, 51, 102); // Langit gelap
  drawSeaScene2();
  
  // Menggambar kapal besar dengan orang-orang
  drawShipWithPeople(ship1X, ship1Y);
  drawShipWithPeople(ship2X, ship2Y);
  
  // Menggerakkan kapal
  moveShips();
  
  // Menggambar karakter utama, Budi
  drawBudi(budiX, budiY);
  
  // Menampilkan narasi di atas
  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("Overfishing mengancam ekosistem laut kita.", width / 2, 50);
  text("Kita harus segera bertindak untuk menyelamatkannya.", width / 2, 80);

  // Menggambar tanah di bawah kaki Budi
  drawGroundUnderBudi(budiX, budiY);
}

void drawSeaScene2() {
  noStroke();
  fill(0, 76, 153); // Warna laut lebih gelap
  rect(0, height / 2, width, height / 2);
}

void drawShipWithPeople(float x, float y) {
  fill(139, 69, 19); // Warna perahu
  rect(x, y, 200, 50); // Badan perahu

  // Menggambar orang-orang di atas kapal
  drawPersonOnShip(x + 50, y);
  drawPersonOnShip(x + 150, y);
  
  // Menggambar jaring yang sedang mengambil ikan
  fill(255); // Warna jaring
  triangle(x + 50, y + 50, x + 150, y + 50, x + 100, y + 100); // Jaring kapal
  
  // Menggambar ikan di dalam jaring
  drawFishInNet(x + 75, y + 75);
}

void drawPersonOnShip(float x, float y) {
  fill(255, 224, 189); // Warna kulit
  ellipse(x, y - 30, 20, 20); // Kepala
  
  fill(0); // Warna pakaian
  rect(x - 10, y - 20, 20, 40); // Badan
  
  fill(255, 224, 189); // Warna kulit tangan dan kaki
  rect(x - 15, y - 20, 5, 30); // Tangan kiri
  rect(x + 10, y - 20, 5, 30); // Tangan kanan
  rect(x - 10, y + 20, 5, 30); // Kaki kiri
  rect(x + 5, y + 20, 5, 30); // Kaki kanan

  // Menggambar alat tangkap ikan
  fill(139, 69, 19); // Warna alat tangkap
  rect(x - 5, y + 10, 10, 30); // Alat tangkap
}

void drawFishInNet(float x, float y) {
  fill(255, 0, 0); // Warna ikan
  ellipse(x, y, 30, 15); // Badan ikan
  triangle(x - 15, y, x - 25, y - 10, x - 25, y + 10); // Ekor ikan
}

void moveShips() {
  // Menggerakkan kapal dari kiri ke kanan
  ship1X += shipSpeed;
  ship2X += shipSpeed;
  
  // Jika kapal keluar dari layar, kembalikan ke kiri
  if (ship1X > width) ship1X = -200;
  if (ship2X > width) ship2X = -200;
}

void drawScene3() {
  // Menggambar latar belakang yang menunjukkan predator alami
  background(0, 102, 204); // Langit
  drawSeaScene3();
  
  // Menggambar ikan dan predator alami
  drawFish(fish1X, fish1Y, color(255, 0, 0));
  drawFish(fish2X, fish2Y, color(0, 255, 0));
  drawFish(fish3X, fish3Y, color(0, 0, 255));
  drawPredator(fish1X - 100, fish1Y - 50);
  drawPredator(fish2X - 100, fish2Y - 50);
  drawPredator(fish3X - 100, fish3Y - 50);
  
  // Menggerakkan ikan dan predator
  moveFish();
  
  // Menggambar karakter utama, Budi
  drawBudi(budiX, budiY);
  
  // Menampilkan narasi
  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("Selain overfishing, predator alami juga mempengaruhi populasi ikan.", width / 2, 50);
  text("Namun, keseimbangan alami harus dipertahankan.", width / 2, 80);

  // Menggambar tanah di bawah kaki Budi
  drawGroundUnderBudi(budiX, budiY);
}

void drawSeaScene3() {
  noStroke();
  fill(0, 102, 204); // Warna laut
  rect(0, height / 2, width, height / 2);
}

void drawPredator(float x, float y) {
  fill(128, 128, 128); // Warna predator
  ellipse(x, y, 70, 40); // Badan predator
  triangle(x - 35, y, x - 55, y - 20, x - 55, y + 20); // Ekor predator
  ellipse(x + 20, y - 15, 20, 10); // Sirip atas
  ellipse(x + 20, y + 15, 20, 10); // Sirip bawah
}

void drawScene4() {
  // Menggambar latar belakang yang lebih cerah untuk menunjukkan pemulihan ekosistem
  background(135, 206, 235); // Langit cerah
  drawSeaScene4();
  
  // Menggambar ikan yang lebih banyak dan lebih besar
  drawFish(fish1X, fish1Y, color(255, 0, 0));
  drawFish(fish2X, fish2Y, color(0, 255, 0));
  drawFish(fish3X, fish3Y, color(0, 0, 255));
  drawFish(fish1X + 100, fish1Y + 50, color(255, 255, 0));
  drawFish(fish2X + 100, fish2Y + 50, color(0, 255, 255));
  drawFish(fish3X + 100, fish3Y + 50, color(255, 0, 255));
  
  // Menggerakkan ikan
  moveFish();
  
  // Menggambar karakter utama, Budi
  drawBudi(budiX, budiY);
  
  // Menampilkan narasi
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Dengan usaha konservasi, populasi ikan dapat pulih.", width / 2, 50);
  text("Laut kembali penuh dengan kehidupan.", width / 2, 80);

  // Menggambar tanah di bawah kaki Budi
  drawGroundUnderBudi(budiX, budiY);
}

void drawSeaScene4() {
  noStroke();
  fill(0, 191, 255); // Warna laut cerah
  rect(0, height / 2, width, height / 2);
}

void drawScene5() {
  // Menggambar latar belakang yang menekankan pentingnya konservasi
  background(0, 153, 204); // Langit
  drawSeaScene5();
  
  // Menggambar ikan berenang
  drawFish(fish1X, fish1Y, color(255, 0, 0));
  drawFish(fish2X, fish2Y, color(0, 255, 0));
  drawFish(fish3X, fish3Y, color(0, 0, 255));
  
  // Menggerakkan ikan
  moveFish();
  
  // Menggambar karakter utama, Budi
  drawBudi(budiX, budiY);
  
  // Menampilkan narasi
  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("Mari bersama-sama menjaga kelestarian laut kita.", width / 2, 50);
  text("Budi mengajak kita semua untuk peduli terhadap ekosistem laut.", width / 2, 80);
}

void drawSeaScene5() {
  noStroke();
  fill(0, 102, 204); // Warna laut
  rect(0, height / 2, width, height / 2);
}

void drawGroundUnderBudi(float x, float y) {
  fill(139, 69, 19); // Warna tanah
  rect(x - 50, y + 50, 100, 50); // Tanah di bawah kaki Budi
}
