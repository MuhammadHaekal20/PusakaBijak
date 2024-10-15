List<dynamic> duaash1ash(Map<String, String> pecahan) {
  // Map dengan nilai sebagai string pecahan

  // Fungsi untuk mengonversi string pecahan menjadi double
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

  pecahan.forEach((key, value) {
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
  Map<String, String> newResults = {};

  pecahan.forEach((key, value) {
    List<String> parts = value.split('/');
    if (parts.length == 2) {
      double numerator = double.parse(parts[0]);
      double denominator = double.parse(parts[1]);
      double fractionValue = (numerator / denominator) * commonDenominator;
      results[key] = fractionValue;
      total += fractionValue;
    }
  });

  // Menghitung nilai sisa untuk 'ash'
  double ashValue = commonDenominator - total;
  results.forEach((key, value) {
    newResults[key] = '${value.toStringAsFixed(0)}/$commonDenominator';
  });

  // Jika terdapat '2ash' dan '1ash' dalam map
  if (pecahan.containsValue('2ash') && pecahan.containsValue('1ash')) {
    // Menentukan faktor pengali untuk '2ash' dan '1ash'
    int factor = (ashValue.toInt() % 2 == 0) ? 2 : 3;

    // Menghitung penyebut baru
    int newCommonDenominator = commonDenominator * factor;

    // Menghitung total pecahan dalam penyebut baru
    double newTotal = 0.0;
    results.forEach((key, value) {
      double newFractionValue =
          value / commonDenominator * newCommonDenominator;
      newResults[key] =
          '${newFractionValue.toStringAsFixed(0)}/$newCommonDenominator';
      newTotal += newFractionValue;
    });

    // Menghitung sisa baru
    double newAshValue = newCommonDenominator - newTotal;

    // Menghitung nilai '2ash' dan '1ash'
    double twoAshValue = (2 / 3) * newAshValue;
    double oneAshValue = (1 / 3) * newAshValue;

    // Menambahkan '2ash' dan '1ash' ke dalam hasil
    String twoAshRecipient =
        pecahan.entries.firstWhere((entry) => entry.value == '2ash').key;
    String oneAshRecipient =
        pecahan.entries.firstWhere((entry) => entry.value == '1ash').key;
    newResults[twoAshRecipient] =
        '${twoAshValue.toStringAsFixed(0)}/$newCommonDenominator';
    newResults[oneAshRecipient] =
        '${oneAshValue.toStringAsFixed(0)}/$newCommonDenominator';
  }

  // Menampilkan hasil
  // newResults.forEach((key, value) {
  //   print('Kunci: $key, Nilai Dikalkulasi: $value');
  // });
  return [newResults];
}
