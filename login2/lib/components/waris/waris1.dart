import 'dart:ffi';
import 'package:login2/screens/homepage/homepage.dart';
import 'package:login2/utils/constants.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'seleksi.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

List<Map<String, dynamic>> history = [];

String timeAgo(DateTime dateTime) {
  final duration = DateTime.now().difference(dateTime);
  if (duration.inMinutes < 1) {
    return 'Baru saja';
  } else if (duration.inMinutes < 60) {
    return '${duration.inMinutes} menit lalu';
  } else if (duration.inHours < 24) {
    return '${duration.inHours} jam lalu';
  } else {
    return '${duration.inDays} hari lalu';
  }
}

class ResultPage extends StatelessWidget {
  final Map<String, int> filteredInheritance;
  final Map<String, double> hasil;
  final Map<String, String> pecahan;
  final Map<String, String> jelas;
  final Map<String, String> terhalangSeleksi;
  final double totalHarta;

  ResultPage({
    super.key,
    required this.filteredInheritance,
    required this.hasil,
    required this.pecahan,
    required this.jelas,
    required this.terhalangSeleksi,
    required this.totalHarta,
  }) {
    // Menyimpan hasil ke dalam history
    history.add({
      'filteredInheritance': filteredInheritance,
      'hasil': hasil,
      'pecahan': pecahan,
      'jelas': jelas,
      'terhalangSeleksi': terhalangSeleksi,
      'totalHarta': totalHarta, // Simpan totalHarta di sini
    });
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Set to your desired locale
      symbol: 'Rp', // Currency symbol
      decimalDigits: 2, // Number of decimal places
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          },
        ),
        title: const Text(
          'Hasil Pembagian',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontFamily: 'Hermeneus One',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              // Handle favorite button press
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Harta yang Dibagikan:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    currencyFormatter.format(totalHarta),
                    style: const TextStyle(fontSize: 18),
                  ),
                  Tooltip(
                    message: 'Harta yang dibagikan sudah dikurangi oleh hutang',
                    child: IconButton(
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        // Handle share button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10, width: 20),
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor, width: 1),
                ),
                child: DataTable(
                  dataTextStyle: const TextStyle(fontFamily: 'Hermeneus One'),
                  columnSpacing: 10,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Ahli Waris',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Jumlah',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Siham',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Bagian',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  rows: filteredInheritance.keys.map((key) {
                    int value = filteredInheritance[key] ?? 0;
                    double value1 = hasil[key] ?? 0;
                    String value3 = pecahan[key] ?? '';
                    String value4 = jelas[key] ?? '';
                    return DataRow(cells: [
                      DataCell(Text(key, style: const TextStyle(fontSize: 12))),
                      DataCell(Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        '$value3',
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        currencyFormatter.format(value1),
                        style: const TextStyle(fontSize: 12),
                      )),
                    ]);
                  }).toList(),
                  border: TableBorder.all(
                    color: kPrimaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Detail Bagian Harta:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: filteredInheritance.keys.map((key) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '$key =${jelas[key]}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: terhalangSeleksi.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ahli Waris Terhalang',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10, width: 20),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kPrimaryColor, width: 1),
                      ),
                      child: DataTable(
                        dataTextStyle:
                            const TextStyle(fontFamily: 'Hermeneus One'),
                        columnSpacing: 10,
                        horizontalMargin: 10,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Terhalang',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Alasan',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        rows: terhalangSeleksi.keys.map((key) {
                          String value5 = terhalangSeleksi[key] ?? '';
                          return DataRow(cells: [
                            DataCell(Text(key,
                                style: const TextStyle(fontSize: 12))),
                            DataCell(Text(
                              value5.toString(),
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            )),
                          ]);
                        }).toList(),
                        border: TableBorder.all(
                          color: kPrimaryColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          },
        ),
        title: const Text(
          'Riwayat Waris',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontFamily: 'Hermeneus One',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          int reversedIndex =
              history.length - 1 - index; // Hitung indeks terbalik
          Map<String, dynamic> historyItem = history[reversedIndex];
          double totalHarta = historyItem['totalHarta'] ?? 0;

          // Misalnya waktu pembuatan historyItem tersimpan dengan key 'createdAt'
          DateTime createdAt = historyItem['createdAt'] ?? DateTime.now();
          String formattedDate = DateFormat('dd MMMM yyyy').format(createdAt);
          String timeAgoText = timeAgo(createdAt);

          // Tampilkan setiap item history sebagai card atau list tile
          return Card(
            elevation: 5, // Ketinggian shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bentuk border kotak
            ),
            margin: const EdgeInsets.symmetric(
                vertical: 5, horizontal: 17), // Jarak dari tepi layar
            child: Container(
              width: double.infinity, // Lebar kotak mengikuti lebar layar
              padding: const EdgeInsets.all(20), // Jarak konten dari tepi kotak
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang kotak
                borderRadius: BorderRadius.circular(10), // Bentuk border kotak
                border: Border.all(
                  color: kPrimaryColor, // Warna border
                  width: 2, // Ketebalan border
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '$formattedDate ($timeAgoText)'), // Tampilkan waktu dengan format yang telah diatur
                    Text('Hasil Hitung Ke-${reversedIndex + 1}')
                  ],
                ),
                subtitle: Text('Total Harta: $totalHarta'),
                trailing: const Icon(Icons
                    .arrow_forward_ios_outlined), // Icon tanda panah ke arah kanan
                onTap: () {
                  // Tampilkan detail history ketika item history ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HistoryDetailPage(history[reversedIndex]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class HistoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> historyItem;

  const HistoryDetailPage(this.historyItem, {super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> filterwaris = historyItem['filteredInheritance'] ?? {};
    Map<String, dynamic> hasil = historyItem['hasil'] ?? {};
    Map<String, dynamic> pecahan = historyItem['pecahan'] ?? {};
    Map<String, dynamic> jelas = historyItem['jelas'] ?? {};
    Map<String, dynamic> terhalang = historyItem['terhalangSeleksi'] ?? {};

    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Set to your desired locale
      symbol: 'Rp', // Currency symbol
      decimalDigits: 2, // Number of decimal places
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10), // Tambahkan jarak dengan AppBar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Harta yang Dibagikan:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    currencyFormatter.format(historyItem['totalHarta']),
                    style: const TextStyle(fontSize: 18),
                  ),
                  Tooltip(
                    message: 'Harta yang dibagikan sudah dikurangi oleh hutang',
                    child: IconButton(
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        // Handle share button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              width: 20,
            ), // Tambahkan jarak dengan teks di bawahnya
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor, width: 1),
                ),
                child: DataTable(
                  dataTextStyle: const TextStyle(fontFamily: 'Hermeneus One'),
                  columnSpacing: 10,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Ahli Waris',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Jumlah',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Siham',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Bagian',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  rows: filterwaris.keys.map((key) {
                    int value = filterwaris[key] ?? 0;
                    double value1 = hasil[key] ?? 0;
                    String value3 = pecahan[key] ?? '';
                    String value4 = jelas[key] ?? '';
                    return DataRow(cells: [
                      DataCell(Text(key, style: const TextStyle(fontSize: 12))),
                      DataCell(Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        '$value3',
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        currencyFormatter.format(value1),
                        style: const TextStyle(fontSize: 12),
                      )),
                    ]);
                  }).toList(),
                  border: TableBorder.all(
                    color: kPrimaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 10), // Tambahkan jarak dengan teks di bawahnya
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Detail Bagian Harta:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            // Tampilkan setiap value4 di bawah tabel
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: filterwaris.keys.map((key) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '$key =${jelas[key]}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
                height: 10), // Tambahkan jarak dengan teks di bawahnya
            Visibility(
              visible: terhalang.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ahli Waris Terhalang',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 20,
                  ), // Tambahkan jarak dengan teks di bawahnya
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kPrimaryColor, width: 1),
                      ),
                      child: DataTable(
                        dataTextStyle:
                            const TextStyle(fontFamily: 'Hermeneus One'),
                        columnSpacing: 10,
                        horizontalMargin: 10,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Terhalang',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Alasan',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        rows: terhalang.keys.map((key) {
                          String value5 = terhalang[key] ?? '';
                          return DataRow(cells: [
                            DataCell(Text(key,
                                style: const TextStyle(fontSize: 12))),
                            DataCell(Text(
                              value5.toString(),
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            )),
                          ]);
                        }).toList(),
                        border: TableBorder.all(
                          color: kPrimaryColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static String routeName = "/waris_screen";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, int> _inheritanceAmounts = {};
  List<dynamic> _inheritanceAmounts2 = [];
  String _gender = '';
  double _totalAssets = 0.0;
  double _totalDebts = 0.0;
  List<String> daftarAhliWarisFiltered = [];
  List<String> penjelasanFiltered = [];
  List<dynamic> ahoy = [];
  final _assetsController =
      TextEditingController(); // Controller untuk total assets
  final _debtsController =
      TextEditingController(); // Controller untuk total debts
  final TextEditingController _wasiatController = TextEditingController();

  double _totalWasiat = 0.0;
  String? _wasiatError;
  @override
  void initState() {
    super.initState();
    _assetsController.addListener(_updateTotalAssets);
    _debtsController.addListener(_updateTotalDebts);
  }

  @override
  void dispose() {
    _assetsController.dispose();
    _debtsController.dispose();
    super.dispose();
  }

  void _updateTotalAssets() {
    setState(() {
      _totalAssets =
          double.tryParse(_assetsController.text.replaceAll(',', '')) ?? 0.0;
      _assetsController.value = _assetsController.value.copyWith(
        text: NumberFormat("#,##0", "en_US").format(_totalAssets),
        selection: TextSelection.fromPosition(
          TextPosition(offset: _assetsController.text.length),
        ),
      );
    });
  }

  void _updateTotalDebts() {
    setState(() {
      _totalDebts =
          double.tryParse(_debtsController.text.replaceAll(',', '')) ?? 0.0;
      _debtsController.value = _debtsController.value.copyWith(
        text: NumberFormat("#,##0", "en_US").format(_totalDebts),
        selection: TextSelection.fromPosition(
          TextPosition(offset: _debtsController.text.length),
        ),
      );
    });
  }

  void _updateTotalWasiat() {
    setState(() {
      _totalWasiat =
          double.tryParse(_wasiatController.text.replaceAll(',', '')) ?? 0.0;
      if (_totalWasiat > (_totalAssets / 3)) {
        _wasiatError = 'Wasiat tidak boleh lebih dari 1/3 dari total harta';
      } else {
        _wasiatError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Kalkulator Waris',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontFamily: 'Hermeneus One',
                fontWeight: FontWeight.w400)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jenis Kelamin Mayit:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hermeneus One'),
              ),
              Row(
                children: [
                  Radio(
                    value: 'L',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                        // Filter daftar ahli waris berdasarkan jenis kelamin mayit
                        penjelasan1;
                        penjelasan2;
                        if (_gender == 'L') {
                          daftarAhliWarisFiltered = daftarAhliWaris
                              .where((element) => element != 'Suami')
                              .toList();
                          penjelasanFiltered = penjelasan2;
                        } else {
                          daftarAhliWarisFiltered = daftarAhliWaris
                              .where((element) => element != 'Istri')
                              .toList();
                          penjelasanFiltered = penjelasan1;
                        }
                      });
                    },
                  ),
                  const Text('Laki-laki'),
                  Radio(
                    value: 'P',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                        // Filter daftar ahli waris berdasarkan jenis kelamin mayit
                        penjelasan1;
                        penjelasan2;
                        if (_gender == 'L') {
                          daftarAhliWarisFiltered = daftarAhliWaris
                              .where((element) => element != 'Suami')
                              .toList();
                          penjelasanFiltered = penjelasan2;
                        } else {
                          daftarAhliWarisFiltered = daftarAhliWaris
                              .where((element) => element != 'Istri')
                              .toList();
                          penjelasanFiltered = penjelasan1;
                        }
                      });
                    },
                  ),
                  const Text('Perempuan'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Daftar Ahli Waris:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List<Widget>.generate(
                  daftarAhliWarisFiltered.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Tooltip(
                            message: penjelasanFiltered[index],
                            child: IconButton(
                              icon: const Icon(
                                Icons.info_outline_rounded,
                                color: Colors.black,
                                size: 15,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: Text(
                              daftarAhliWarisFiltered[index],
                              style: const TextStyle(
                                  fontSize: 13, fontFamily: 'Roboto Mono'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            onPressed: () {
                              setState(() {
                                String ahliWaris =
                                    daftarAhliWarisFiltered[index];
                                if (_inheritanceAmounts[ahliWaris] != null &&
                                    _inheritanceAmounts[ahliWaris]! > 0) {
                                  if (ahliWaris == 'Suami' ||
                                      ahliWaris == 'Bapak' ||
                                      ahliWaris == 'Ibu' ||
                                      ahliWaris == 'Kakek' ||
                                      ahliWaris == 'Nenek dari ibu' ||
                                      ahliWaris == 'Nenek dari bapak') {
                                    if (ahliWaris == 'Kakek') {
                                      if (_inheritanceAmounts[ahliWaris]! > 0 &&
                                          _inheritanceAmounts[ahliWaris]! <=
                                              2) {
                                        _inheritanceAmounts[ahliWaris] =
                                            _inheritanceAmounts[ahliWaris]! - 1;
                                      }
                                    } else {
                                      if (_inheritanceAmounts[ahliWaris]! > 0) {
                                        _inheritanceAmounts[ahliWaris] =
                                            _inheritanceAmounts[ahliWaris]! - 1;
                                      }
                                    }
                                  } else {
                                    _inheritanceAmounts[ahliWaris] =
                                        _inheritanceAmounts[ahliWaris]! - 1;
                                  }
                                  if (_inheritanceAmounts[ahliWaris] == 0) {
                                    _inheritanceAmounts.remove(ahliWaris);
                                  }
                                }
                              });
                            },
                          ),
                          Text(
                            _inheritanceAmounts[daftarAhliWarisFiltered[index]]
                                    ?.toString() ??
                                '0',
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 15,
                            ),
                            onPressed: () {
                              setState(() {
                                if (daftarAhliWarisFiltered[index] == 'Suami' ||
                                    daftarAhliWarisFiltered[index] == 'Bapak' ||
                                    daftarAhliWarisFiltered[index] == 'Ibu' ||
                                    daftarAhliWarisFiltered[index] == 'Kakek' ||
                                    daftarAhliWarisFiltered[index] ==
                                        'Nenek dari ibu' ||
                                    daftarAhliWarisFiltered[index] ==
                                        'Nenek dari bapak') {
                                  if (daftarAhliWarisFiltered[index] ==
                                      'Kakek') {
                                    if ((_inheritanceAmounts[
                                                daftarAhliWarisFiltered[
                                                    index]] ??
                                            0) <
                                        2) {
                                      _inheritanceAmounts[
                                              daftarAhliWarisFiltered[index]] =
                                          (_inheritanceAmounts[
                                                      daftarAhliWarisFiltered[
                                                          index]] ??
                                                  0) +
                                              1;
                                    }
                                  } else {
                                    if ((_inheritanceAmounts[
                                                daftarAhliWarisFiltered[
                                                    index]] ??
                                            0) <
                                        1) {
                                      _inheritanceAmounts[
                                              daftarAhliWarisFiltered[index]] =
                                          (_inheritanceAmounts[
                                                      daftarAhliWarisFiltered[
                                                          index]] ??
                                                  0) +
                                              1;
                                    }
                                  }
                                } else {
                                  _inheritanceAmounts[daftarAhliWarisFiltered[
                                      index]] = (_inheritanceAmounts[
                                              daftarAhliWarisFiltered[index]] ??
                                          0) +
                                      1;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _assetsController,
                decoration: const InputDecoration(
                  labelText: 'Total Harta Mayit (Rupiah)',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                  suffixIcon: Tooltip(
                    message:
                        'Semua harta kekayaan yang ditinggalkan oleh orang yang meninggal dunia dan sudah diuangkan',
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _totalAssets =
                        double.tryParse(value.replaceAll(',', '')) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller:
                    _wasiatController, // Ganti dengan controller yang tepat
                decoration: const InputDecoration(
                  labelText: 'Total Wasiat Mayit (Rupiah)',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                  suffixIcon: Tooltip(
                    message:
                        'Wasiat ini tidak boleh lebih dari 1/3 dari total harta Mayit',
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    double totalAssets = _totalAssets;
                    double totalWasiat =
                        double.tryParse(value.replaceAll(',', '')) ?? 0.0;

                    if (totalWasiat > totalAssets / 3) {
                      // Jika nilai exceeds 1/3 dari total harta
                      _wasiatError =
                          'Nominal tidak boleh lebih dari 1/3 dari total harta Mayit';
                      // Tampilkan pesan error atau lakukan tindakan lain sesuai kebutuhan
                    } else {
                      _wasiatError = null;
                    }

                    _totalWasiat = totalWasiat;
                    _wasiatController.value = _wasiatController.value.copyWith(
                      text: NumberFormat("#,##0", "en_US").format(_totalWasiat),
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: _wasiatController.text.length),
                      ),
                    );
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _debtsController,
                decoration: const InputDecoration(
                  labelText: 'Total Hutang Mayit (Rupiah)',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                  suffixIcon: Tooltip(
                    message:
                        'Hutang ini meliputi uang milik orang lain yang telah ditentukan dan biaya pemakaman jenazah',
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _totalDebts =
                        double.tryParse(value.replaceAll(',', '')) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validasi: cek apakah _totalWasiat lebih dari 1/3 dari _totalAssets
                    if (_totalWasiat > _totalAssets / 3) {
                      // Tampilkan pesan kesalahan
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Nominal Wasiat tidak boleh lebih dari 1/3 dari total harta Mayit'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return; // Hentikan eksekusi lebih lanjut
                    }

                    // Lanjutkan dengan perhitungan jika validasi berhasil
                    if (_gender == 'L') {
                      _inheritanceAmounts = Map.fromEntries(_inheritanceAmounts
                          .entries
                          .where((element) => element.key != 'Suami'));
                    } else {
                      _inheritanceAmounts = Map.fromEntries(_inheritanceAmounts
                          .entries
                          .where((element) => element.key != 'Istri'));
                    }
                    _inheritanceAmounts2 =
                        jumlahnyaAhliWaris(_inheritanceAmounts);
                    Map<String, int> hasilseleksi = _inheritanceAmounts2[0];
                    Map<String, String> terhalangSeleksi =
                        _inheritanceAmounts2[1];

                    ahoy = pembagianWaris(
                        _totalAssets, _totalDebts, _totalWasiat, hasilseleksi);
                    Map<String, double> hasil = ahoy[1];
                    Map<String, String> pecahan = ahoy[0];
                    Map<String, String> jelas = ahoy[2];
                    double totalHarta =
                        _totalAssets - _totalDebts - _totalWasiat;
                    Map<String, int> filteredInheritance = {};
                    hasilseleksi.forEach((key, value) {
                      if (value > 0) {
                        filteredInheritance[key] = value;
                      }
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          totalHarta: totalHarta,
                          filteredInheritance: filteredInheritance,
                          hasil: hasil,
                          pecahan: pecahan,
                          jelas: jelas,
                          terhalangSeleksi: terhalangSeleksi,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      alignment: Alignment.center),
                  child: const Text('Hitung Pembagian Harta Waris',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto Mono')),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

// Daftar ahli waris sesuai dengan hukum Islam
List<String> daftarAhliWaris = [
  'Suami',
  'Istri',
  'Bapak',
  'Ibu',
  'Kakek',
  'Nenek',
  'Anak Laki-laki',
  'Anak Perempuan',
  'Cucu Laki-laki',
  'Cucu Perempuan dari Anak Laki-laki',
  'Saudara Laki-laki Sekandung',
  'Saudari Sekandung',
  'Saudara Laki-laki Sebapak',
  'Saudari Sebapak',
  'Saudara Laki-laki Seibu',
  'Saudari Seibu',
  'Anak Laki-laki dari Saudara Laki-laki Sekandung',
  'Anak Laki-laki dari Saudara Laki-laki Sebapak',
  'Paman Sekandung',
  'Paman Sebapak',
  'Anak dari Paman Laki-laki Sekandung',
  'Anak dari Paman Laki-laki Sebapak',
  'Laki-laki yang Memerdekakan Budak',
  'Wanita yang Memerdekakan Budak',
];

// Daftar penjelasan sesuai dengan urutan List<String> daftarAhliWaris
List<String> penjelasan1 = [
  'Laki Laki yang terikat dengan Mayit dikarenakan pernikahan',
  'Ayah Mayit yang masih hidup dan berhak mewarisi harta.',
  'Ibu Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Kakek Mayit yang masih hidup dan dapat menerima bagian warisan.',
  'Nenek Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Anak laki-laki Mayit yang masih hidup dan berhak menerima warisan.',
  'Anak perempuan Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Anak laki-laki dari anak Mayit yang sudah meninggal.',
  'Anak perempuan dari anak laki-laki Mayit yang telah meninggal.',
  'Saudara laki-laki Mayit yang memiliki kedua orang tua yang sama.',
  'Saudari Mayit yang memiliki kedua orang tua yang sama.',
  'Saudara laki-laki Mayit yang hanya memiliki ayah yang sama.',
  'Saudari Mayit yang hanya memiliki ayah yang sama.',
  'Saudara laki-laki Mayit yang hanya memiliki ibu yang sama.',
  'Saudari Mayit yang hanya memiliki ibu yang sama.',
  'Anak laki-laki dari saudara laki-laki Mayit yang memiliki kedua orang tua yang sama.',
  'Anak laki-laki dari saudara laki-laki Mayit yang hanya memiliki ayah yang sama.',
  'Paman Mayit yang merupakan saudara dari ayah dan memiliki kakek yang sama.',
  'Paman Mayit yang merupakan saudara dari ayah namun memiliki kakek yang berbeda.',
  'Anak dari saudara laki-laki Mayit yang merupakan saudara dari ayah dan memiliki kakek yang sama.',
  'Anak dari saudara laki-laki Mayit yang merupakan saudara dari ayah namun memiliki kakek yang berbeda.',
  'Laki-laki yang memerdekakan budak dan diakui sebagai ahli waris Mayit.',
  'Wanita yang memerdekakan budak dan diakui sebagai ahli waris Mayit.',
];

List<String> penjelasan2 = [
  'Perempuan yang terikat dengan Mayit dikarenakan pernikahan.',
  'Ayah Mayit yang masih hidup dan berhak mewarisi harta.',
  'Ibu Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Kakek Mayit yang masih hidup dan dapat menerima bagian warisan.',
  'Nenek Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Anak laki-laki Mayit yang masih hidup dan berhak menerima warisan.',
  'Anak perempuan Mayit yang masih hidup dan memiliki bagian dalam pewarisan harta.',
  'Anak laki-laki dari anak Mayit yang sudah meninggal.',
  'Anak perempuan dari anak laki-laki Mayit yang telah meninggal.',
  'Saudara laki-laki Mayit yang memiliki kedua orang tua yang sama.',
  'Saudari Mayit yang memiliki kedua orang tua yang sama.',
  'Saudara laki-laki Mayit yang hanya memiliki ayah yang sama.',
  'Saudari Mayit yang hanya memiliki ayah yang sama.',
  'Saudara laki-laki Mayit yang hanya memiliki ibu yang sama.',
  'Saudari Mayit yang hanya memiliki ibu yang sama.',
  'Anak laki-laki dari saudara laki-laki Mayit yang memiliki kedua orang tua yang sama.',
  'Anak laki-laki dari saudara laki-laki Mayit yang hanya memiliki ayah yang sama.',
  'Paman Mayit yang merupakan saudara dari ayah dan memiliki kakek yang sama.',
  'Paman Mayit yang merupakan saudara dari ayah namun memiliki kakek yang berbeda.',
  'Anak dari saudara laki-laki Mayit yang merupakan saudara dari ayah dan memiliki kakek yang sama.',
  'Anak dari saudara laki-laki Mayit yang merupakan saudara dari ayah namun memiliki kakek yang berbeda.',
  'Laki-laki yang memerdekakan budak dan diakui sebagai ahli waris Mayit.',
  'Wanita yang memerdekakan budak dan diakui sebagai ahli waris Mayit.',
];
