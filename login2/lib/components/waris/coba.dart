List<dynamic> penyamaan(Map<String, String> results) {
  // Langkah 1: Temukan penyebut terbesar
  double findMaxDenominator(Map<String, String> results) {
    double maxDenominator = 0;
    for (var value in results.values) {
      var denominator = double.parse(value.split('/')[1]);
      if (denominator > maxDenominator) {
        maxDenominator = denominator;
      }
    }
    return maxDenominator;
  }

  double maxDenominator = findMaxDenominator(results);

  // Langkah 2: Normalisasi pecahan
  Map<String, String> normalizedResults = {};
  for (var entry in results.entries) {
    var key = entry.key;
    var value = entry.value;
    var parts = value.split('/');
    var numerator = double.parse(parts[0]);
    var denominator = double.parse(parts[1]);

    // Hitung faktor untuk normalisasi
    double factor = maxDenominator / denominator;
    double newNumerator = numerator * factor;

    normalizedResults[key] = '${newNumerator}/${maxDenominator}';
  }

  print(normalizedResults);
  return [normalizedResults];
}
