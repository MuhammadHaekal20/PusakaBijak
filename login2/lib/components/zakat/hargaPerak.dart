import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<double?> fetchHargaPerak() async {
  const url = 'https://harga-emas.org/perak/';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var priceElement = document.querySelectorAll(
          'td[style="border-right: none;font-size: 26px;font-weight: bold;"][align="right"]')[3];

      if (priceElement != null) {
        var silverPriceText = priceElement.text.trim();
        var cleanedSilverPrice =
            silverPriceText.replaceAll(RegExp(r'[^0-9,]'), '');
        cleanedSilverPrice = cleanedSilverPrice.replaceAll(',', '.');
        double? silverPrice = double.tryParse(cleanedSilverPrice);

        if (silverPrice != null) {
          return silverPrice;
        }
      }
    }
  } catch (e) {
    print('An error occurred: $e');
  }
  return null;
}
