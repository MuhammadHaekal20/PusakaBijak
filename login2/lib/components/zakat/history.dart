import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> history;
  static String routeName = "/history_zakat";

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'History Zakat',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada histori.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                final type = item['type'] ?? 'Unknown';
                final zakat = item['zakat'] ?? 0.0;
                final date = item['date'] ?? DateTime.now();
                String details = '';

                if (type == 'Zakat Penghasilan') {
                  final amount = item['amount'] ?? 0;
                  details =
                      'Penghasilan: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(amount)}';
                } else if (type == 'Zakat Fitrah') {
                  final pricePerKg = item['pricePerKg'] ?? 0;
                  final numberOfPeople = item['numberOfPeople'] ?? 0;
                  details =
                      'Harga Beras per Kg: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(pricePerKg)}\nJumlah Orang: $numberOfPeople';
                } else if (type == 'Zakat Tambak') {
                  final modal = item['modal'] ?? 0;
                  final keuntungan = item['keuntungan'] ?? 0;
                  details =
                      'Modal: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(modal)}\nKeuntungan: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(keuntungan)}';
                } else if (type == 'Zakat Perdagangan') {
                  final capital = item['capital'] ?? 0;
                  final profit = item['profit'] ?? 0;
                  final debt = item['debt'] ?? 0;
                  details =
                      'Modal: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(capital)}\nKeuntungan: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(profit)}\nHutang: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(debt)}';
                } else if (type == 'Zakat Perusahaan') {
                  final assets = item['assets'] ?? 0;
                  final liabilities = item['liabilities'] ?? 0;
                  details =
                      'Aset lancar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(assets)}\nHutang jangka pendek: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(liabilities)}';
                } else if (type == 'Zakat Rikaz') {
                  final amount = item['amount'] ?? 0;
                  details =
                      'Harga harta: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(amount)}';
                } else if (type == 'Zakat Emas dan Perak') {
                  final gold = item['gold'] ?? 0;
                  final silver = item['silver'] ?? 0;
                  details =
                      'Harga Emas: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(gold)}\nHarga Perak: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(silver)}';
                } else if (type == 'Zakat Emas') {
                  final gold = item['gold'] ?? 0;
                  details = 'Jumlah Emas: ${gold} gram';
                } else if (type == 'Zakat Perak') {
                  final silver = item['silver'] ?? 0;
                  details = 'Jumlah Perak: ${silver} gram';
                } else if (type == 'Zakat Kambing' || type == 'Zakat Sapi') {
                  final jumlah = item['jumlah'] ?? 0;
                  details = 'Jumlah: $jumlah ekor\nZakat: $zakat';
                } else if (type == 'Zakat Pertanian') {
                  final harvestKg = item['harvestKg'] ?? 0;
                  final pricePerKg = item['pricePerKg'] ?? 0;
                  final irrigationType = item['irrigationType'] ?? 'Unknown';
                  details =
                      'Hasil Panen: ${NumberFormat("#,###").format(harvestKg)} Kg\nHarga per Kg: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(pricePerKg)}\nTipe Irigasi: $irrigationType';
                }

                IconData iconData;
                if (type == 'Zakat Penghasilan') {
                  iconData = Icons.attach_money;
                } else if (type == 'Zakat Fitrah') {
                  iconData = Icons.rice_bowl;
                } else if (type == 'Zakat Tambak') {
                  iconData = Icons.water_damage;
                } else if (type == 'Zakat Perdagangan') {
                  iconData = Icons.scale;
                } else if (type == 'Zakat Perusahaan') {
                  iconData = Icons.apartment;
                } else if (type == 'Zakat Rikaz') {
                  iconData = Icons.search;
                } else if (type == 'Zakat Emas') {
                  iconData = FontAwesomeIcons.coins;
                } else if (type == 'Zakat Perak') {
                  iconData = FontAwesomeIcons.coins;
                } else if (type == 'Zakat Sapi') {
                  iconData = FontAwesomeIcons.cow;
                } else if (type == 'Zakat Kambing') {
                  iconData = FontAwesomeIcons.cow;
                } else if (type == 'Zakat Pertanian') {
                  iconData = FontAwesomeIcons.wheatAwn;
                } else {
                  iconData = Icons.help;
                }

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              iconData,
                              color: const Color(0xFF3D0C01),
                              size: 40,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  type,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  DateFormat('MMM yyyy').format(date),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          details,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        if (type != 'Zakat Kambing' && type != 'Zakat Sapi')
                          Text(
                            'Zakat: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(zakat)}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
