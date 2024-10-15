List<dynamic> ashaja(Map<String, String> pecahan) {
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

  // Mencari siapa yang mendapatkan 'ash'
  String ashRecipient =
      pecahan.entries.firstWhere((entry) => entry.value == 'ash').key;
  newResults[ashRecipient] =
      '${ashValue.toStringAsFixed(0)}/$commonDenominator';

  // Menampilkan hasil
  // newResults.forEach((key, value) {
  //   print('Kunci: $key, Nilai Dikalkulasi: $value');
  // });
  return [newResults];
}
