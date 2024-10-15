import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login2/components/zakat/hargaEmas.dart';
import 'hargaPerak.dart';
import 'package:login2/components/zakat/history.dart';

List<Map<String, dynamic>> globalHistory = [];

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});
  static String routeName = "/zakat_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF3D0C01), // Ubah warna latar belakang AppBar
        title: const Text(
          'Menu Utama',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna ikon back menjadi putih
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(history: globalHistory)),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                foregroundColor:
                    const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              ),
              onPressed: () {
                Navigator.pushNamed(context, ZakatFitrahPage.routeName);
              },
              child: const Text(
                'Kalkulator Zakat Fitrah',
                style:
                    TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                foregroundColor:
                    const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              ),
              onPressed: () {
                Navigator.pushNamed(context, ZakatMaalMenuPage.routeName);
              },
              child: const Text(
                'Kalkulator Zakat Maal',
                style:
                    TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ZakatMaalMenuPage extends StatelessWidget {
  const ZakatMaalMenuPage({super.key});
  static String routeName = "/zakatmaal_page";

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showZakatMaalNotification(context);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF3D0C01), // Ubah warna latar belakang AppBar
        title: const Text(
          'Menu Zakat Maal',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna ikon back menjadi putih
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatIncomePage.routeName);
            },
            child: const Text('Zakat Penghasilan'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatTambakPage.routeName);
            },
            child: const Text('Zakat Tambak'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatPerdaganganPage.routeName);
            },
            child: const Text('Zakat Perdagangan', textAlign: TextAlign.center),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatPeternakanPage.routeName);
            },
            child: const Text('Zakat Peternakan', textAlign: TextAlign.center),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatPerusahaanPage.routeName);
            },
            child: const Text('Zakat Perusahaan'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatRikazPage.routeName);
            },
            child: const Text('Zakat Rikaz'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatPertanianPage.routeName);
            },
            child: const Text('Zakat Pertanian'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
              foregroundColor:
                  const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
              textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ZakatEmasPerakPage.routeName);
            },
            child: const Text('Zakat Emas dan Perak'),
          ),
        ],
      ),
    );
  }

  void _showZakatMaalNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Harap Diperhatikan',
            style: TextStyle(fontFamily: 'RobotoMonoBold'),
          ),
          content: const Text(
            'Seluruh jenis zakat maal (kecuali zakat rikaz) memiliki haul satu tahun hijriyah atau 12 (dua belas) bulan qomariyah, yang artinya jika harta anda sudah menyimpan harta itu selama satu tahun maka anda diwajibkan untuk menunaikan zakat tetapi jika belum maka tidak diwajibkan untuk menunaikan zakat.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ZakatIncomePage extends StatefulWidget {
  const ZakatIncomePage({super.key});
  static String routeName = "/zakatincome_page";

  @override
  _ZakatIncomePageState createState() => _ZakatIncomePageState();
}

class _ZakatIncomePageState extends State<ZakatIncomePage> {
  final TextEditingController _incomeController = TextEditingController();
  double _zakatIncome = 0;
  double _hargaEmasAntam = 0;

  @override
  void initState() {
    super.initState();
    _fetchHargaEmas();
  }

  Future<void> _fetchHargaEmas() async {
    try {
      double hargaEmas = await fetchGoldBuyPrice();
      if (mounted) {
        setState(() {
          _hargaEmasAntam = hargaEmas;
        });
      }
    } catch (e) {
      print('Failed to fetch gold price: $e');
    }
  }

