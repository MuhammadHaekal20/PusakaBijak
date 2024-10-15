import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> fetchGoldBuyPrice() async {
  final response = await http.get(
      Uri.parse('https://logam-mulia-api.vercel.app/prices/hargaemas-com'));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data['data'][0]['buy']
        .toDouble(); // Mengambil harga beli dari respons API
  } else {
    throw Exception('Failed to load gold price');
  }
}
