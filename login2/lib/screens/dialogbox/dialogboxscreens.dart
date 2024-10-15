import 'dart:math';
import 'package:flutter/material.dart';
import 'package:login2/utils/constants.dart';

class DialoxBoxScreen extends StatelessWidget {
  DialoxBoxScreen({super.key});
  // static String routeName = "/dialog_box";
  final List<String> dailyTips = [
    "Ilmu waris merupakan pengetahuan tentang pembagian harta peninggalan dan ahli waris.",
    "Faktor-faktor seperti perbedaan agama, perbuatan membunuh, status budak, dan keberadaan ahli waris yang lebih berhak dapat menghalangi seseorang dari menerima warisan.",
    "Ilmu waris adalah bagian dari ilmu fiqh yang membahas pembagian harta waris sesuai dengan syariat Islam.",
    "Pembagian warisan dilakukan berdasarkan ketentuan yang telah ditetapkan dalam Al-Quran dan hadis, dengan tujuan untuk mewariskan harta dengan adil kepada ahli waris.",
    "Selain ahli waris yang telah disebutkan sebelumnya, terdapat juga ahli waris yang mendapat bagian tetap (fasl) seperti ibu, istri, dan suami.",
    "Pada kasus tertentu, hak waris bisa diperselisihkan dan perlu diselesaikan melalui proses hukum yang disebut taḥkīm (penyelesaian perselisihan).",
    "Ilmu waris melibatkan pembagian harta peninggalan secara adil dan sesuai syariat Islam.",
    "Sistem pewarisan dalam Islam menekankan keadilan dan keberpihakan terhadap ahli waris yang diatur dalam Al-Quran dan hadis.",
    "Pembagian harta waris dilakukan setelah terlebih dahulu melunasi hutang-hutang pewaris dan wasiat yang dibenarkan syariat.",
    "Dalam hukum Islam, terdapat prinsip bahwa sebagian harta pewaris dapat diwasiatkan, namun hanya sebagian kecil dari total harta waris.",
    "Zakat fitrah harus dikeluarkan sebelum Idul Fitri untuk membersihkan jiwa dari dosa-dosa kecil yang terjadi selama bulan Ramadhan.",
    "Zakat merupakan kewajiban bagi setiap Muslim yang telah mencapai nisab (batas minimum kepemilikan harta) untuk memberikan sebagian dari hartanya kepada yang membutuhkan.",
    "Zakat adalah salah satu rukun Islam yang bertujuan untuk membersihkan harta, membantu yang membutuhkan, dan terdiri dari berbagai jenis seperti zakat fitrah, zakat mal, dan zakat profesi.",
    "Nisab zakat berbeda-beda untuk setiap jenisnya, misalnya nisab emas dan perak adalah 20 dinar dan 200 dirham, sedangkan nisab penghasilan diukur dalam nilai emas atau perak atau berdasarkan harga beras.",
    "Zakat mal adalah zakat yang dikeluarkan dari harta yang telah mencapai nisab (batas minimum) dan telah dimiliki selama satu tahun.",
    "Zakat profesi adalah zakat yang dikeluarkan dari penghasilan tertentu, seperti pertanian, perdagangan, atau profesi lainnya, dengan besaran yang telah ditentukan.",
    "Islam dibangun di atas lima perkara termasuk menunaikan zakat. (HR. Bukhari dan Muslim).",
    "Sesungguhnya Allah telah memberikan hak kepada setiap yang berhak, maka tidak ada wasiat bagi ahli waris. (HR. Tirmidzi, Ibnu Majah).",
    "Allah mewajibkan zakat yang diambil dari orang-orang kaya dan diberikan kepada orang-orang miskin. (HR. Bukhari).",
    "Harta tidak akan berkurang karena sedekah (zakat). (HR. Muslim).",
    "Harta tidak akan berkurang karena sedekah (zakat). (HR. Muslim).",
    "Ambillah zakat dari sebagian harta mereka, dengan zakat itu kamu membersihkan dan mensucikan mereka. (QS. At-Taubah: 103).",
    "Sesungguhnya Allah telah menetapkan bagian zakat untuk orang miskin dan yang membutuhkan. (HR. Abu Dawud).",
    "Allah telah memberikan hak kepada setiap yang berhak, maka tidak ada wasiat bagi ahli waris. (HR. Tirmidzi, Ibnu Majah).",
    "Seorang mukmin tidak boleh mewariskan kepada orang kafir dan orang kafir tidak boleh mewariskan kepada seorang mukmin. (HR. Bukhari dan Muslim).",
    "Tidak boleh ada favoritisme dalam pembagian warisan, semua harus sesuai dengan ketentuan syariat. (HR. Bukhari).",
    "Sepertiga, dan sepertiga itu banyak atau besar. Lebih baik meninggalkan ahli warismu dalam keadaan kaya daripada miskin meminta-minta. (HR. Bukhari dan Muslim).",
    "Tidak ada hak bagi seorang ayah untuk mewasiatkan harta yang lebih besar kepada anak yang satu dan mengabaikan yang lain. (HR. An-Nasa'i).",
    "Berikanlah bagian kepada ahli waris yang berhak, anak perempuan berhak menerima setengah dari harta. (HR. Abu Dawud).",
    "Mulailah dengan diri sendiri dan keluargamu, kemudian jika ada yang tersisa, berikan kepada orang lain. (HR. Muslim).",
    "Tiga orang yang tidak akan diajak bicara oleh Allah pada hari kiamat: orang yang menyebut-nyebut pemberiannya, orang yang menjual barang dagangan dengan sumpah palsu, dan orang yang memanjangkan pakaiannya karena sombong. (HR. Muslim).",
    "Sedekah itu menghapus dosa sebagaimana air memadamkan api. (HR. Tirmidzi).",
    "Sedekah adalah bukti (keimanan). (HR. Muslim).",
    "Berikanlah bagian warisan kepada ahli waris yang berhak, dan sisanya diberikan kepada laki-laki yang paling dekat hubungannya dengan si mayit. (HR. Bukhari dan Muslim).",
    "Jika seseorang meninggal dunia dan tidak memiliki anak, maka bagian warisannya akan diberikan kepada cucunya jika ada. (HR. Abu Dawud).",
    "Istri yang ditinggal mati oleh suaminya berhak mendapatkan seperempat harta jika tidak ada anak, dan sepertiga jika ada anak. (HR. Muslim).",
    "Jika seseorang meninggal dan memiliki anak, ibunya mendapatkan seperenam dari harta warisan. (HR. Bukhari).",
    "Jika seseorang meninggal tanpa meninggalkan anak atau orang tua, saudara laki-laki atau perempuan berhak mendapatkan bagian dari harta warisan. (HR. Bukhari dan Muslim).",
    "Segera bagilah harta warisan di antara ahli waris sesuai dengan ketentuan Allah. (HR. Tirmidzi).",
    "Barang siapa yang menghindari pembayaran zakat dengan cara yang tidak sah, maka pada hari kiamat, zakat tersebut akan berubah menjadi ular berbisa yang melilit lehernya. (HR. Bukhari).",
    "Lindungilah hartamu dengan zakat, obatilah penyakitmu dengan sedekah, dan hadapilah gelombang cobaan dengan doa dan tawakal kepada Allah. (HR. Baihaqi).",
    "Sedekah adalah bukti syukur, dan tidak ada yang bersyukur kecuali orang yang bertakwa. (HR. Tirmidzi).",
    "Zakat hanya diberikan kepada delapan golongan: fakir, miskin, amil zakat, muallaf, budak, orang yang berhutang, sabilillah, dan ibnu sabil. (QS. At-Taubah: 60).",
    "Berikanlah hak waris kepada anak yatim, janganlah kalian memakan harta mereka, sesungguhnya yang demikian itu adalah dosa besar. (HR. An-Nisa: 10).",
    "Tinggalkanlah dunia bagi orang yang tidak memilikinya (yakni orang yang serakah), karena siapa yang berusaha untuk mendapatkannya, dia akan binasa. (HR. Tirmidzi).",
    "Segera bagilah warisan di antara ahli waris, karena sesungguhnya itu adalah bagian dari keadilan. (HR. Tirmidzi).",
    "Ibu dan ayah masing-masing mendapatkan seperenam dari harta warisan jika almarhum memiliki anak. (QS. An-Nisa: 11).",
    "Jika seseorang meninggal dan memiliki anak, kedua orang tuanya masing-masing mendapatkan seperenam dari harta warisan. (HR. Muslim).",
    "Berbuat adillah dalam pembagian warisan, sesungguhnya Allah mencintai orang-orang yang berbuat adil. (HR. Ahmad).",
  ];

  String getdailyTips() {
    final Random random = Random();
    return dailyTips[random.nextInt(dailyTips.length)];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.lightbulb_outline,
            color: kSecondaryColor,
          ),
          SizedBox(height: 50)
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              getdailyTips(),
              style: const TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Tutup",
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
