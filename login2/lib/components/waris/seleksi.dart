import 'coba.dart';
import '2ash 1ash.dart';
import 'ash.dart';
import 'aul.dart';
import 'radd.dart';

List<dynamic> jumlahnyaAhliWaris(Map<String, int> input) {
  // Membuat Map untuk menyimpan jumlah ahli waris
  Map<String, int> hasil = {};
  // Melakukan iterasi pada input
  // Melakukan iterasi pada pasangan kunci-nilai menggunakan entries
  for (MapEntry<String, int> entry in input.entries) {
    String ahliWaris = entry.key;
    int jumlah = entry.value;
    hasil[ahliWaris] = jumlah;
  }
  // Mengembalikan Map hasil
  Map<String, String> terhalang = {};
  for (var entry in hasil.entries) {
    var awaris1 = entry.key;
    var jumlah = entry.value;
    for (var entry2 in hasil.entries) {
      var key = entry2.key;
      if (awaris1 == key) {
        continue;
      } else if (persyaratanTerpenuhi(input, awaris1, jumlah, key) == false) {
        terhalang[awaris1] = '$awaris1 terhalangi oleh $key';
        break;
      } else if (persyaratanTerpenuhi(input, awaris1, jumlah, key) == true) {
        continue;
      }
      ; // Lakukan sesuatu dengan entry2 jika kunci tidak sama dengan awaris1
    }
  }
  hasil.removeWhere((key, value) => terhalang.containsKey(key));
  return [hasil, terhalang];
}

