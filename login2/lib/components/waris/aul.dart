List<dynamic> aulsaja(Map<String, String> pecahan) {
  // Map dengan nilai sebagai string pecahan

  // Fungsi untuk mencari KPK dari daftar penyebut
  int kpkList(List<int> numbers) {
    int kpk(int a, int b) {
      int tempA = a, tempB = b;
      while (tempA != tempB) {
        if (tempA < tempB) {
          tempA += a;
        } else {
          tempB += b;
        }
      }
      return tempA;
    }

    return numbers.reduce((value, element) => kpk(value, element));
  }

  // Hitung KPK dari penyebut
  List<int> penyebut =
      pecahan.values.map((e) => int.parse(e.split('/')[1])).toList();
  int kpk = kpkList(penyebut);
  List<int> pembilangOri = [];

  // Hitung hasil perkalian dan jumlahkan
  int total = 0;
  for (var value in pecahan.values) {
    List<String> pecahanList = value.split('/');
    int pembilang = int.parse(pecahanList[0]);
    int penyebut = int.parse(pecahanList[1]);
    int hasilPerkalian = (kpk ~/ penyebut) * pembilang;
    pembilangOri.add(hasilPerkalian);
    total += hasilPerkalian;
  }
  // print(pembilangOri);

  // Cek apakah total lebih besar dari penyebut terbaru
  if (total > kpk) {
    kpk = total;
  }

  // Ubah pecahan menjadi (hasil perkalian)/(penyebut terbaru)
  Map<String, String> pecahanBaru = {};
  int index = 0;
  for (var entry in pecahan.entries) {
    String pecahanTerbaru = pembilangOri[index].toString();
    pecahanBaru[entry.key] = '$pecahanTerbaru/$kpk';
    index++;
  }

  // Tampilkan hasil
  // print("Pecahan Baru:");
  // pecahanBaru.forEach((key, value) {
  //   print('$key: $value');
  // });
  return [pecahanBaru];
}

// Fungsi untuk mencari kpk dari dua bilangan
int kpk(int a, int b) {
  return (a * b) ~/ fpb(a, b);
}

// Fungsi untuk mencari fpb dari dua bilangan
int fpb(int a, int b) {
  while (b != 0) {
    var t = b;
    b = a % b;
    a = t;
  }
  return a;
}