  void _calculateZakatIncome(double amount) {
    setState(() {
      _zakatIncome = amount * 0.025; // Perhitungan tahunan
      globalHistory.add({
        'type': 'Zakat Penghasilan',
        'amount': amount,
        'zakat': _zakatIncome,
        'date': DateTime.now(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double nisab = _hargaEmasAntam * 85;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Penghasilan',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(history: globalHistory)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Masukan Penghasilan per Tahun.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Jumlah Penghasilan',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                onChanged: (value) {
                  setState(() {
                    value = value.replaceAll('.', '');
                    _incomeController.text = NumberFormat.decimalPattern('id')
                        .format(int.tryParse(value) ?? 0);
                    _incomeController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _incomeController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D0C01),
                  foregroundColor: const Color(0xFFFFFFFF),
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: () {
                  double income = double.tryParse(
                          _incomeController.text.replaceAll('.', '')) ??
                      0;
                  if (income < nisab) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Pemberitahuan'),
                          content: const Text(
                              'Penghasilan Anda kurang dari nisab, jadi tidak perlu membayar zakat.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    _calculateZakatIncome(income);
                  }
                },
                child: const Text('Hitung Zakat Penghasilan'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Text(
                      'Jumlah Zakat Penghasilan yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatIncome)}',
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Perhitungan:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Penghasilan x 2.5%',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nisab:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '20 dinar atau setara dengan 85 gram emas = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(nisab)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZakatFitrahPage extends StatefulWidget {
  static String routeName = "/zakatfitrah_page";

  const ZakatFitrahPage({super.key});
  @override
  _ZakatFitrahPageState createState() => _ZakatFitrahPageState();
}

class _ZakatFitrahPageState extends State<ZakatFitrahPage> {
  final TextEditingController _necessitiesController = TextEditingController();
  final TextEditingController _pricePerKgController = TextEditingController();
  double _zakatNecessities = 0;

  void _calculateZakatNecessities(double pricePerKg, double numberOfPeople) {
    setState(() {
      _zakatNecessities = pricePerKg * (numberOfPeople * 2.8);
      globalHistory.add({
        'type': 'Zakat Fitrah',
        'pricePerKg': pricePerKg,
        'numberOfPeople': numberOfPeople,
        'zakat': _zakatNecessities,
        'date': DateTime.now(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Fitrah',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna ikon back menjadi putih
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _necessitiesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Orang yang Membayar Zakat Fitrah',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _pricePerKgController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga Beras per Kg',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                foregroundColor:
                    const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
                textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
              ),
              onPressed: () {
                double pricePerKg =
                    double.tryParse(_pricePerKgController.text) ?? 0;
                double numberOfPeople =
                    double.tryParse(_necessitiesController.text) ?? 0;
                _calculateZakatNecessities(pricePerKg, numberOfPeople);
              },
              child: const Text('Hitung Zakat Fitrah'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Jumlah Keseluruhan Zakat Fitrah yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatNecessities)}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ZakatTambakPage extends StatefulWidget {
  static String routeName = "/zakattambak_page";

  const ZakatTambakPage({super.key});
  @override
  _ZakatTambakPageState createState() => _ZakatTambakPageState();
}

class _ZakatTambakPageState extends State<ZakatTambakPage> {
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _keuntunganController = TextEditingController();
  double _zakatTambak = 0;
  double _hargaEmasAntam = 0;

  @override
  void initState() {
    super.initState();
    _fetchHargaEmas();
  }

  Future<void> _fetchHargaEmas() async {
    try {
      double hargaEmas = await fetchGoldBuyPrice();
      if (mounted) {
        setState(() {
          _hargaEmasAntam = hargaEmas;
        });
      }
    } catch (e) {
      print('Failed to fetch gold price: $e');
    }
  }

  void _calculateZakatTambak(double modal, double keuntungan) {
    setState(() {
      if (modal + keuntungan < _hargaEmasAntam * 85) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Pemberitahuan'),
              content: const Text(
                'Total modal dan keuntungan Anda kurang dari nisab, jadi tidak perlu membayar zakat.',
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        _zakatTambak = 0;
      } else {
        _zakatTambak = (modal + keuntungan) * 0.025;
        globalHistory.add({
          'type': 'Zakat Tambak',
          'modal': modal,
          'keuntungan': keuntungan,
          'zakat': _zakatTambak,
          'date': DateTime.now(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double nisab = _hargaEmasAntam * 85;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Tambak',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _modalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Modal Usaha',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _keuntunganController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Keuntungan Usaha',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                foregroundColor:
                    const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
                textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
              ),
              onPressed: () {
                double modal = double.tryParse(_modalController.text) ?? 0;
                double keuntungan =
                    double.tryParse(_keuntunganController.text) ?? 0;
                _calculateZakatTambak(modal, keuntungan);
              },
              child: const Text('Hitung Zakat Tambak'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Jumlah Zakat Tambak yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatTambak)}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Perhitungan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '2.5% x (Modal + Keuntungan Usaha)',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nisab:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '20 dinar atau setara dengan 85 gram emas = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(nisab)}',
                    style: const TextStyle(fontSize: 14),
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

class ZakatPerdaganganPage extends StatefulWidget {
  static String routeName = "/zakatdagang_page";

  const ZakatPerdaganganPage({super.key});
  @override
  _ZakatPerdaganganPageState createState() => _ZakatPerdaganganPageState();
}

class _ZakatPerdaganganPageState extends State<ZakatPerdaganganPage> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _profitController = TextEditingController();
  final TextEditingController _debtController = TextEditingController();
  double _zakatPerdagangan = 0;
  double _hargaEmasAntam = 0;

  @override
  void initState() {
    super.initState();
    _fetchHargaEmas();
  }

  Future<void> _fetchHargaEmas() async {
    try {
      double hargaEmas = await fetchGoldBuyPrice();
      if (mounted) {
        setState(() {
          _hargaEmasAntam = hargaEmas;
        });
      }
    } catch (e) {
      print('Failed to fetch gold price: $e');
    }
  }

  void _calculateZakatPerdagangan(double capital, double profit, double debt) {
    double totalAssets = capital + profit - debt;
    setState(() {
      if (totalAssets < _hargaEmasAntam * 85) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Pemberitahuan'),
              content: const Text(
                'Total aset Anda kurang dari nisab, jadi tidak perlu membayar zakat.',
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        _zakatPerdagangan = 0;
      } else {
        _zakatPerdagangan = totalAssets * 0.025;
        globalHistory.add({
          'type': 'Zakat Perdagangan',
          'capital': capital,
          'profit': profit,
          'debt': debt,
          'zakat': _zakatPerdagangan,
          'date': DateTime.now(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Perdagangan',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _capitalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Modal',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                onChanged: (value) {
                  setState(() {
                    value = value.replaceAll('.', '');
                    _capitalController.text = NumberFormat.decimalPattern('id')
                        .format(int.tryParse(value) ?? 0);
                    _capitalController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _capitalController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _profitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Keuntungan',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                onChanged: (value) {
                  setState(() {
                    value = value.replaceAll('.', '');
                    _profitController.text = NumberFormat.decimalPattern('id')
                        .format(int.tryParse(value) ?? 0);
                    _profitController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _profitController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _debtController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Hutang',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                onChanged: (value) {
                  setState(() {
                    value = value.replaceAll('.', '');
                    _debtController.text = NumberFormat.decimalPattern('id')
                        .format(int.tryParse(value) ?? 0);
                    _debtController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _debtController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D0C01),
                  foregroundColor: const Color(0xFFFFFFFF),
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: () {
                  double capital = double.tryParse(
                          _capitalController.text.replaceAll('.', '')) ??
                      0;
                  double profit = double.tryParse(
                          _profitController.text.replaceAll('.', '')) ??
                      0;
                  double debt = double.tryParse(
                          _debtController.text.replaceAll('.', '')) ??
                      0;
                  _calculateZakatPerdagangan(capital, profit, debt);
                },
                child: const Text('Hitung Zakat Perdagangan'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Text(
                      'Jumlah Zakat Perdagangan yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatPerdagangan)}',
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Perhitungan:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '(Modal + Keuntungan - Hutang) x 2.5%',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nisab:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '20 dinar atau setara dengan 85 gram emas = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_hargaEmasAntam * 85)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZakatPeternakanPage extends StatefulWidget {
  const ZakatPeternakanPage({super.key});
  static String routeName = "/zakatternak_page";

  @override
  _ZakatPeternakanPageState createState() => _ZakatPeternakanPageState();
}

class _ZakatPeternakanPageState extends State<ZakatPeternakanPage> {
  final TextEditingController _goatController = TextEditingController();
  final TextEditingController _cowController = TextEditingController();
  String _zakatGoat = '';
  String _zakatCow = '';

  void _calculateZakatGoat(int goats) {
    if (goats >= 40 && goats <= 120) {
      _zakatGoat = '1 ekor kambing jantan atau betina umur 2 tahun';
    } else if (goats >= 121 && goats <= 200) {
      _zakatGoat = '2 ekor kambing jantan atau betina umur 2 tahun';
    } else if (goats >= 201 && goats <= 300) {
      _zakatGoat = '3 ekor kambing jantan atau betina umur 2 tahun';
    } else if (goats > 300) {
      int additionalGoats = (goats - 300) ~/ 100;
      _zakatGoat =
          '${3 + additionalGoats} ekor kambing jantan atau betina umur 2 tahun';
    } else {
      _zakatGoat = 'Tidak diwajibkan melakukan zakat';
    }
  }

  void _calculateZakatCow(int cows) {
    if (cows >= 30 && cows <= 39) {
      _zakatCow = '1 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else if (cows >= 40 && cows <= 59) {
      _zakatCow = '1 ekor anak sapi betina berumur 2 tahun';
    } else if (cows >= 60 && cows <= 69) {
      _zakatCow = '2 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else if (cows >= 70 && cows <= 79) {
      _zakatCow =
          '1 ekor sapi jantan atau betina berumur 2 tahun dan 1 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else if (cows >= 80 && cows <= 89) {
      _zakatCow = '2 ekor sapi jantan atau betina berumur 2 tahun';
    } else if (cows >= 90 && cows <= 99) {
      _zakatCow = '3 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else if (cows >= 100 && cows <= 109) {
      _zakatCow = '2 ekor sapi jantan atau betina berumur 2 tahun';
    } else if (cows >= 110 && cows <= 119) {
      _zakatCow =
          '2 ekor sapi jantan atau betina berumur 2 tahun dan 1 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else if (cows >= 120 && cows <= 129) {
      _zakatCow =
          '3 ekor sapi jantan atau betina berumur 2 tahun atau 4 ekor anak sapi jantan atau betina berumur 1 tahun';
    } else {
      _zakatCow = 'Tidak diwajibkan melakukan zakat';
    }
  }

  void _calculateZakat() {
    int goats = int.tryParse(_goatController.text) ?? 0;
    int cows = int.tryParse(_cowController.text) ?? 0;

    setState(() {
      _calculateZakatGoat(goats);
      _calculateZakatCow(cows);
    });

    if (_zakatGoat != 'Tidak diwajibkan melakukan zakat') {
      globalHistory.add({
        'type': 'Zakat Kambing',
        'jumlah': goats,
        'zakat': _zakatGoat,
        'date': DateTime.now(),
      });
    }

    if (_zakatCow != 'Tidak diwajibkan melakukan zakat') {
      globalHistory.add({
        'type': 'Zakat Sapi',
        'jumlah': cows,
        'zakat': _zakatCow,
        'date': DateTime.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Peternakan',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(history: globalHistory)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 5),
              // Tambahkan SizedBox untuk memberikan jarak di bagian atas
              TextField(
                controller: _goatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText:
                      'Jumlah Kambing yang Telah mencapai usia produktif',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _cowController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Sapi yang Telah mencapai usia produktif',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D0C01),
                  foregroundColor: const Color(0xFFFFFFFF),
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: _calculateZakat,
                child: const Text('Hitung Zakat Peternakan'),
              ),
              const SizedBox(height: 20),
              if (_zakatGoat.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Jumlah Zakat Kambing yang Harus Dibayar: $_zakatGoat',
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              if (_zakatCow.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Jumlah Zakat Sapi yang Harus Dibayar: $_zakatCow',
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'Nisab Zakat Ternak Kambing:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                '1. Berdasarkan jumlah ternak, nisab zakat untuk ternak kambing adalah 40 ekor. Jika seseorang memiliki 40 ekor kambing atau lebih maka dia wajib membayar zakat atas ternaknya.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '2. Perhitungan untuk zakat ternak kambing adalah sebagai berikut:',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah kambing 40-120 ekor dan telah mencapai haul (1 Tahun), kadar zakatnya adalah 1 ekor kambing (2 tahun) atau domba (1 tahun).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah kambing 121-200 ekor, haul 1 tahun, zakatnya 2 ekor (kambing/domba).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah kambing 201-300 ekor, haul 1 tahun, zakatnya 3 ekor (kambing/domba).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah kambing 301-400 ekor, haul 1 tahun, zakatnya 4 ekor (kambing/domba).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah kambing 401-500 ekor, haul 1 tahun, zakatnya 5 ekor (kambing/domba).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Selanjutnya, setiap jumlah bertambah 100 ekor, maka zakatnya bertambah 1 ekor.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '3. Berdasarkan bobot ternak, nisab zakat kambing adalah setara dengan 612,36 kg (berdasarkan pendapat mayoritas ulama). Jika total bobot daging kambing yang dimiliki mencapai atau melebihi nisab tersebut, maka zakat wajib dibayarkan.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                'Hadis tentang Zakat Kambing:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Dari Abu Hurairah, ia berkata: Rasulullah SAW. bersabda, "Jika telah genap setahun dua kali maka wajib zakatnya seekor kambing betina," (HR. Bukhari dan Muslim).',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nisab Zakat Ternak Sapi:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                '1. Berdasarkan jumlah ternak, nisab zakat untuk sapi adalah 30 ekor. Jadi, jika seseorang memiliki 30 ekor sapi atau lebih, maka dia wajib membayar zakat atas ternaknya.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '2. Perhitungan untuk zakat ternak sapi atau kerbau adalah sebagai berikut:',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 30-39 ekor, haul 1 tahun, zakatnya 1 ekor sapi jantan/betina tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 40-59 ekor, haul 1 tahun, zakatnya 1 ekor sapi jantan/betina musinnah.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 60-69 ekor, haul 1 tahun, zakatnya 2 ekor sapi jantan/betina tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 70-79 ekor, haul 1 tahun, zakatnya 1 ekor sapi jantan/betina musinnah dan 1 ekor tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 80-89 ekor, haul 1 tahun, zakatnya 2 ekor sapi jantan/betina musinnah.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 90-99 ekor, haul 1 tahun, zakatnya 3 ekor sapi jantan/betina tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 100-109 ekor, haul 1 tahun, zakatnya 2 ekor sapi jantan/betina musinnah.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 110-119 ekor, haul 1 tahun, zakatnya 2 ekor sapi jantan/betina musinnah dan 1 ekor sapi jantan/betina tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Jumlah sapi 120-129 ekor, haul 1 tahun, zakatnya 3 ekor sapi jantan/betina musinnah atau 4 ekor sapi jantan/betina tabi’.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '  - Selanjutnya, setiap jumlah itu bertambah 30 ekor, zakatnya bertambah 1 ekor tabi’. Jika setiap jumlah itu bertambah 40 ekor, zakatnya bertambah 1 ekor musinnah.',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '3. Nisab zakat sapi berdasarkan bobot hewan ternak dapat berbeda-beda berdasarkan pendapat ulama. Namun umumnya, nisab zakat sapi berdasarkan bobot adalah setara 40 ekor kambing atau lebih, atau sekitar 612,36 kg (berdasarkan pendapat mayoritas ulama).',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '*Keterangan: (umur 1 tahun masuk ke 2 tahun)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tabi’: sapi berumur 1 tahun (masuk tahun ke-2)',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                'Musinnah: sapi berumur 2 tahun (masuk tahun ke-3)',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                'Hadis tentang Zakat Sapi:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Dari Abu Hurairah, ia berkata: Rasulullah SAW. bersabda, "Apabila kamu memiliki sapi kurban sebanyak tiga puluh ekor dan telah berlalu setahun dua kali, maka bagimu kewajiban mengeluarkan seekor sapi," (HR. Ahmad).',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZakatPerusahaanPage extends StatefulWidget {
  static String routeName = "/zakatperusahaan_page";

  const ZakatPerusahaanPage({super.key});
  @override
  _ZakatPerusahaanPageState createState() => _ZakatPerusahaanPageState();
}

class _ZakatPerusahaanPageState extends State<ZakatPerusahaanPage> {
  final TextEditingController _assetsController = TextEditingController();
  final TextEditingController _liabilitiesController = TextEditingController();
  double _zakatPerusahaan = 0;
  double _hargaEmasAntam = 0;

  @override
  void initState() {
    super.initState();
    _fetchHargaEmas();
  }

  Future<void> _fetchHargaEmas() async {
    try {
      double hargaEmas = await fetchGoldBuyPrice();
      if (mounted) {
        setState(() {
          _hargaEmasAntam = hargaEmas;
        });
      }
    } catch (e) {
      // Handle error if necessary
      print('Failed to fetch gold price: $e');
    }
  }

  void _calculateZakatPerusahaan(double assets, double liabilities) {
    double netAssets = assets - liabilities;
    if (netAssets < _hargaEmasAntam * 85) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pemberitahuan'),
            content: const Text(
              'Total aset setelah dikurangi hutang kurang dari nisab, jadi tidak perlu membayar zakat.',
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      setState(() {
        _zakatPerusahaan = 0;
      });
    } else {
      setState(() {
        _zakatPerusahaan = netAssets * 0.025;
        globalHistory.add({
          'type': 'Zakat Perusahaan',
          'assets': assets,
          'liabilities': liabilities,
          'zakat': _zakatPerusahaan,
          'date': DateTime.now(),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double nisab = _hargaEmasAntam * 85;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Perusahaan',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _assetsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nilai Aset Lancar',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _liabilitiesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Hutang Jangka Pendek',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                foregroundColor:
                    const Color(0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
                textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
              ),
              onPressed: () {
                double assets = double.tryParse(_assetsController.text) ?? 0;
                double liabilities =
                    double.tryParse(_liabilitiesController.text) ?? 0;
                _calculateZakatPerusahaan(assets, liabilities);
              },
              child: const Text('Hitung Zakat Perusahaan'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Jumlah Zakat Perusahaan yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatPerusahaan)}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Perhitungan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '2.5% x (Aset Lancar - Hutang Jangka Pendek)',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nisab:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '20 dinar atau setara dengan 85 gram emas = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(nisab)}',
                    style: const TextStyle(fontSize: 14),
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

class ZakatRikazPage extends StatefulWidget {
  static String routeName = "/zakatrikaz_page";

  const ZakatRikazPage({super.key});
  @override
  _ZakatRikazPageState createState() => _ZakatRikazPageState();
}

class _ZakatRikazPageState extends State<ZakatRikazPage> {
  final TextEditingController _incomeController = TextEditingController();
  double _zakatRikaz = 0;

  void _calculateZakatRikaz(double amount) {
    setState(() {
      _zakatRikaz = amount * 0.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Rikaz',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna ikon back menjadi putih
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Jumlah Harta Temuan',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                  foregroundColor: const Color(
                      0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: () {
                  double income = double.tryParse(_incomeController.text) ?? 0;
                  _calculateZakatRikaz(income);
                },
                child: const Text('Hitung Zakat Rikaz'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Jumlah Zakat Rikaz yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatRikaz)}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dalil Zakat Rikaz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Firman Allah SWT dalam Surah Al-Baqarah ayat 267:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                'يٰٓاَيُّهَا الَّذِيْنَ اٰمَنُوْٓا اَنْفِقُوْا مِنْ طَيِّبٰتِ مَا كَسَبْتُمْ وَمِمَّآ اَخْرَجْنَا لَكُمْ مِّنَ الْاَرْضِ ۗ وَلَا تَيَمَّمُوا الْخَبِيْثَ مِنْهُ تُنْفِقُوْنَ وَلَسْتُمْ بِاٰخِذِيْهِ اِلَّآ اَنْ تُغْمِضُوْا فِيْهِ ۗ وَاعْلَمُوْٓا اَنَّ اللّٰهَ غَنِيٌّ حَمِيْدٌ',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                'Artinya: "Wahai orang-orang yang beriman! Infakkanlah sebagian dari hasil usahamu yang baik-baik dan sebagian dari apa yang Kami keluarkan dari bumi untukmu. Janganlah kamu memilih yang buruk-buruk untuk kamu infakkan, padahal kamu sendiri tidak mau mengambilnya melainkan dengan memicingkan mata (enggan). Ketahuilah bahwa Allah Mahakaya, Maha Terpuji."',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Hadits tentang Zakat Rikaz:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Dari Abu Hurairah radhiyallahu ‘anhu, ia berkata bahwa Rasulullah shallallahu ‘alaihi wa sallam bersabda:',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 5),
              const Text(
                'وَفِي الرِّكَازِ الْخُمُسُ',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                'Artinya: "Dan pada harta rikaz ada kewajiban seperlima." (HR. Bukhari dan Muslim)',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZakatPertanianPage extends StatefulWidget {
  const ZakatPertanianPage({super.key});
  static String routeName = "/zakatpertanian_page";

  @override
  _ZakatPertanianPageState createState() => _ZakatPertanianPageState();
}

class _ZakatPertanianPageState extends State<ZakatPertanianPage> {
  final TextEditingController _harvestController = TextEditingController();
  final TextEditingController _pricePerKgController = TextEditingController();
  String _irrigationType = 'Irigasi';
  double _zakatPertanianKg = 0;
  double _zakatPertanianRp = 0;

  // Nisab dalam kilogram dan rupiah
  final double _nisabKg = 652.8; // 5 wasaq setara dengan 652.8 kg
  double _nisabRp =
      0; // Akan dihitung saat harga beras per kilogram sudah diperoleh

  @override
  void initState() {
    super.initState();
    _calculateNisab();
  }

  void _calculateNisab() {
    // Menyesuaikan dengan harga beras per kilogram
    // Misalnya harga beras per kilogram adalah 1000 rupiah
    double hargaBerasPerKg =
        1000; // Ganti dengan nilai sesuai data yang Anda miliki
    setState(() {
      _nisabRp = _nisabKg * hargaBerasPerKg;
    });
  }

  void _calculateZakatPertanian(
      double harvestKg, double pricePerKg, String irrigationType) {
    double percentage = irrigationType == 'Irigasi' ? 0.05 : 0.10;
    double zakatPertanianKg = harvestKg * percentage;
    double zakatPertanianRp = zakatPertanianKg * pricePerKg;

    setState(() {
      if (harvestKg < _nisabKg) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Pemberitahuan'),
              content: const Text(
                'Hasil panen Anda kurang dari nisab, jadi tidak perlu membayar zakat.',
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        _zakatPertanianKg = 0;
        _zakatPertanianRp = 0;
      } else {
        _zakatPertanianKg = zakatPertanianKg;
        _zakatPertanianRp = zakatPertanianRp;

        globalHistory.add({
          'type': 'Zakat Pertanian',
          'harvestKg': harvestKg,
          'pricePerKg': pricePerKg,
          'irrigationType': irrigationType,
          'zakatKg': zakatPertanianKg,
          'zakatRp': zakatPertanianRp,
          'date': DateTime.now(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Pertanian',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(history: globalHistory)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _harvestController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Hasil Panen (Kg)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pricePerKgController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga per Kg (Rp)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _irrigationType,
                onChanged: (String? newValue) {
                  setState(() {
                    _irrigationType = newValue!;
                  });
                },
                items: <String>['Irigasi', 'Hujan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D0C01),
                  foregroundColor: const Color(0xFFFFFFFF),
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: () {
                  double harvestKg =
                      double.tryParse(_harvestController.text) ?? 0;
                  double pricePerKg =
                      double.tryParse(_pricePerKgController.text) ?? 0;
                  _calculateZakatPertanian(
                      harvestKg, pricePerKg, _irrigationType);
                },
                child: const Text('Hitung Zakat'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jumlah Zakat Pertanian yang Harus Dibayar:',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${_zakatPertanianKg.toStringAsFixed(2)} Kg atau ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatPertanianRp)}',
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Ketentuan Nisab:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '5 wasaq atau setara dengan 652.8 kg atau ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_nisabRp)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZakatEmasPerakPage extends StatefulWidget {
  static String routeName = "/zakatemasperak_page";
  const ZakatEmasPerakPage({super.key});

  @override
  _ZakatEmasPerakPageState createState() => _ZakatEmasPerakPageState();
}

class _ZakatEmasPerakPageState extends State<ZakatEmasPerakPage> {
  final TextEditingController _goldController = TextEditingController();
  final TextEditingController _silverController = TextEditingController();
  double _zakatEmas = 0;
  double _zakatPerak = 0;
  double _hargaEmasAntam = 0;
  double _hargaPerak = 0;
  double _zakatEmasRupiah = 0;
  double _zakatPerakRupiah = 0;

  @override
  void initState() {
    super.initState();
    _fetchHargaLogam();
  }

  Future<void> _fetchHargaLogam() async {
    try {
      double hargaEmas = await fetchGoldBuyPrice();
      if (mounted) {
        setState(() {
          _hargaEmasAntam = hargaEmas;
        });
      }
    } catch (e) {
      // Handle error if necessary
      print('Failed to fetch gold price: $e');
    }

    double? hargaPerak = await fetchHargaPerak();
    if (hargaPerak != null) {
      setState(() {
        _hargaPerak = hargaPerak;
      });
    }
  }

  void _calculateZakatEmasPerak(double gold, double silver) {
    double zakatEmasGram = 0;
    double zakatPerakGram = 0;
    double zakatEmasRupiah = 0;
    double zakatPerakRupiah = 0;

    // Calculate zakat for gold if gold is provided
    if (gold > 0) {
      zakatEmasGram = gold >= 85 ? gold * 0.025 : 0;
      zakatEmasRupiah = zakatEmasGram * _hargaEmasAntam;
    }

    // Calculate zakat for silver if silver is provided
    if (silver > 0) {
      zakatPerakGram = silver >= 595 ? silver * 0.025 : 0;
      zakatPerakRupiah = zakatPerakGram * _hargaPerak;
    }

    setState(() {
      _zakatEmas = zakatEmasGram;
      _zakatPerak = zakatPerakGram;
      _zakatEmasRupiah = zakatEmasRupiah;
      _zakatPerakRupiah = zakatPerakRupiah;

      if (zakatEmasGram == 0 && zakatPerakGram == 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Pemberitahuan'),
              content: const Text(
                'Total emas atau perak Anda kurang dari nisab, jadi tidak perlu membayar zakat.',
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (zakatEmasGram > 0) {
          globalHistory.add({
            'type': 'Zakat Emas',
            'gold': gold,
            'zakat': zakatEmasRupiah,
            'date': DateTime.now(),
          });
        }

        if (zakatPerakGram > 0) {
          globalHistory.add({
            'type': 'Zakat Perak',
            'silver': silver,
            'zakat': zakatPerakRupiah,
            'date': DateTime.now(),
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double nisabEmas = _hargaEmasAntam * 85;
    double nisabPerak = _hargaPerak * 595;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0C01),
        title: const Text(
          'Kalkulator Zakat Emas & Perak',
          style: TextStyle(fontFamily: 'HermeneusOne', color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(history: globalHistory)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 5),
              TextField(
                controller: _goldController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Emas (gram)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _silverController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Perak (gram)',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xFF3D0C01), // Ubah warna tombol menjadi #3D0C01
                  foregroundColor: const Color(
                      0xFFFFFFFF), // Ubah warna teks menjadi #FFFFFF
                  textStyle: const TextStyle(fontFamily: 'HermeneusOne'),
                ),
                onPressed: () {
                  double gold = double.tryParse(_goldController.text) ?? 0;
                  double silver = double.tryParse(_silverController.text) ?? 0;
                  _calculateZakatEmasPerak(gold, silver);
                },
                child: const Text('Hitung Zakat Emas & Perak'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Jumlah Zakat Emas yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatEmasRupiah)}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Jumlah Zakat Perak yang Harus Dibayar: ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(_zakatPerakRupiah)}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nisab:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Nisab Emas: 85 gram = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(nisabEmas)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Nisab Perak: 595 gram = ${NumberFormat.currency(locale: 'id', symbol: 'Rp. ').format(nisabPerak)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dalil Zakat Emas & Perak',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Al-Quran Surat At-Taubah Ayat 34:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'وَٱلَّذِينَ يَكْنِزُونَ ٱلذَّهَبَ وَٱلْفِضَّةَ وَلَا يُنفِقُونَهَا فِى سَبِيلِ ٱللَّهِ فَبَشِّرْهُم بِعَذَابٍ أَلِيمٍ',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '“… Dan orang-orang yang menyimpan emas dan perak dan tidak menafkahkannya pada jalan Allah, maka beritahukanlah kepada mereka, (bahwa mereka akan mendapat) siksa yang pedih,”',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Hadits tentang Zakat Emas:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                'Dari Ali radhiyallahu ‘anhu, Rasulullah shallallahu ‘alaihi wa sallam bersabda: "Apabila engkau memiliki 200 dirham dan sudah cukup haulnya, maka zakatnya 5 dirham. Dan tidak ada kewajiban zakat pada harta sehingga mencapai 20 dinar. Jika engkau memiliki 20 dinar dan sudah cukup haulnya, maka zakatnya setengah dinar." (HR. Abu Dawud)',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