List<dynamic> pembagianWaris(double totalHarta, double totalHutang,
    double totalWasiat, Map<String, int> input) {
  Map<String, String> hasilBagiWaris = {};
  Map<String, String> jelasanBagiWaris = {};
  Map<String, String> persentaseBagiWaris = {};
  List<dynamic> ahay = [];
  // Mengurangi total harta dengan total hutang
  double totalSisaHarta = totalHarta - totalHutang - totalWasiat;

  // Menampilkan total sisa harta yang akan dibagikan
  print('Total sisa harta yang akan dibagikan: $totalSisaHarta');

  // Memulai perhitungan bagi setiap bagian ahli waris
  print('\nPerhitungan bagi setiap ahli waris:');
  input.forEach((ahliWaris, jumlah) {
    List<dynamic> bagianWaris = [];
    String awe = '0';
    // Proses perhitungan sesuai dengan jenis ahli waris
    if (ahliWaris == 'Suami') {
      bagianWaris = hitungBagianSuami(input, jumlah);
    } else if (ahliWaris == 'Istri') {
      bagianWaris = hitungBagianIstri(input, jumlah);
    } else if (ahliWaris == 'Anak Laki-laki') {
      bagianWaris = hitungBagianAnakLaki(input, jumlah);
    } else if (ahliWaris == 'Bapak') {
      bagianWaris = hitungBagianAyah(input, jumlah);
    } else if (ahliWaris == 'Anak Perempuan') {
      bagianWaris = hitungBagianAnakPerempuan(input, jumlah);
    } else if (ahliWaris == 'Cucu Laki-laki') {
      bagianWaris = hitunganBagianCucuLaki(input, jumlah);
      //
    } else if (ahliWaris == 'Cucu Perempuan dari Anak Laki-laki') {
      bagianWaris = hitungBagianCucuPerempuan(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Ibu') {
      bagianWaris = hitungBagianIbu(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Kakek') {
      bagianWaris = hitungBagianKakek(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Nenek') {
      bagianWaris = hitungBagianNenek(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Saudara Laki-laki Sekandung') {
      bagianWaris = hitungBagianSdraKdg(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Saudari Sekandung') {
      bagianWaris = hitungBagianSdriKdg(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Saudara Laki-laki Sebapak') {
      bagianWaris = hitungBagianSdraPriaSeayah(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Saudari Sebapak') {
      bagianWaris = hitungBagianSdriSeayah(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Saudara Laki-laki Seibu') {
      bagianWaris = hitungBagianSdriSeibu(input, jumlah);
      String bw = bagianWaris[0];
      List<String> parts = bw.split('/');
      int numerator = int.parse(parts[0]);
      int denominator = int.parse(parts[1]);
      awe = '${numerator * jumlah}/$denominator';
      //
    } else if (ahliWaris == 'Saudari Seibu') {
      bagianWaris = hitungBagianSdriSeibu(input, jumlah);
      String bw = bagianWaris[0];
      List<String> parts = bw.split('/');
      int numerator = int.parse(parts[0]);
      int denominator = int.parse(parts[1]);
      awe = '${numerator * jumlah}/$denominator';
      //
    } else if (ahliWaris == 'Anak Laki-laki dari Saudara Laki-laki Sekandung') {
      bagianWaris = hitungBagianKeponakanLakiKandung(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Anak Laki-laki dari Saudara Laki-laki Sebapak') {
      bagianWaris = hitungBagianKeponakanLakiSeayah(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Paman Sekandung') {
      bagianWaris = hitungBagianPamanKdg(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Paman Sebapak') {
      bagianWaris = hitungBagianPamanSeayah(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Anak dari Paman Laki-laki Sekandung') {
      bagianWaris = hitungBagianSepupuKdg(input, jumlah);
      String bw = bagianWaris[0];
      //
    } else if (ahliWaris == 'Anak dari Paman Laki-laki Sebapak') {
      bagianWaris = hitungBagianSepupuSeayah(input, jumlah);
      String bw = bagianWaris[0];
      //
    }
    String bw = bagianWaris[0];
    String dw = bagianWaris[2];
    if ((ahliWaris == 'Saudara Laki-laki Seibu') ||
        (ahliWaris == 'Saudari Seibu')) {
      bw = awe;
      dw = awe;
    } else {
      bw = bagianWaris[0];
      dw = bagianWaris[2];
    }
    String pw = bagianWaris[1];
    hasilBagiWaris[ahliWaris] = bw;
    jelasanBagiWaris[ahliWaris] = pw;
    if (dw != '0') {
      persentaseBagiWaris[ahliWaris] = dw;
    }
    // Lainnya bisa ditambahkan sesuai dengan aturan yang diberikan
    // print('- Bagian untuk $ahliWaris: $bw ($pw)');
  });
  // Menampilkan hasil Map
  print('\nHasil bagi waris 2:');
  print(input);
  print(hasilBagiWaris);
  print(jelasanBagiWaris);
  print(persentaseBagiWaris);

  if (hasilBagiWaris.length == 1) {
    jelasanBagiWaris.forEach((key, value) {
      hasilBagiWaris[key] = '1/1';
    });
  } else if (hasilBagiWaris.containsValue('2ash') &&
      hasilBagiWaris.containsValue('1ash') &&
      hasilBagiWaris.length == 2) {
    hasilBagiWaris['Anak Laki-laki'] = '2/3';
    hasilBagiWaris['Anak Perempuan'] = '1/3';
  }
  double convertFraction(String fraction) {
    List<String> parts = fraction.split('/');
    if (parts.length == 2) {
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      return numerator / denominator;
    } else {
      return 0.0;
    }
  }

  // Fungsi untuk mencari KPK dari dua angka
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

  // Mengumpulkan penyebut dari pecahan yang valid
  List<int> denominators = [];

  hasilBagiWaris.forEach((key, value) {
    List<String> parts = value.split('/');
    if (parts.length == 2) {
      denominators.add(int.parse(parts[1]));
    }
  });

  // Mencari KPK dari semua penyebut
  int commonDenominator =
      denominators.reduce((value, element) => kpk(value, element));

  // Menghitung total pecahan dalam penyebut baru
  double total = 0.0;
  Map<String, double> results = {};
  hasilBagiWaris.forEach((key, value) {
    List<String> parts = value.split('/');
    if (parts.length == 2) {
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      double fractionValue = (numerator / denominator) * commonDenominator;
      results[key] = fractionValue;
      total += fractionValue;
    }
  });
  print('Total pembilang = $total');
  print('penyebutnya $commonDenominator');
  if (hasilBagiWaris.length == 1) {
    jelasanBagiWaris.forEach((key, value) {
      hasilBagiWaris[key] = '1/1';
    });
  } else if (hasilBagiWaris.containsValue('ash')) {
    ahay = ashaja(hasilBagiWaris);
    hasilBagiWaris = ahay[0];
  } else if (hasilBagiWaris.containsValue('2ash') &&
      hasilBagiWaris.containsValue('1ash')) {
    ahay = duaash1ash(hasilBagiWaris);
    hasilBagiWaris = ahay[0];
  } else if (total > commonDenominator) {
    ahay = aulsaja(hasilBagiWaris);
    hasilBagiWaris = ahay[0];
  } else if (total < commonDenominator) {
    ahay = raddsaja(hasilBagiWaris, persentaseBagiWaris);
    hasilBagiWaris = ahay[0];
  } else {
    ahay = aulsaja(hasilBagiWaris);
    hasilBagiWaris = ahay[0];
  }

  print('Ini adalah hasil akhir $hasilBagiWaris');
  Map<String, double> bagianAkhir = {};
  hasilBagiWaris.forEach((key, value) {
    List<String> parts = value.split('/');
    if (parts.length == 2) {
      List<String> parts = value.split('/');
      if (parts.length == 2) {
        double numerator = double.parse(parts[0]);
        double denominator = double.parse(parts[1]);
        double fractionValue = ((numerator * totalSisaHarta) / denominator);
        bagianAkhir[key] = fractionValue;
      }
    }
  });
  print(bagianAkhir);

  return [hasilBagiWaris, bagianAkhir, jelasanBagiWaris];
}

// Fungsi untuk memeriksa persyaratan tambahan
bool persyaratanTerpenuhi(Map input, String ahliWaris, int jumlah, String key) {
  // Persyaratan 1: Cucu Laki-laki
  if (ahliWaris == 'Cucu Laki-laki' && (key == ('Anak Laki-laki'))) {
    return false;
  }
  // Persyaratan 2: Saudara Laki-laki Sekandung
  if (ahliWaris == 'Saudara Laki-laki Sekandung' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek'))) {
    return false;
  }
  // Persyaratan 3: Saudara Laki-laki Sebapak
  if (ahliWaris == 'Saudara Laki-laki Sebapak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung'))) {
    return false;
  }
  // Persyaratan 4: Saudara Laki-laki Seibu
  if (ahliWaris == 'Saudara Laki-laki Seibu' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Anak Perempuan') ||
          key == ('Cucu Perempuan dari Anak Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek'))) {
    return false;
  }
  // Persyaratan 5: Anak Laki-laki dari Saudara Laki Sekandung
  if (ahliWaris == 'Anak Laki-laki dari Saudara Laki-laki Sekandung' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak'))) {
    return false;
  }
  // Persyaratan 6: Anak Laki-laki dari Saudara Laki Sebapak
  if (ahliWaris == 'Anak Laki-laki dari Saudara Laki-laki Sebapak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung'))) {
    return false;
  }
  // Persyaratan 7: Paman Sekandung
  if (ahliWaris == 'Paman Sekandung' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sebapak'))) {
    return false;
  }
  // Persyaratan 8: Paman Sebapak
  if (ahliWaris == 'Paman Sebapak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          key == ('Paman Sekandung'))) {
    return false;
  }
  // Persyaratan 9: Anak dari Paman Laki-laki Sekandung
  if (ahliWaris == 'Anak dari Paman Laki-laki Sekandung' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          key == ('Paman Sekandung') ||
          key == ('Paman Sebapak'))) {
    return false;
  }
  // Persyaratan 10: Anak dari Paman Laki-laki Sebapak
  if (ahliWaris == 'Anak dari Paman Laki-laki Sebapak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          key == ('Paman Sekandung') ||
          key == ('Paman Sebapak') ||
          key == ('Anak dari Paman Laki-laki Sekandung'))) {
    return false;
  }
  // Persyaratan 11: Laki-laki yang Memerdekakan Budak
  if (ahliWaris == 'Laki-laki yang Memerdekakan Budak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          key == ('Saudara Laki-laki Sebapak') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          key == ('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          key == ('Paman Sekandung') ||
          key == ('Paman Sebapak') ||
          key == ('Anak dari Paman Laki-laki Sekandung') ||
          key == ('Anak dari Paman Laki-laki Sebapak'))) {
    return false;
  }
  // Persyaratan 12: Kakek
  if ((ahliWaris == 'Kakek') && key == ('Bapak')) {
    return false;
  }
  //'Nenek dari Ibu','Nenek dari Bapak',
  // Persyaratan 13: Nenek atau Ibunya Ibu
  if ((ahliWaris == 'Nenek') && (key == ('Ibu') || key == ('Bapak'))) {
    return false;
  }
  // Persyaratan 14: Cucu Perempuan dari Anak Laki-laki
  if (ahliWaris == 'Cucu Perempuan dari Anak Laki-laki' &&
      (key == ('Anak Laki-laki') ||
          (key == ('Anak Perempuan') && input["Anak Perempuan"] > 1))) {
    return false;
  }
  // Persyaratan 17: Saudari Sekandung
  if (ahliWaris == 'Saudari Sekandung' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek'))) {
    return false;
  }
  // Persyaratan 18: Saudari Sebapak
  if (ahliWaris == 'Saudari Sebapak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung') ||
          (key == ('Saudari Sekandung') && input['Saudari Sekandung'] > 1))) {
    return false;
  }
  // Persyaratan 19: Saudari Seibu
  if (ahliWaris == 'Saudari Seibu' &&
      (key == ('Anak Perempuan') ||
          key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Cucu Perempuan dari Anak Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek'))) {
    return false;
  }
  // Persyaratan 20: Wanita yang Memerdekakan Budak
  if (ahliWaris == 'Wanita yang Memerdekakan Budak' &&
      (key == ('Anak Laki-laki') ||
          key == ('Cucu Laki-laki') ||
          key == ('Anak Perempuan') ||
          key == ('Cucu Perempuan dari Anak Laki-laki') ||
          key == ('Bapak') ||
          key == ('Kakek') ||
          key == ('Saudara Laki-laki Sekandung'))) {
    return false;
  }

  return true;
}

int hitungJamak(Map input) {
  List<String> keys = [
    'Saudara Laki-laki Sekandung',
    'Saudara Laki-laki Sebapak',
    'Saudara Laki-laki Seibu',
    'Saudari Sekandung',
    'Saudari Sebapak',
    'Saudari Seibu'
  ];
  int count = 0;

  // Mengecek apakah setiap kunci dalam list ada dalam Map
  for (String key in keys) {
    if (input.containsKey(key)) {
      int? value = input[key];
      if (value != null) {
        if (value > 1) {
          count++;
        }
        count++; // increment count for the existence of the key
      }
    }
  }
  return count;
}

int hitungJamakRaddSeayah(Map input) {
  List<String> keys = [
    'Anak Laki-laki dari Saudara Laki-laki Sekandung',
    'Anak Laki-laki dari Saudara Laki-laki Sebapak',
    'Paman Sekandung',
    'Paman Sebapak',
    'Anak dari Paman Laki-laki Sekandung',
    'Anak dari Paman Laki-laki Sebapak'
  ];
  int count = 0;

  // Mengecek apakah setiap kunci dalam list ada dalam Map
  for (String key in keys) {
    if (input.containsKey(key)) {
      count++;
    }
  }
  return count;
}

int hitungJamakSeibu(Map input) {
  List<String> keys = ['Saudara Laki-laki Seibu', 'Saudari Seibu'];
  int count = 0;

  // Mengecek apakah setiap kunci dalam list ada dalam Map
  for (String key in keys) {
    if (input.containsKey(key)) {
      count++;
    }
  }
  return count;
}

List<dynamic> hitungBagianSuami(Map input, int jumlah) {
  String bagianSuami = '';
  String punyaSuami = 'Tidak ada';
  String pecahanSuami = '';
  // Cek apakah ada furu' (keturunan)
  if (input.containsKey('Anak Laki-laki') ||
      input.containsKey('Cucu Laki-laki') ||
      input.containsKey('Anak Perempuan') ||
      input.containsKey('Cucu Perempuan dari Anak Laki-laki')) {
    bagianSuami = '1/4'; // Bagian suami adalah 1/4 dari keseluruhan warisan
    punyaSuami =
        'Bagiannya 1/4, dikarenakan ada keturunan yang ditinggalkan oleh mayit';
    pecahanSuami = '0';
  } else if (input.length > 1) {
    bagianSuami = '1/2'; // Bagian suami adalah 1/2 dari keseluruhan warisan
    punyaSuami =
        'Bagiannya 1/2, dikarenakan tidak ada keturunan yang ditinggalkan oleh mayit dan Suami bukanlah ahli waris tunggal';
    pecahanSuami = '0';
  } else {
    bagianSuami =
        '1'; // Suami mendapatkan seluruh warisan jika tidak ada ahli waris lainnya
    punyaSuami = 'Bagiannya keseluruhan, dikarenakan ahli waris tunggal';
    pecahanSuami = '0';
  }
  return [bagianSuami, punyaSuami, pecahanSuami];
}

List<dynamic> hitungBagianIstri(Map input, int jumlah) {
  String bagianIstri = '';
  String punyaIstri = 'Tidak ada';
  String pecahanIstri = '';
  // Cek apakah ada furu' (keturunan)
  if (input.containsKey('Anak Laki-laki') ||
      input.containsKey('Cucu Laki-laki') ||
      input.containsKey('Anak Perempuan') ||
      input.containsKey('Cucu Perempuan dari Anak Laki-laki')) {
    bagianIstri = '1/8';
    punyaIstri =
        'Bagiannya 1/8, dikarenakan ada keturunan yang ditinggalkan oleh mayit'; // Bagian istri adalah 1/8 dari keseluruhan warisan
    pecahanIstri = '0';
  } else if (input.length > 1) {
    bagianIstri = '1/4'; // Bagian istri dibagi rata jika tidak ada furu'
    punyaIstri =
        'Bagiannya 1/4, dikarenakan tidak ada keturunan yang ditinggalkan oleh mayit dan Istri bukanlah ahli waris tunggal';
    pecahanIstri = '0';
  } else {
    bagianIstri = '1';
    punyaIstri = 'Bagiannya Keseluruhan, dikarenakan ahli waris tunggal';
    pecahanIstri = '0';
  }
  return [bagianIstri, punyaIstri, pecahanIstri];
}

List<dynamic> hitungBagianAnakLaki(Map input, int jumlah) {
  String bagianAnakLaki = '0';
  String punyaAnakLaki = 'Tidak ada';
  String pecahanAnakLaki = '0';
  if (input.containsKey('Anak Laki-laki')) {
    // Jika ada anak laki-laki dan tidak ada anak perempuan
    if (!input.containsKey('Anak Perempuan')) {
      bagianAnakLaki =
          'ash'; // Bagian anak laki-laki adalah seluruh sisa warisan
      punyaAnakLaki =
          'Sisa harta warisan, karena tidak bersama saudara perempuannya (Anak Perempuan Mayit)';
      pecahanAnakLaki = '0';
    } else {
      // Jika ada anak laki-laki dan anak perempuan
      bagianAnakLaki =
          '2ash'; // Bagian anak laki-laki adalah 2/3 dari sisa warisan
      punyaAnakLaki =
          '2 kalinya anak perempuan dari Sisa harta warisan, dikarenakan anak laki laki meng-ashabah-kan (membuat orang lain mendapatkan sisa harta warisan) saudara perempuannya (anak perempuan mayit)';
      pecahanAnakLaki = '0';
    }
  } else {
    // Jika tidak ada anak laki-laki
    bagianAnakLaki = '0';
    pecahanAnakLaki = '0';
  }
  return [bagianAnakLaki, punyaAnakLaki, pecahanAnakLaki];
}

List<dynamic> hitungBagianAyah(Map input, int jumlah) {
  String bagianAyah = '0';
  String punyaAyah = 'Tidak ada';
  String pecahanAyah = '0';
  if (((input.containsKey('Suami') || input.containsKey('Istri')) &&
      input.containsKey('Bapak') &&
      input.containsKey('Ibu') &&
      input.length == 3)) {
    bagianAyah = '2ash';
    punyaAyah =
        'Kasus Garawiyatan mengikuti Umar, Uthman, Zayd bin Thabit, dan Ibnu Masud. mendapatkan dua kalinya bagian Ibu (Istri dari Suami) dari sisa harta warisan (setelah dikurangi Suami atau Istri), dikarenakan tidak ada keturunan dan tidak ada jamak dari saudara';
    pecahanAyah = '0';
  } else if (!input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Perempuan') &&
      !input.containsKey('Cucu Perempuan dari Anak Laki-laki')) {
    // Jika tidak ada furu' (keturunan)
    bagianAyah = 'ash'; // Bagian ayah adalah sisa dari keseluruhan warisan
    punyaAyah =
        'Sisa Keseluruhan harta warisan, dikarenakan mayit tidak meninggalkan keturunan (anak laki laki, anak perempuan dan cucu laki laki maupun perempuan dari jalur anak laki laki)';
    pecahanAyah = '0';
  } else if ((input.containsKey('Anak Perempuan') ||
          input.containsKey('Cucu Perempuan dari Anak Laki-laki')) &&
      (!input.containsKey('Anak Laki-laki') ||
          !input.containsKey('Cucu Laki-laki'))) {
    // Jika ada anak perempuan dan tidak ada anak laki-laki
    bagianAyah =
        '1/6'; // Bagian ayah adalah 1/6 ditambah sisa warisan (JANGAN LUPA PERBANDINGAN + SISA)
    punyaAyah =
        'bagiannya 1/6 keseluruhan harta warisan, ditambah seluruh sisa harta warisan. dikarenakan hanya ada keturunan perempuan tanpa keturunan laki laki ';
    pecahanAyah = '1/6';
  } else {
    bagianAyah = '1/6'; // Bagian ayah adalah 1/6 dari keseluruhan warisan
    punyaAyah =
        '1/6 harta warisan, karena terdapat keturunan laki laki dan perempuan';
    pecahanAyah = '0';
  }
  return [bagianAyah, punyaAyah, pecahanAyah];
}

//MENDAPATKAN SISA JIKA AHLI WARIS TIDAK ADA LAKI LAKI
List<dynamic> hitungBagianAnakPerempuan(Map input, int jumlah) {
  String bagianAnakPerempuan = '0';
  String punyaAnakPerempuan = 'Tidak ada';
  String pecahanAnakPerempuan = '0';
  if (input.length > 1 &&
      (!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Bapak') &&
          !input.containsKey('Kakek') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Saudara Laki-laki Sekandung') &&
          !input.containsKey('Saudara Laki-laki Sebapak') &&
          !input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') &&
          !input.containsKey('Paman Sekandung') &&
          !input.containsKey('Paman Sebapak') &&
          !input.containsKey('Anak dari Paman Laki-laki Sekandung') &&
          !input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if (jumlah == 1) {
      bagianAnakPerempuan = '1/2';
      punyaAnakPerempuan =
          'mendapatkan 1/2 dari harta waris + radd, dikarenakan anak perempuan sendiri, terpenuhi syarat radd, tidak ada yang mengashabahkannya, dan tidak ada menghijabnya';
      pecahanAnakPerempuan = '1/2';
    } else {
      bagianAnakPerempuan = '2/3';
      punyaAnakPerempuan =
          'mendapatkan 2/3 dari harta waris + radd, dikarenakan anak perempuan tidak sendiri, terpenuhi syarat radd, tidak ada yang mengashabahkannya, dan tidak ada menghijabnya';
      pecahanAnakPerempuan = '2/3';
    }
  } else if (input.length > 1 && !input.containsKey('Anak Laki-laki')) {
    if (jumlah == 1) {
      bagianAnakPerempuan = '1/2';
      punyaAnakPerempuan =
          'mendapatkan 1/2 dari keseluruhan harta waris, dikarenakan anak perempuan sendiri dan tidak ada yang mengashabahkannya';
      pecahanAnakPerempuan = '0';
    } else {
      bagianAnakPerempuan = '2/3';
      punyaAnakPerempuan =
          'mendapatkan 2/3 dari keseluruhan harta waris, dikarenakan anak perempuan tidak sendiri dan tidak ada yang meng-ashabah-kannya';
      pecahanAnakPerempuan = '0';
    }
  } else if (!input.containsKey('Anak Laki-laki') && input.length == 1) {
    bagianAnakPerempuan = '1';
    punyaAnakPerempuan =
        'mendapatkan keseluruhan harta waris, dikarenakan ahli waris tunggal';
    pecahanAnakPerempuan = '0';
  } else {
    bagianAnakPerempuan = '1ash';
    punyaAnakPerempuan =
        'mendapatkan setengahnya dari anak laki laki dari sisa harta waris, dikarenakan ada anak laki laki yang mengashabahkan saudara perempuannya (anak perempuan mayit)';
    pecahanAnakPerempuan = '0';
  }
  return [bagianAnakPerempuan, punyaAnakPerempuan, pecahanAnakPerempuan];
}

List<dynamic> hitunganBagianCucuLaki(Map input, int jumlah) {
  String bagianCucuLaki = '0';
  String punyaCucuLaki = 'Tidak ada';
  String pecahanCucuLaki = '0';
  if (input.containsKey('Cucu Perempuan dari Anak Laki-laki')) {
    bagianCucuLaki = '2ash';
    punyaCucuLaki =
        'mendapatkan 2 kalinya Cucu perempuan dari sisa harta warisan, dikarenakan Cucu laki laki meng-ashabah-kan (membuat orang lain mendapatkan sisa harta warisan) saudara perempuannya (Cucu perempuan mayit)';
    pecahanCucuLaki = ' 0';
  } else if (input.length > 1) {
    bagianCucuLaki = 'ash';
    punyaCucuLaki =
        'mendapatkan sisa harta warisan, karena tidak bersama saudara perempuannya (Cucu Perempuan Mayit)';
    pecahanCucuLaki = '0';
  } else {
    bagianCucuLaki = '1';
    punyaCucuLaki =
        'mendapatkan keseluruhan harta warisan, dikarenakan ahli waris tunggal';
    pecahanCucuLaki = '0';
  }
  return [bagianCucuLaki, punyaCucuLaki, pecahanCucuLaki];
}

// //SISA
List<dynamic> hitungBagianCucuPerempuan(Map input, int jumlah) {
  String bagianCucuPerempuan = '0';
  String punyaCucuPerempuan = 'Tidak ada';
  String pecahanCucuPerempuan = '0';
  if (input.length > 1 &&
      (!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Bapak') &&
          !input.containsKey('Kakek') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Saudara Laki-laki Sekandung') &&
          !input.containsKey('Saudara Laki-laki Sebapak') &&
          !input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') &&
          !input.containsKey('Paman Sekandung') &&
          !input.containsKey('Paman Sebapak') &&
          !input.containsKey('Anak dari Paman Laki-laki Sekandung') &&
          !input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if (input.containsKey('Anak Perempuan')) {
      bagianCucuPerempuan = '1/6';
      punyaCucuPerempuan =
          'mendapatkan 1/6 dari keseluruhan harta waris + Radd, dikarenakan ada anak perempuan, terpenuhi syarat radd, tidak ada yang mengashabahkannya dan tidak ada menghijabnya';
      pecahanCucuPerempuan = '1/6';
    } else if (jumlah == 1) {
      bagianCucuPerempuan = '1/2';
      punyaCucuPerempuan =
          'mendapatkan 1/2 dari keseluruhan harta waris + Radd, dikarenakan Cucu perempuan sendiri, terpenuhi syarat radd, tidak ada yang mengashabahkannya dan tidak ada menghijabnya';
      pecahanCucuPerempuan = '1/2';
    } else {
      bagianCucuPerempuan = '2/3';
      punyaCucuPerempuan =
          'mendapatkan 2/3 dari keseluruhan harta waris + Radd, dikarenakan Cucu perempuan tidak sendiri, terpenuhi syarat radd, tidak ada yang mengashabahkannya dan tidak ada menghijabnya';
      pecahanCucuPerempuan = '2/3';
    }
  } else if (input.length > 1 &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Perempuan')) {
    if (jumlah == 1) {
      bagianCucuPerempuan = '1/2';
      punyaCucuPerempuan =
          'mendapatkan 1/2 dari keseluruhan harta waris, dikarenakan cucu perempuan sendiri dan tidak ada yang mengashabahkannya';
      pecahanCucuPerempuan = '0';
    } else {
      bagianCucuPerempuan = '2/3';
      punyaCucuPerempuan =
          'mendapatkan 2/3 dari keseluruhan harta waris, dikarenakan cucu perempuan tidak sendiri dan tidak ada yang mengashabahkannya';
      pecahanCucuPerempuan = '0';
    }
  } else if (!input.containsKey('Cucu Laki-laki') &&
      input.containsKey('Anak Perempuan')) {
    bagianCucuPerempuan = '1/6';
    punyaCucuPerempuan =
        'Mendapatkan 1/6 keseluruhan harta waris, dikarenakan terdapat anak perempuan (sebagai penyempurna dari 2/3) dan tidak ada cucu laki laki yang meng-ashabah-kannya';
    pecahanCucuPerempuan = '0';
  } else if (!input.containsKey('Cucu Laki-laki') && input.length == 1) {
    bagianCucuPerempuan = '1';
    punyaCucuPerempuan =
        'mendapatkan keseluruhan harta waris, dikarenakan ahli waris tunggal';
    pecahanCucuPerempuan = '0';
  } else {
    bagianCucuPerempuan = '1ash';
    punyaCucuPerempuan =
        'mendapatkan setengahnya dari Cucu laki laki dari sisa harta waris, dikarenakan ada Cucu laki laki yang mengashabahkan saudara perempuannya (Cucu perempuan mayit)';
    pecahanCucuPerempuan = '0';
  }
  return [bagianCucuPerempuan, punyaCucuPerempuan, pecahanCucuPerempuan];
}

// // masih belum ada 1/3 sisa bersama dengan suami atau istri & ahli waris tunggal
List<dynamic> hitungBagianIbu(Map input, int jumlah) {
  String bagianIbu = '0';
  String punyaIbu = 'Tidak ada';
  String pecahanIbu = '0';
  int jamak = hitungJamak(input);
  if (((input.containsKey('Suami') || input.containsKey('Istri')) &&
          input.containsKey('Bapak') &&
          input.containsKey('Ibu')) &&
      input.length == 3) {
    bagianIbu = '1ash';
    punyaIbu =
        'Kasus Garawiyatan mengikuti Umar, Uthman, Zayd bin Thabit, dan Ibnu Masud. mendapatkan setengah kalinya bagian ayah (Suami dari ibu) dari sisa harta warisan (setelah dikurangi Suami atau Istri), dikarenakan tidak ada keturunan dan tidak ada jamak dari saudara';
    pecahanIbu = '0';
  } else if ((!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Anak Perempuan') &&
          !input.containsKey('Cucu Perempuan dari Anak Laki-laki')) &&
      (input.containsKey('Bapak') ||
          input.containsKey('Kakek') ||
          input.containsKey('Saudara Laki-laki Sekandung') ||
          input.containsKey('Saudara Laki-laki Sebapak') ||
          input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          input.containsKey('Paman Sekandung') ||
          input.containsKey('Paman Sebapak') ||
          input.containsKey('Anak dari Paman Laki-laki Sekandung') ||
          input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if ((jamak > 1)) {
      bagianIbu = '1/6';
      punyaIbu =
          'mendapatkan 1/6 dari keseluruhan waris dikarenakan tidak adanya keturunan dan ada jamak dari saudara (jumlah saudara dari mayit lebih dari 1)';
      pecahanIbu = '0';
    } else {
      bagianIbu = '1/3';
      punyaIbu =
          'mendapatkan 1/3, dikarenakan tidak adanya keturunan dan tidak adanya jamak dari saudara (jumlah saudara dari mayit hanya ada 1)';
      pecahanIbu = '0';
    }
  } else if (input.length > 1 &&
      (!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Bapak') &&
          !input.containsKey('Kakek') &&
          !input.containsKey('Saudara Laki-laki Sekandung') &&
          !input.containsKey('Saudara Laki-laki Sebapak') &&
          !input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') &&
          !input.containsKey('Paman Sekandung') &&
          !input.containsKey('Paman Sebapak') &&
          !input.containsKey('Anak dari Paman Laki-laki Sekandung') &&
          !input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if ((jamak > 1 ||
        (input.containsKey('Anak Perempuan') ||
            input.containsKey('Cucu Perempuan dari Anak Laki-laki')))) {
      bagianIbu = '1/6';
      punyaIbu =
          'mendapatkan 1/6 dan ditambahkan radd, dikarenakan hanya ada keturunan perempuan saja, tidak ada jamak dari saudara (jumlah saudara dari mayit hanya ada 1), terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
      pecahanIbu = '1/6';
    } else {
      bagianIbu = '1/3';
      punyaIbu =
          'mendapatkan 1/3 dan ditambahkan radd, dikarenakan tidak ada keturunan, tidak ada jamak dari saudara (jumlah saudara dari mayit hanya ada 1), terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
      pecahanIbu = '1/3';
    }
  } else {
    bagianIbu = '1/6';
    punyaIbu =
        'mendapatkan 1/6 dari keseluruhan waris dikarenakan ada keturunan dan ada jamak dari saudara';
    pecahanIbu = '0';
  }
  return [bagianIbu, punyaIbu, pecahanIbu];
}

// //SISA
List<dynamic> hitungBagianKakek(Map input, int jumlah) {
  String bagianKakek = '0';
  String punyaKakek = 'Tidak ada';
  String pecahanKakek = '0';
  if (!input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Perempuan') &&
      !input.containsKey('Cucu Perempuan dari Anak Laki-laki')) {
    // Jika tidak ada furu' (keturunan)
    if (input.length > 1) {
      bagianKakek = 'ash'; // Bagian Kakek adalah sisa dari keseluruhan warisan
      punyaKakek =
          'Sisa Keseluruhan harta warisan, dikarenakan mayit tidak meninggalkan keturunan (anak laki laki, anak perempuan dan cucu laki laki maupun perempuan dari jalur anak laki laki)';
      pecahanKakek = '0';
    } else {
      bagianKakek = '1';
      punyaKakek =
          'mendapatkan keseluruhan harta waris, dikarenakan ahli waris tunggal';
      pecahanKakek = '0';
    }
  } else if ((!input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Cucu Laki-laki'))) {
    // Jika ada anak perempuan dan tidak ada anak laki-laki
    bagianKakek = '1/6'; // Bagian Kakek adalah 1/6 ditambah SISA warisan
    punyaKakek =
        'bagiannya 1/6 keseluruhan harta warisan, ditambah seluruh sisa harta warisan. dikarenakan hanya ada keturunan perempuan tanpa keturunan laki laki ';
    pecahanKakek = '1/6';
  } else {
    bagianKakek = '1/6'; // Bagian Kakek adalah 1/6 dari keseluruhan warisan
    punyaKakek =
        'mendapatkan 1/6 dari keseluruhan harta waris, dikarenakan ada keturunan laki laki dan perempuan';
    pecahanKakek = '0';
  }
  return [bagianKakek, punyaKakek, pecahanKakek];
}

// // masih belum ada 1/3 sisa bersama dengan suami atau istri & ahli waris tunggal
List<dynamic> hitungBagianNenek(Map input, int jumlah) {
  String bagianNenek = '0';
  String punyaNenek = 'Tidak ada';
  String pecahanNenek = '0';
  if (!input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Cucu Laki-laki')) {
    bagianNenek = '1/6';
    punyaNenek =
        'mendapatkan 1/6 dan ditambahkan radd, dikarenakan hanya ada keturunan perempuan saja, tidak ada jamak dari saudara (jumlah saudara dari mayit hanya ada 1), terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
    pecahanNenek = '1/6';
  } else {
    bagianNenek = '1/6';
    punyaNenek =
        'mendapatkan 1/6 dari keseluruhan waris dikarenakan ada keturunan dan ada ataupun tidak ada jamak dari saudara';
    pecahanNenek = '0';
  }
  return [bagianNenek, punyaNenek, pecahanNenek];
}

List<dynamic> hitungBagianSdraKdg(Map input, int jumlah) {
  String bagianSdraKdg = '0';
  String punyaSdraKdg = 'Tidak ada';
  String pecahanSdraKdg = '0';
  if (input.containsKey('Suami') &&
      input.containsKey('Ibu') &&
      ((input.containsKey('Saudara Laki-laki Sekandung') &&
              input['Saudara Laki-laki Sekandung'] >= 1) ||
          (input.containsKey('Saudari Sekandung') &&
              input['Saudari Sekandung'] >= 1) ||
          (input.containsKey('Saudara Laki-laki Sebapak') &&
              input['Saudara Laki-laki Sebapak'] >= 1) ||
          (input.containsKey('Saudara Laki-laki Seibu') &&
              input['Saudara Laki-laki Seibu'] >= 1) ||
          (input.containsKey('Saudari Seibu') &&
              input['Saudari Seibu'] >= 1))) {
    double bagi = 0;
    if (input.containsKey('Saudara Laki-laki Sekandung')) {
      bagi += input['Saudara Laki-laki Sekandung'];
    }
    // if (input.containsKey('Saudari Sekandung')) {
    //   bagi += input['Saudari Sekandung'];
    // }
    if (input.containsKey('Saudara Laki-laki Seibu')) {
      bagi += input['Saudara Laki-laki Seibu'];
    }
    if (input.containsKey('Saudari Seibu')) {
      bagi += input['Saudari Seibu'];
    }
    bagianSdraKdg = '1/${3 * bagi.toInt()}';
    punyaSdraKdg =
        'dalam keadaan Musytarikah mengikuti Syafiiyah dan Malikiyah mengikuti Umar, Utsman, dan Zaid. Saudara/i seibu membagi rata dengan saudara laki laki kandung dan sudara perempuan kandung ';
    pecahanSdraKdg = '0';
  } else if (input.containsKey('Saudari Sekandung')) {
    bagianSdraKdg = '2ash';
    punyaSdraKdg =
        'mendapatkan 2 kalinya Saudari Sekandung dari sisa harta warisan, karena mengashabahkan saudari kandungnya';
    pecahanSdraKdg = '0';
  } else {
    bagianSdraKdg = 'ash'; // Bagian anak laki-laki adalah seluruh sisa warisan
    punyaSdraKdg =
        'mendapatkan sisa harta warisan, dikarenakan tidak terdapat orang yang ia ashabahkan';
    pecahanSdraKdg = '0';
  }
  return [bagianSdraKdg, punyaSdraKdg, pecahanSdraKdg];
}

List<dynamic> hitungBagianSdriKdg(Map input, int jumlah) {
  String bagianSdriKdg = '0';
  String punyaSdriKdg = 'Tidak ada';
  String pecahanSdriKdg = '0';
  /*if (input.containsKey('Suami') &&
      input.containsKey('Ibu') &&
      ((input.containsKey('Saudara Laki-laki Sekandung') &&
              input['Saudara Laki-laki Sekandung'] >= 1) ||
          (input.containsKey('Saudari Sekandung') &&
              input['Saudari Sekandung'] >= 1) ||
          (input.containsKey('Saudara Laki-laki Sebapak') &&
              input['Saudara Laki-laki Sebapak'] >= 1) ||
          (input.containsKey('Saudara Laki-laki Seibu') &&
              input['Saudara Laki-laki Seibu'] >= 1) ||
          (input.containsKey('Saudari Seibu') &&
              input['Saudari Seibu'] >= 1))) {
    double simpan = totalSisaHarta2 / 3;
    int bagi = 0;
    if (input.containsKey('Saudara Laki-laki Sekandung')) {
      bagi += 1;
    }
    if (input.containsKey('Saudari Sekandung')) {
      bagi = bagi + jumlah;
    }
    if (input.containsKey('Saudara Laki-laki Seibu')) {
      bagi += 1;
    }
    if (input.containsKey('Saudari Seibu')) {
      bagi += 1;
    }
    bagianSdriKdg = simpan / bagi;
    punyaSdriKdg =
        'dalam keadaan Musytarikah, Saudara/i seibu membagi rata dengan saudara laki laki kandung dan sudara perempuan kandung ';
    pecahanSdriKdg = 0;
  } else */
  if (input.length > 1 &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Perempuan') &&
      !input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Cucu Perempuan') &&
      !input.containsKey('Saudara Laki-laki Sekandung') &&
      !input.containsKey('Bapak') &&
      !input.containsKey('Kakek') &&
      (input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') ||
          input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') ||
          input.containsKey('Paman Sekandung') ||
          input.containsKey('Paman Sebapak') ||
          input.containsKey('Anak dari Paman Laki-laki Sekandung') ||
          input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if (jumlah == 1) {
      bagianSdriKdg = '1/2';
      punyaSdriKdg =
          'mendapatkan 1/2 dari keseluruhan harta waris, dikarenakan Saudari Sekandung hanya sendiri dan tidak ada yang mengashabahkannya (saudara laki lakinya)';
      pecahanSdriKdg = '0';
    } else {
      bagianSdriKdg = '2/3';
      punyaSdriKdg =
          'mendapatkan 2/3 dari keseluruhan harta waris, dikarenakan Saudari Sekandung tidak sendiri dan tidak ada yang mengashabahkannya (saudara laki lakinya)';
      pecahanSdriKdg = '0';
    }
  } else if (input.length > 1 &&
      (!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Bapak') &&
          !input.containsKey('Kakek') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Cucu Perempuan dari Anak Laki-laki') &&
          !input.containsKey('Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Perempuan') &&
          !input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') &&
          !input.containsKey('Paman Sekandung') &&
          !input.containsKey('Paman Sebapak') &&
          !input.containsKey('Anak dari Paman Laki-laki Sekandung') &&
          !input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    if (jumlah == 1) {
      bagianSdriKdg = '1/2';
      punyaSdriKdg =
          'mendapatkan 1/2 dan ditambahkan radd, dikarenakan tidak ada keturunan, saudari kandung hanya sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
      pecahanSdriKdg = '1/2';
    } else {
      bagianSdriKdg = '2/3';
      punyaSdriKdg =
          'mendapatkan 2/3 dan ditambahkan radd, dikarenakan tidak ada keturunan, saudari kandung tidak hanya sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
      pecahanSdriKdg = '2/3';
    }
  } else if (input.length > 1 &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Saudara Laki-laki Sekandung') &&
      !input.containsKey('Bapak') &&
      !input.containsKey('Kakek')) {
    bagianSdriKdg = 'ash';
    punyaSdriKdg =
        'mendapatkan sisa dari keseluruhan harta waris, dikarenakan Saudari Sekandung tidak sendiri , bukan ahli waris tunggal dan tidak ada yang menghijabnya dan mengashabahkannya';
    pecahanSdriKdg = '0';
  } else {
    bagianSdriKdg = '1ash';
    punyaSdriKdg =
        'mendapatkan setengahnya dari Saudara Kandung dari sisa harta waris, dikarenakan ada Saudara Kandung yang mengashabahkannya';
    pecahanSdriKdg = '0';
  }
  return [bagianSdriKdg, punyaSdriKdg, pecahanSdriKdg];
}

List<dynamic> hitungBagianSdraPriaSeayah(Map input, int jumlah) {
  String bagianSdraPriaSeayah = '0';
  String punyaSdraPriaSeayah = 'Tidak ada';
  String pecahanSdraPriaSeayah = '0';
  if (input.containsKey('Saudari Sebapak')) {
    bagianSdraPriaSeayah = '2ash';
    punyaSdraPriaSeayah =
        'mendapatkan 2 kalinya Saudari Seayah dari sisa harta warisan, karena mengashabahkan saudari seayahnya';
    pecahanSdraPriaSeayah = '0';
  } else {
    bagianSdraPriaSeayah =
        'ash'; // Bagian anak laki-laki adalah seluruh sisa warisan
    punyaSdraPriaSeayah =
        'mendapatkan sisa harta warisan, dikarenakan tidak terdapat orang yang ia ashabahkan';
    pecahanSdraPriaSeayah = '0';
  }
  return [bagianSdraPriaSeayah, punyaSdraPriaSeayah, pecahanSdraPriaSeayah];
}

List<dynamic> hitungBagianSdriSeayah(Map input, int jumlah) {
  String bagianSdriSeayah = '0';
  String punyaSdriSeayah = 'Tidak ada';
  String pecahanSdriSeayah = '0';
  int jamak = hitungJamakRaddSeayah(input);
  if ((!input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Bapak') &&
      !input.containsKey('Kakek') &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Cucu Perempuan dari Anak Laki-laki') &&
      !input.containsKey('Saudara Laki-laki Sekandung') &&
      !input.containsKey('Anak Perempuan') &&
      !input.containsKey('Saudara Laki-laki Sebapak'))) {
    if (jumlah >= 1 &&
        (input.containsKey('Saudari Sekandung') &&
            input['Saudari Sekandung'] == 1)) {
      if (jamak < 1) {
        bagianSdriSeayah = '1/6';
        punyaSdriSeayah = //lanjutin dari sini
            'mendapatkan 1/6 dari keseluruhan harta waris + Radd, terdapat Saudari Sekandung berjumlah 1 orang, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
        pecahanSdriSeayah = '1/6';
      } else {
        bagianSdriSeayah = '1/6';
        punyaSdriSeayah =
            'mendapatkan 1/6 dari keseluruhan harta waris, terdapat Saudari Sekandung berjumlah 1 orang';
        pecahanSdriSeayah = '0';
      }
    } else if (!input.containsKey('Saudari Sekandung')) {
      if (jamak < 1) {
        if (jumlah == 1) {
          bagianSdriSeayah = '1/2';
          punyaSdriSeayah =
              'mendapatkan 1/2 dari keseluruhan harta waris + Radd, dikarenakan Saudari Seayah sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
          pecahanSdriSeayah = '1/2';
        } else {
          bagianSdriSeayah = '2/3';
          punyaSdriSeayah =
              'mendapatkan 2/3 dari keseluruhan harta waris + Radd, dikarenakan Saudari Seayah tidak sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
          pecahanSdriSeayah = '2/3';
        }
      } else {
        if (jumlah == 1) {
          bagianSdriSeayah = '1/2';
          punyaSdriSeayah =
              'mendapatkan 1/2 dari keseluruhan harta waris, dikarenakan Saudari Seayah sendiri dan tidak ada yang mengashabahkannya (saudara laki laki Seayah)';
          pecahanSdriSeayah = '0';
        } else {
          bagianSdriSeayah = '2/3';
          punyaSdriSeayah =
              'mendapatkan 2/3 dari keseluruhan harta waris, dikarenakan Saudari Seayah tidak sendiri dan tidak ada yang mengashabahkannya (saudara laki laki Seayah)';
          pecahanSdriSeayah = '0';
        }
      }
    }
  } else if (input.length > 1 &&
      !input.containsKey('Cucu Laki-laki') &&
      !input.containsKey('Anak Laki-laki') &&
      !input.containsKey('Saudara Laki-laki Sekandung') &&
      !input.containsKey('Bapak') &&
      !input.containsKey('Kakek') &&
      !input.containsKey('Saudari Sekandung') &&
      !input.containsKey('Saudara Laki-laki Sebapak')) {
    bagianSdriSeayah = 'ash';
    punyaSdriSeayah =
        'mendapatkan sisa dari keseluruhan harta waris, dikarenakan Saudari Seayah tidak sendiri dan bukan ahli waris tunggal';
    pecahanSdriSeayah = '0';
  } else {
    bagianSdriSeayah = '1ash';
    punyaSdriSeayah =
        'mendapatkan setengahnya dari Saudara laki laki Seayah dari sisa harta waris, dikarenakan ada Saudara laki laki Seayah yang mengashabahkannya';
    pecahanSdriSeayah = '0';
  }
  return [bagianSdriSeayah, punyaSdriSeayah, pecahanSdriSeayah];
}

List<dynamic> hitungBagianSdriSeibu(Map input, int jumlah) {
  String bagianSdraSeibu = '0';
  String punyaSdraSeibu = 'Tidak ada';
  String pecahanSdraSeibu = '0';
  int jamakIbu = hitungJamakSeibu(input);
  if (input.containsKey('Suami') &&
      input.containsKey('Ibu') &&
      (input.containsKey('Saudara Laki-laki Sekandung') &&
          input['Saudara Laki-laki Sekandung'] >= 1) &&
      /*(input.containsKey('Saudari Sekandung') &&
              input['Saudari Sekandung'] >= 1) ||*/
      ((input.containsKey('Saudara Laki-laki Sebapak') &&
              input['Saudara Laki-laki Sebapak'] >= 1) ||
          (input.containsKey('Saudara Laki-laki Seibu') &&
              input['Saudara Laki-laki Seibu'] >= 1) ||
          (input.containsKey('Saudari Seibu') &&
              input['Saudari Seibu'] >= 1))) {
    double simpan = 1 / 3;
    double bagi = 0;
    if (input.containsKey('Saudara Laki-laki Sekandung')) {
      bagi += input['Saudara Laki-laki Sekandung'];
    }
    // if (input.containsKey('Saudari Sekandung')) {
    //   bagi += input['Saudari Sekandung'];
    // }
    if (input.containsKey('Saudara Laki-laki Seibu')) {
      bagi += input['Saudara Laki-laki Seibu'];
    }
    if (input.containsKey('Saudari Seibu')) {
      bagi += input['Saudari Seibu'];
    }
    bagianSdraSeibu = '1/${3 * bagi.toInt()}';
    punyaSdraSeibu =
        'dalam keadaan Musytarikah mengikuti Syafiiyah dan Malikiyah mengikuti Umar, Utsman, dan Zaid. Saudara/i seibu membagi rata dengan saudara laki laki kandung dan sudara perempuan kandung ';
    pecahanSdraSeibu = '0';
  } else if (input.length > 1 &&
      (!input.containsKey('Anak Laki-laki') &&
          !input.containsKey('Bapak') &&
          !input.containsKey('Kakek') &&
          !input.containsKey('Cucu Laki-laki') &&
          !input.containsKey('Cucu Perempuan dari Anak Laki-laki') &&
          !input.containsKey('Anak Perempuan') &&
          !input
              .containsKey('Anak Laki-laki dari Saudara Laki-laki Sekandung') &&
          !input.containsKey('Anak Laki-laki dari Saudara Laki-laki Sebapak') &&
          !input.containsKey('Paman Sekandung') &&
          !input.containsKey('Paman Sebapak') &&
          !input.containsKey('Anak dari Paman Laki-laki Sekandung') &&
          !input.containsKey('Anak dari Paman Laki-laki Sebapak'))) {
    int jmlLaki = input['Saudara Laki-laki Seibu'] ?? 0;
    int jmlCewe = input['Saudari Seibu'] ?? 0;
    if (((input.containsKey('Saudara Laki-laki Seibu') &&
                input['Saudara Laki-laki Seibu'] == 1) ||
            (input.containsKey('Saudari Seibu') &&
                input['Saudari Seibu'] == 1)) &&
        jamakIbu == 1) {
      bagianSdraSeibu = '1/6';
      punyaSdraSeibu =
          'mendapatkan 1/6 dari keseluruhan harta waris ditambahkan Radd, dikarenakan Saudari Sekandung sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
      pecahanSdraSeibu = '1/6';
    } else {
      if (jamakIbu > 1 || jumlah > 1) {
        bagianSdraSeibu = '1/${3 * (jmlLaki + jmlCewe)}';
        punyaSdraSeibu =
            'mendapatkan 1/3 dari keseluruhan harta waris ditambahkan Radd, dikarenakan Saudari Sekandung tidak sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
        pecahanSdraSeibu = '1/${3 * (jmlLaki + jmlCewe)}';
      } else {
        bagianSdraSeibu = '1/${6 * (jmlLaki + jmlCewe)}';
        punyaSdraSeibu =
            'mendapatkan 1/6 dari keseluruhan harta waris ditambahkan Radd, dikarenakan Saudari Sekandung hanya sendiri, terpenuhi syarat radd dan tidak ada yang mengashabahkannya';
        pecahanSdraSeibu = '1/${6 * (jmlLaki + jmlCewe)}';
      }
    }
  } else if (jamakIbu == 1 || jumlah == 1) {
    bagianSdraSeibu = '1/6';
    punyaSdraSeibu =
        'Mendapatkan 1/6 dari harta waris dikarenakan sendirian dan tidak ada yang menghalangi';
    pecahanSdraSeibu = '0';
  } else if (jamakIbu > 1 || jumlah > 1) {
    int jmlLaki = input['Saudara Laki-laki Seibu'] ?? 0;
    int jmlCewe = input['Saudari Seibu'] ?? 0;
    bagianSdraSeibu = '1/${3 * (jmlLaki + jmlCewe)}';
    punyaSdraSeibu =
        'Mendapatkan 1/3 dari harta waris dikarenakan jamak dan tidak ada yang menghalangi';
    pecahanSdraSeibu = '0';
  }
  return [bagianSdraSeibu, punyaSdraSeibu, pecahanSdraSeibu];
}

List<dynamic> hitungBagianKeponakanLakiKandung(Map input, int jumlah) {
  String bagiankeponlakiKdg = '0';
  String punyakeponlakiKdg = 'Tidak ada';
  String pecahankeponlakiKdg = '0';
  bagiankeponlakiKdg = 'ash';
  punyakeponlakiKdg =
      "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahankeponlakiKdg = '0';
  return [bagiankeponlakiKdg, punyakeponlakiKdg, pecahankeponlakiKdg];
}

List<dynamic> hitungBagianKeponakanLakiSeayah(Map input, int jumlah) {
  String bagiankeponlakiSeayah = '0';
  String punyakeponlakiSeayah = 'Tidak ada';
  String pecahankeponlakiSeayah = '0';
  bagiankeponlakiSeayah = 'ash';
  punyakeponlakiSeayah =
      "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahankeponlakiSeayah = '0';
  return [bagiankeponlakiSeayah, punyakeponlakiSeayah, pecahankeponlakiSeayah];
}

List<dynamic> hitungBagianPamanKdg(Map input, int jumlah) {
  String bagianPamanKdg = '0';
  String punyaPamanKdg = 'Tidak ada';
  String pecahanPamanKdg = '0';
  bagianPamanKdg = 'ash';
  punyaPamanKdg = "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahanPamanKdg = '0';
  return [bagianPamanKdg, punyaPamanKdg, pecahanPamanKdg];
}

List<dynamic> hitungBagianPamanSeayah(Map input, int jumlah) {
  String bagianPamanSeayah = '0';
  String punyaPamanSeayah = 'Tidak ada';
  String pecahanPamanSeayah = '0';
  bagianPamanSeayah = 'ash';
  punyaPamanSeayah = "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahanPamanSeayah = '0';
  return [bagianPamanSeayah, punyaPamanSeayah, pecahanPamanSeayah];
}

List<dynamic> hitungBagianSepupuKdg(Map input, int jumlah) {
  String bagianSepupuKdg = '0';
  String punyaSepupuKdg = 'Tidak ada';
  String pecahanSepupuKdg = '0';
  bagianSepupuKdg = 'ash';
  punyaSepupuKdg = "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahanSepupuKdg = '0';
  return [bagianSepupuKdg, punyaSepupuKdg, pecahanSepupuKdg];
}

List<dynamic> hitungBagianSepupuSeayah(Map input, int jumlah) {
  String bagianSepupuSeayah = '0';
  String punyaSepupuSeayah = 'Tidak ada';
  String pecahanSepupuSeayah = '0';
  bagianSepupuSeayah = 'ash';
  punyaSepupuSeayah =
      "Tidak ada yang menghijab, mendapatkan sisa harta warisan";
  pecahanSepupuSeayah = '0';
  return [bagianSepupuSeayah, punyaSepupuSeayah, pecahanSepupuSeayah];
}
