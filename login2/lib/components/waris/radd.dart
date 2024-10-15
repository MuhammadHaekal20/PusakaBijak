import 'coba.dart';

List<dynamic> raddsaja(Map<String, String> pecahan, Map<String, String> radd) {
  // Map dengan nilai sebagai string pecahan

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
  List<int> denominators =
      pecahan.values.map((e) => int.parse(e.split('/')[1])).toList();

  // Mencari KPK dari semua penyebut
  int commonDenominator =
      denominators.reduce((value, element) => kpk(value, element));

  // Menampilkan KPK
  // print("KPK dari penyebut yang ada adalah: $commonDenominator");
  // Kalikan pecahan dengan penyebut yang baru
  Map<String, double> results = {};
  Map<String, String> results2 = {};
  Map<String, double> results3 = {};
  Map<String, String> results4 = {};
  Map<String, String> hasil = {};
  pecahan.forEach((key, value) {
    List<String> parts = value.split('/');
    double numerator = double.parse(parts[0]);
    double denominator = double.parse(parts[1]);
    double fractionValue = (numerator / denominator) * commonDenominator;
    results[key] = fractionValue;
    results2[key] = '$fractionValue/$commonDenominator';
  });

  // Menampilkan hasil perkalian
  // results2.forEach((key, value) {
  //   print('$key: $value');
  // });
  // Totalkan hasil perkalian pecahan dengan penyebut
  double total = results.values.reduce((value, element) => value + element);

  // Menampilkan total
  // print("Total hasil perkalian pecahan dengan penyebut: $total");

  // Jika total kurang dari penyebut yang baru, kurangi penyebut yang baru dengan total dan simpan di variabel 'sisa'
  double sisa = 0.0;
  int newDenominator = commonDenominator;
  if (total < commonDenominator) {
    sisa = commonDenominator - total;
    newDenominator = commonDenominator;
  }
  // Menampilkan sisa
  // print("Sisa setelah mengurangkan total dari penyebut yang baru: $sisa");

  // Fokus pada Map radd
  if (radd.length == 1) {
    radd.forEach((key, value) {
      results4[key] = results2[key]!;
    });
    results4.forEach((key, value) {
      List<String> parts = value.split('/');
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      double updatedpembilang = (numerator + sisa);
      results2[key] = '$updatedpembilang/$denominator';
    });
    hasil = results2;
  } else if (radd.length > 1) {
    List<double> listRatio = [];
    radd.forEach((key, value) {
      List<String> parts = value.split('/');
      // print(parts);
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      double ratio = numerator / denominator;
      listRatio.add(ratio);
    });
    // print(listRatio);
    double smallest = findSmallest(listRatio);
    // print(smallest);
    int i = 0;
    Map<String, double> baruList = {};
    List<double> newList = calculateRatio(listRatio, smallest);
    radd.forEach((key, value) {
      baruList[key] = newList[i];
      results4[key] = '${results[key]}/$commonDenominator';
      i += 1;
    });
    // print(results4);
    // print("List awal: $listRatio");
    // print("Hasil perhitungan dengan member terkecil: $baruList");
    double sum = newList.reduce((value, element) => value + element);
    // Menambahkan sisa ke hasil perkalian berdasarkan perbandingan
    results4.forEach((key, value) {
      List<String> parts = value.split('/');
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      double angka = baruList[key]!;
      double updatedpembilang = (angka * sisa);
      double updatedpenyebut = ((sum * commonDenominator));
      results3[key] = updatedpembilang / updatedpenyebut;
      results4[key] = '$updatedpembilang / $updatedpenyebut';
    });

    hasil = sumAndSimplify(results2, results4);
  }
  // print(hasil);
  print('Sebelum $hasil');
  List<dynamic> sementara = penyamaan(hasil);
  hasil = sementara[0];
  print('Sesudah $hasil');
  return [hasil];
}

double findSmallest(List<double> list) {
  if (list.isEmpty) {
    throw Exception("List kosong");
  }

  double smallest = list[0];

  for (int i = 1; i < list.length; i++) {
    if (list[i] < smallest) {
      smallest = list[i];
    }
  }

  return smallest;
}

List<double> calculateRatio(List<double> list, double smallest) {
  List<double> result = [];

  for (int i = 0; i < list.length; i++) {
    double calculatedRatio = list[i] / smallest;
    result.add(calculatedRatio);
  }

  return result;
}

Map<String, String> sumAndSimplify(
    Map<String, String> pecahan1, Map<String, String> pecahan2) {
  Map<String, String> hasil = {};

  pecahan1.forEach((key, value) {
    if (pecahan2.containsKey(key)) {
      var pecahan1List = value.split('/').map((e) => double.parse(e)).toList();
      var pecahan2List =
          pecahan2[key]!.split('/').map((e) => double.parse(e)).toList();

      // Menghitung penjumlahan pecahan
      double pembilang =
          pecahan1List[0] * pecahan2List[1] + pecahan2List[0] * pecahan1List[1];
      double penyebut = pecahan1List[1] * pecahan2List[1];

      // Mencari FPB (Faktor Persekutuan Terbesar) dari pembilang dan penyebut
      double fpb = 1;
      for (int i = 1; i <= pembilang && i <= penyebut; i++) {
        if (pembilang % i == 0 && penyebut % i == 0) {
          fpb = i.toDouble();
        }
      }

      // Memperoleh hasil akhir dalam bentuk pecahan
      double hasilPembilang = pembilang / fpb;
      double hasilPenyebut = penyebut / fpb;

      // Membuat hasil akhir dalam bentuk string pecahan
      hasil[key] = '$hasilPembilang' + '/' + '$hasilPenyebut';
    } else {
      hasil[key] =
          value; // Jika key pada pecahan1 tidak ada di pecahan2, maka tambahkan langsung ke hasil
    }
  });

  // Menambahkan key dari pecahan2 yang tidak ada di pecahan1 ke hasil
  // pecahan2.forEach((key, value) {
  //   if (!pecahan1.containsKey(key)) {
  //     hasil[key] = value;
  //   }
  // });

  return hasil;
}
